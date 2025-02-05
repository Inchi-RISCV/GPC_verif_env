
//============================================================================
// Copyright(c) 2022 , Inchi Technology Inc, All right reserved
// Company           : Inchi Technology .Inc
//============================================================================
// Project           :vpu
// File Name         :data_monitor.sv
// Author            :=huangxiaogang
// Email             :=huangxiaogang@inchitech.com
// Called by         :
// Reversion History :2023-09-04 14:45:34
// Reversion:        1.0
//============================================================================
// Description       :
//============================================================================

`ifndef _DATA_MONITOR_SV_
`define _DATA_MONITOR_SV_

	import "DPI-C" function inchi_difftest_init();
  import "DPI-C" function inchi_difftest_memcpy(string s);
  import "DPI-C" function inchi_difftest_exec();
  import "DPI-C" function difftest_raise_intr(input bit[63:0] coreid, input bit[63:0] no);
  import "DPI-C" function inchi_difftest_set_reg(input bit[63:0] arr[154]);
  import "DPI-C" function inchi_difftest_get_reg(output bit[63:0] arr[154]);


class data_monitor extends uvm_monitor; 
  `uvm_component_utils(data_monitor)

  virtual interface  data_if vif;

  uvm_analysis_port #(data_trans) analysis_port;
  uvm_analysis_port #(data_trans) analysis_port_trap;

  data_trans m_trans,m_trans_trap;
	bit spike_start;

  extern function new(string name, uvm_component parent);
  extern virtual function void build_phase (uvm_phase phase);
  extern virtual function void connect_phase(uvm_phase phase);
  extern task main_phase(uvm_phase phase);
  extern task do_mon();
  extern task do_mon_trap();

endclass : data_monitor 

function data_monitor::new(string name, uvm_component parent);

  super.new(name, parent);
  analysis_port = new("analysis_port", this);
  analysis_port_trap = new("analysis_port_trap", this);

endfunction : new

function void data_monitor::build_phase(uvm_phase phase);

  super.build_phase(phase);

endfunction : build_phase

function void data_monitor::connect_phase(uvm_phase phase);
  super.connect_phase(phase);

  if (!uvm_config_db #(virtual data_if)::get(this, "*", "data_vif", vif))
    `uvm_error("NOVIF",{"virtual interface must be set for: ",get_full_name(),".vif"})

endfunction : connect_phase

task data_monitor::main_phase(uvm_phase phase);

 bit [63:0] arry[154];

  `uvm_info(get_type_name(), "main_phase", UVM_HIGH)

  m_trans = data_trans::type_id::create("m_trans");
  m_trans_trap = data_trans::type_id::create("m_trans_trap");
	
	m_trans.verif_reg_gpr_arr = new[62];
  m_trans.verif_reg_fpr_arr = new[64];
  m_trans.verif_reg_vpr_arr = new[64];

  fork
  	#2000;
    while(1)begin
      @(posedge vif.clk);
      //riscv_step(1);
  		inchi_difftest_exec();
      //st_update_common_regs(common_arry);
  		inchi_difftest_get_reg(arry);
  		//`uvm_info(get_type_name(),$sformatf(" spike_start=%0h,prev_pc=%0h", spike_start,common_arry[0]),UVM_NONE);
    	if(arry[7] == 'h8000_0000)begin
    		`uvm_info(get_type_name(),$sformatf(" spike wait start,cur_pc=%0h", arry[7]),UVM_NONE);
        break;
    	end
    end
  join_none

	forever begin
		fork
  	do_mon();	
		do_mon_trap();
	  join
	end

endtask : main_phase


task data_monitor::do_mon();
	@(posedge vif.clk);
	if(!vif.rst_n & vif.verif_commit_valid[0])begin
    m_trans.verif_commit_valid      =      vif.verif_commit_valid;
    m_trans.verif_commit_currPc  =      vif.verif_commit_currPc;
    m_trans.verif_commit_insn    =      vif.verif_commit_insn;
    m_trans.verif_sim_halt             =      vif.verif_sim_halt;
    //m_trans.verif_trap_valid         =      vif.verif_trap_valid;
    //m_trans.verif_trap_code          =      vif.verif_trap_code;

		for(int i=0;i<62;i++)begin
    	m_trans.verif_reg_gpr_arr[i]   =      vif.verif_reg_gpr[`XLEN*i+:`XLEN];
		//`uvm_info(get_type_name(),$sformatf(" verif_reg_gpr_arr=%0h,verif_reg_gpr=%0h", m_trans.verif_reg_gpr_arr[i],vif.verif_reg_gpr[64*i+:64]),UVM_NONE);
	  end
    for(int i=0;i<64;i++)begin
    	m_trans.verif_reg_fpr_arr[i]   =      vif.verif_reg_fpr[`FLEN*i+:`FLEN];
    	m_trans.verif_reg_vpr_arr[i]   =      vif.verif_reg_vpr[`VLEN*i+:`VLEN];
	   end

    m_trans.verif_csr_mstatusWr  =      vif.verif_csr_mstatusWr;
    m_trans.verif_csr_mepcWr     =      vif.verif_csr_mepcWr;
    m_trans.verif_csr_mtvalWr    =      vif.verif_csr_mtvalWr;
    m_trans.verif_csr_mtvecWr    =      vif.verif_csr_mtvecWr;
    m_trans.verif_csr_mcauseWr   =      vif.verif_csr_mcauseWr;
    m_trans.verif_csr_mipWr      =      vif.verif_csr_mipWr;
    m_trans.verif_csr_mieWr      =      vif.verif_csr_mieWr;
    m_trans.verif_csr_mscratchWr =      vif.verif_csr_mscratchWr;
    m_trans.verif_csr_midelegWr  =      vif.verif_csr_midelegWr;
    m_trans.verif_csr_medelegWr  =      vif.verif_csr_medelegWr;
    m_trans.verif_csr_minstretWr =      vif.verif_csr_minstretWr;
    m_trans.verif_csr_sstatusWr  =      vif.verif_csr_sstatusWr;
    m_trans.verif_csr_sepcWr     =      vif.verif_csr_sepcWr;
    m_trans.verif_csr_stvalWr    =      vif.verif_csr_stvalWr;
    m_trans.verif_csr_stvecWr    =      vif.verif_csr_stvecWr;
    m_trans.verif_csr_scauseWr   =      vif.verif_csr_scauseWr;
    m_trans.verif_csr_satpWr     =      vif.verif_csr_satpWr;
    m_trans.verif_csr_sscratchWr =      vif.verif_csr_sscratchWr;
    m_trans.verif_csr_vtypeWr    =      vif.verif_csr_vtypeWr;
    m_trans.verif_csr_vcsrWr     =      vif.verif_csr_vcsrWr;
    m_trans.verif_csr_vlWr       =      vif.verif_csr_vlWr;
    m_trans.verif_csr_vstartWr   =      vif.verif_csr_vstartWr;
		analysis_port.write(m_trans);

		//if(spike_start)begin
		//	riscv_step(1);
		//	`uvm_info(get_type_name(),$sformatf(" spike step 1"),UVM_NONE);
	  //end
		//if(vif.verif_commit_prevPc == 'h8000_0000) begin
    //    m_trans.verif_commit_start   = 1;
		//		`uvm_info(get_type_name(),$sformatf(" commit start,cur_pc=%0h", m_trans.verif_commit_start),UVM_NONE);
	 // end
  

  end

endtask : do_mon


task data_monitor::do_mon_trap();
	@(posedge vif.clk);
	if(!vif.rst_n & vif.verif_trap_valid)begin
    m_trans_trap.verif_trap_valid     =      vif.verif_trap_valid;
    m_trans_trap.verif_trap_code        =      vif.verif_trap_code;
		analysis_port_trap.write(m_trans_trap);

	end

endtask : do_mon_trap
`endif // DATA_MONITOR_SV



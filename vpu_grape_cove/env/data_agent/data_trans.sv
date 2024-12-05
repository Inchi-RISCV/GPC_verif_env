//============================================================================
// Copyright(c) 2022 , Inchi Technology Inc, All right reserved
// Company           : Inchi Technology .Inc
//============================================================================
// Project           :vpu
// File Name         :data_trans.sv
// Author            :=huangxiaogang
// Email             :=huangxiaogang@inchitech.com
// Called by         :
// Reversion History :2023-09-04 14:45:34
// Reversion:        1.0
//============================================================================
// Description       :
//============================================================================

`ifndef _DATA_TRANS_SV_
`define _DATA_TRANS_SV_

class data_trans extends uvm_sequence_item; 
  `uvm_object_utils_begin(data_trans)
    `uvm_field_int(verif_commit_valid,UVM_ALL_ON)
    `uvm_field_int(verif_commit_currPc,UVM_ALL_ON)
    `uvm_field_int(verif_commit_insn,UVM_ALL_ON)
    `uvm_field_int(verif_sim_halt,UVM_ALL_ON)
    `uvm_field_int(verif_trap_valid,UVM_ALL_ON)
    `uvm_field_int(verif_trap_code,UVM_ALL_ON)
    `uvm_field_array_int(verif_reg_gpr_arr,UVM_ALL_ON)
    `uvm_field_array_int(verif_reg_fpr_arr,UVM_ALL_ON)
	  `uvm_field_array_int(verif_reg_vpr_arr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_mstatusWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_mepcWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_mtvalWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_mtvecWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_mcauseWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_mipWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_mieWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_mscratchWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_midelegWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_medelegWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_minstretWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_sstatusWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_sepcWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_stvalWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_stvecWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_scauseWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_satpWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_sscratchWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_vtypeWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_vcsrWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_vlWr,UVM_ALL_ON)
    `uvm_field_int(verif_csr_vstartWr,UVM_ALL_ON)
	`uvm_object_utils_end

  rand bit [`NRET-1:0]          verif_commit_valid;	
  rand bit [`NRET*`XLEN-1:0]    verif_commit_currPc;
  rand bit [`NRET*32-1:0]       verif_commit_insn;
  
  //sim signals
  rand bit                     verif_sim_halt;

  //trap signals
  rand bit                     verif_trap_valid;
  rand bit [`XLEN-1:0]         verif_trap_code;

  //reg signals
  rand bit [`XLEN-1:0] verif_reg_gpr_arr [] ;
  rand bit [`FLEN-1:0] verif_reg_fpr_arr [] ;
  rand bit [`VLEN-1:0] verif_reg_vpr_arr [] ;	

  //csr signals
  rand bit [`NRET*`XLEN-1:0]   verif_csr_mstatusWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_mepcWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_mtvalWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_mtvecWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_mcauseWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_mipWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_mieWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_mscratchWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_midelegWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_medelegWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_minstretWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_sstatusWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_sepcWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_stvalWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_stvecWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_scauseWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_satpWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_sscratchWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_vtypeWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_vcsrWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_vlWr;
  rand bit [`NRET*`XLEN-1:0]   verif_csr_vstartWr;


  extern function new(string name = "data_trans");
  extern function string sprint_low(data_trans act_trans);
  extern function string sprint_high(data_trans act_trans);

	function bit my_compare_low(data_trans exp_trans);
  	return (this.verif_commit_valid[0] == exp_trans.verif_commit_valid)&&
					 (this.verif_commit_currPc[63:0] == exp_trans.verif_commit_currPc[63:0])&&
   				 (this.verif_commit_insn[31:0] == exp_trans.verif_commit_insn)&&
   				 (this.verif_sim_halt == exp_trans.verif_sim_halt)&&
   				 (this.verif_trap_valid == exp_trans.verif_trap_valid)&&
   				 (this.verif_trap_code == exp_trans.verif_trap_code)&&
   				 (this.verif_reg_gpr_arr[0:30] == exp_trans.verif_reg_gpr_arr)&&
   				 (this.verif_reg_fpr_arr[0:31] == exp_trans.verif_reg_fpr_arr)&&
   				 (this.verif_reg_vpr_arr[0:31] == exp_trans.verif_reg_vpr_arr)&&
					 (this.verif_csr_mstatusWr[63:0] == exp_trans.verif_csr_mstatusWr) &&
					 (this.verif_csr_mepcWr[63:0] == exp_trans.verif_csr_mepcWr) &&
					 (this.verif_csr_mtvalWr[63:0] == exp_trans.verif_csr_mtvalWr) &&
					 (this.verif_csr_mtvecWr[63:0] == exp_trans.verif_csr_mtvecWr) &&
					 (this.verif_csr_mcauseWr[63:0] == exp_trans.verif_csr_mcauseWr) &&
					 (this.verif_csr_mipWr[63:0] == exp_trans.verif_csr_mipWr) &&
					 (this.verif_csr_mieWr[63:0] == exp_trans.verif_csr_mieWr) &&
					 (this.verif_csr_mscratchWr[63:0] == exp_trans.verif_csr_mscratchWr) &&
					 (this.verif_csr_midelegWr[63:0] == exp_trans.verif_csr_midelegWr) &&
					 (this.verif_csr_medelegWr[63:0] == exp_trans.verif_csr_medelegWr) &&
					 (this.verif_csr_minstretWr[63:0] == exp_trans.verif_csr_minstretWr) &&
					 (this.verif_csr_sstatusWr[63:0] == exp_trans.verif_csr_sstatusWr) &&
					 (this.verif_csr_sepcWr[63:0] == exp_trans.verif_csr_sepcWr) &&
					 (this.verif_csr_stvalWr[63:0] == exp_trans.verif_csr_stvalWr) &&
					 (this.verif_csr_stvecWr[63:0] == exp_trans.verif_csr_stvecWr) &&
					 (this.verif_csr_scauseWr[63:0] == exp_trans.verif_csr_scauseWr) &&
					 (this.verif_csr_satpWr[63:0] == exp_trans.verif_csr_satpWr) &&
					 (this.verif_csr_sscratchWr[63:0] == exp_trans.verif_csr_sscratchWr) &&
					 (this.verif_csr_vtypeWr[63:0] == exp_trans.verif_csr_vtypeWr) &&
					 (this.verif_csr_vcsrWr[63:0] == exp_trans.verif_csr_vcsrWr) &&
					 (this.verif_csr_vlWr[63:0] == exp_trans.verif_csr_vlWr) &&
					 (this.verif_csr_vstartWr[63:0] == exp_trans.verif_csr_vstartWr); 
	endfunction


	function bit my_compare_high(data_trans exp_trans);
  	return (this.verif_commit_valid[1] == exp_trans.verif_commit_valid)&&
					 (this.verif_commit_currPc[127:64] == exp_trans.verif_commit_currPc[39:0])&&
   				 (this.verif_commit_insn[63:32] == exp_trans.verif_commit_insn)&&
   				 (this.verif_sim_halt == exp_trans.verif_sim_halt)&&
   				 (this.verif_trap_valid == exp_trans.verif_trap_valid)&&
   				 (this.verif_trap_code == exp_trans.verif_trap_code)&&
   				 (this.verif_reg_gpr_arr[31:61] == exp_trans.verif_reg_gpr_arr)&&
   				 (this.verif_reg_fpr_arr[32:63] == exp_trans.verif_reg_fpr_arr)&&
   				 (this.verif_reg_vpr_arr[32:63] == exp_trans.verif_reg_vpr_arr)&&
					 (this.verif_csr_mstatusWr[127:64] == exp_trans.verif_csr_mstatusWr) &&
					 (this.verif_csr_mepcWr[127:64] == exp_trans.verif_csr_mepcWr) &&
					 (this.verif_csr_mtvalWr[127:64] == exp_trans.verif_csr_mtvalWr) &&
					 (this.verif_csr_mtvecWr[127:64] == exp_trans.verif_csr_mtvecWr) &&
					 (this.verif_csr_mcauseWr[127:64] == exp_trans.verif_csr_mcauseWr) &&
					 (this.verif_csr_mipWr[127:64] == exp_trans.verif_csr_mipWr) &&
					 (this.verif_csr_mieWr[127:64] == exp_trans.verif_csr_mieWr) &&
					 (this.verif_csr_mscratchWr[127:64] == exp_trans.verif_csr_mscratchWr) &&
					 (this.verif_csr_midelegWr[127:64] == exp_trans.verif_csr_midelegWr) &&
					 (this.verif_csr_medelegWr[127:64] == exp_trans.verif_csr_medelegWr) &&
					 (this.verif_csr_minstretWr[127:64] == exp_trans.verif_csr_minstretWr) &&
					 (this.verif_csr_sstatusWr[127:64] == exp_trans.verif_csr_sstatusWr) &&
					 (this.verif_csr_sepcWr[127:64] == exp_trans.verif_csr_sepcWr) &&
					 (this.verif_csr_stvalWr[127:64] == exp_trans.verif_csr_stvalWr) &&
					 (this.verif_csr_stvecWr[127:64] == exp_trans.verif_csr_stvecWr) &&
					 (this.verif_csr_scauseWr[127:64] == exp_trans.verif_csr_scauseWr) &&
					 (this.verif_csr_satpWr[127:64] == exp_trans.verif_csr_satpWr) &&
					 (this.verif_csr_sscratchWr[127:64] == exp_trans.verif_csr_sscratchWr) &&
					 (this.verif_csr_vtypeWr[127:64] == exp_trans.verif_csr_vtypeWr) &&
					 (this.verif_csr_vcsrWr[127:64] == exp_trans.verif_csr_vcsrWr) &&
					 (this.verif_csr_vlWr[127:64] == exp_trans.verif_csr_vlWr) &&
					 (this.verif_csr_vstartWr[127:64] == exp_trans.verif_csr_vstartWr); 
	endfunction


endclass : data_trans

function data_trans::new(string name = "data_trans");
  super.new(name);
endfunction : new


function string data_trans::sprint_low(data_trans act_trans);
  $display(" verif_commit_valid    :'h%0b ",act_trans.verif_commit_valid[0]);
  $display(" verif_commit_currPc   :'h%0h ",act_trans.verif_commit_currPc[63:0]);
  $display(" verif_commit_insn     :'h%0h ",act_trans.verif_commit_insn[31:0]);
  $display(" verif_sim_halt        :'h%0h ",act_trans.verif_sim_halt);
  $display(" verif_trap_valid      :'h%0h ",act_trans.verif_trap_valid);
  $display(" verif_trap_code       :'h%0h ",act_trans.verif_trap_code);
		for(int i = 0;i <31; i++)begin
  		$display(" verif_reg_gpr_arr[%0d]  :'h%0h ",i,act_trans.verif_reg_gpr_arr[i]);
		end
		for(int j = 0;j <32; j++)begin
  		$display(" verif_reg_fpr_arr[%0d]  :'h%0h ",j,act_trans.verif_reg_fpr_arr[j]);
		end
		for(int k = 0;k <32; k++)begin
  		$display(" verif_reg_vpr_arr[%0d]  :'h%0h ",k,act_trans.verif_reg_vpr_arr[k]);
		end
  $display(" verif_csr_mstatus     :'h%0h ",act_trans.verif_csr_mstatusWr[63:0]);
  $display(" verif_csr_mepc        :'h%0h ",act_trans.verif_csr_mepcWr[63:0]);
  $display(" verif_csr_mtval       :'h%0h ",act_trans.verif_csr_mtvalWr[63:0]);
  $display(" verif_csr_mtvec       :'h%0h ",act_trans.verif_csr_mtvecWr[63:0]);
  $display(" verif_csr_mcause      :'h%0h ",act_trans.verif_csr_mcauseWr[63:0]);
  $display(" verif_csr_mip         :'h%0h ",act_trans.verif_csr_mipWr[63:0]);
  $display(" verif_csr_mie         :'h%0h ",act_trans.verif_csr_mieWr[63:0]);
  $display(" verif_csr_mscratch    :'h%0h ",act_trans.verif_csr_mscratchWr[63:0]);
  $display(" verif_csr_mideleg     :'h%0h ",act_trans.verif_csr_midelegWr[63:0]);
  $display(" verif_csr_medeleg     :'h%0h ",act_trans.verif_csr_medelegWr[63:0]);
  $display(" verif_csr_minstret    :'h%0h ",act_trans.verif_csr_minstretWr[63:0]);
  $display(" verif_csr_sstatus     :'h%0h ",act_trans.verif_csr_sstatusWr[63:0]);
  $display(" verif_csr_sepc        :'h%0h ",act_trans.verif_csr_sepcWr[63:0]);
  $display(" verif_csr_stval       :'h%0h ",act_trans.verif_csr_stvalWr[63:0]);
  $display(" verif_csr_stvec       :'h%0h ",act_trans.verif_csr_stvecWr[63:0]);
  $display(" verif_csr_scause      :'h%0h ",act_trans.verif_csr_scauseWr[63:0]);
  $display(" verif_csr_satp        :'h%0h ",act_trans.verif_csr_satpWr[63:0]);
  $display(" verif_csr_sscratch    :'h%0h ",act_trans.verif_csr_sscratchWr[63:0]);
  $display(" verif_csr_vtype       :'h%0h ",act_trans.verif_csr_vtypeWr[63:0]);
  $display(" verif_csr_vcsr        :'h%0h ",act_trans.verif_csr_vcsrWr[63:0]);
  $display(" verif_csr_vl          :'h%0h ",act_trans.verif_csr_vlWr[63:0]);
  $display(" verif_csr_vstart      :'h%0h ",act_trans.verif_csr_vstartWr[63:0]);
	
endfunction

function string data_trans::sprint_high(data_trans act_trans);
  $display(" verif_commit_valid    :'h%0b ",act_trans.verif_commit_valid[1]);
  $display(" verif_commit_currPc   :'h%0h ",act_trans.verif_commit_currPc[127:64]);
  $display(" verif_commit_insn     :'h%0h ",act_trans.verif_commit_insn[63:32]);
  $display(" verif_sim_halt        :'h%0h ",act_trans.verif_sim_halt);
  $display(" verif_trap_valid      :'h%0h ",act_trans.verif_trap_valid);
  $display(" verif_trap_code       :'h%0h ",act_trans.verif_trap_code);
	for(int i = 31;i <62; i++)begin
  	$display(" verif_reg_gpr_arr[%0d]  :'h%0h ",i-31,act_trans.verif_reg_gpr_arr[i]);
	end
	for(int j = 32;j <64; j++)begin
  	$display(" verif_reg_fpr_arr[%0d]  :'h%0h ",j-32,act_trans.verif_reg_fpr_arr[j]);
	end
	for(int k = 32;k <64; k++)begin
  	$display(" verif_reg_vpr_arr[%0d]  :'h%0h ",k-32,act_trans.verif_reg_vpr_arr[k]);
	end
  $display(" verif_csr_mstatus     :'h%0h ",act_trans.verif_csr_mstatusWr[127:64]);
  $display(" verif_csr_mepc        :'h%0h ",act_trans.verif_csr_mepcWr[127:64]);
  $display(" verif_csr_mtval       :'h%0h ",act_trans.verif_csr_mtvalWr[127:64]);
  $display(" verif_csr_mtvec       :'h%0h ",act_trans.verif_csr_mtvecWr[127:64]);
  $display(" verif_csr_mcause      :'h%0h ",act_trans.verif_csr_mcauseWr[127:64]);
  $display(" verif_csr_mip         :'h%0h ",act_trans.verif_csr_mipWr[127:64]);
  $display(" verif_csr_mie         :'h%0h ",act_trans.verif_csr_mieWr[127:64]);
  $display(" verif_csr_mscratch    :'h%0h ",act_trans.verif_csr_mscratchWr[127:64]);
  $display(" verif_csr_mideleg     :'h%0h ",act_trans.verif_csr_midelegWr[127:64]);
  $display(" verif_csr_medeleg     :'h%0h ",act_trans.verif_csr_medelegWr[127:64]);
  $display(" verif_csr_minstret    :'h%0h ",act_trans.verif_csr_minstretWr[127:64]);
  $display(" verif_csr_sstatus     :'h%0h ",act_trans.verif_csr_sstatusWr[127:64]);
  $display(" verif_csr_sepc        :'h%0h ",act_trans.verif_csr_sepcWr[127:64]);
  $display(" verif_csr_stval       :'h%0h ",act_trans.verif_csr_stvalWr[127:64]);
  $display(" verif_csr_stvec       :'h%0h ",act_trans.verif_csr_stvecWr[127:64]);
  $display(" verif_csr_scause      :'h%0h ",act_trans.verif_csr_scauseWr[127:64]);
  $display(" verif_csr_satp        :'h%0h ",act_trans.verif_csr_satpWr[127:64]);
  $display(" verif_csr_sscratch    :'h%0h ",act_trans.verif_csr_sscratchWr[127:64]);
  $display(" verif_csr_vtype       :'h%0h ",act_trans.verif_csr_vtypeWr[127:64]);
  $display(" verif_csr_vcsr        :'h%0h ",act_trans.verif_csr_vcsrWr[127:64]);
  $display(" verif_csr_vl          :'h%0h ",act_trans.verif_csr_vlWr[127:64]);
  $display(" verif_csr_vstart      :'h%0h ",act_trans.verif_csr_vstartWr[127:64]);
	
endfunction
`endif // DATA_TRANS_SV



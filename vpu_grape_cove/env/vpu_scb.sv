//============================================================================
// Copyright(c) 2022 , Inchi Technology Inc, All right reserved
// Company           : Inchi Technology .Inc
//============================================================================
// Project           :vpu
// File Name         :vpu_scb.sv
// Author            :=huangxiaogang
// Email             :=huangxiaogang@inchitech.com
// Called by         :
// Reversion History :2023-09-04 14:45:34
// Reversion:        1.0
//============================================================================
// Description       :
//============================================================================

`ifndef _VPU_SCB_SV_
`define _VPU_SCB_SV_

class vpu_scb extends uvm_component;
  `uvm_component_utils(vpu_scb)
	uvm_blocking_get_port #(data_trans) data_agent_port;
	uvm_blocking_get_port #(data_trans) data_agent_port_trap;
  extern function new(string name, uvm_component parent);
  extern task main_phase(uvm_phase phase);
	extern task end_sim_check();
	extern task commit_check();
	extern task do_exp_tr();
  extern task init_spike_info(data_trans data_act_tr);
  extern task init_spike_info_high(data_trans data_act_tr);
  extern task init_spike_info_low(data_trans data_act_tr);

	bit     instr_finish;
	static event time_out_refresh;

	data_trans  data_act_tr,data_exp_tr,data_act_tr_trap;
	bit comp_pass_low,comp_pass_high;


endclass : vpu_scb 

function vpu_scb::new(string name, uvm_component parent);
  super.new(name, parent);
	data_agent_port = new("data_agent_port",this);
	data_agent_port_trap = new("data_agent_port_trap",this);
	
endfunction : new

task vpu_scb::main_phase(uvm_phase phase);
	phase.raise_objection(this);

	fork
		commit_check();
		end_sim_check();
	join_any

	`uvm_info(get_type_name(),$sformatf(" scb finish! "),UVM_NONE);

	phase.drop_objection(this);

endtask : main_phase


task vpu_scb::end_sim_check();

	int time_cnt;
  fork

    while(1) begin
    	//#200ns;
    	if(instr_finish) begin
    		break;
    	end
    	#10;
    end

    while(1) begin
    	@time_out_refresh;
    	time_cnt=0;
    	`uvm_info(get_type_name(),$sformatf("get commit data"),UVM_DEBUG);
    end
    while(1) begin
    	@(posedge tb_top.clock);
    	time_cnt++;
    	`uvm_info(get_type_name(),$sformatf("time_cnt:%0d",time_cnt),UVM_DEBUG);
    end

    while(1) begin
    	@(posedge tb_top.clock);
    	if(time_cnt>=2000)begin
    	  `uvm_error(get_type_name(),$sformatf("commit info timeout ! "));
    	break;
      end
    end

  join_any




endtask


task vpu_scb::commit_check();

  bit dut_start_cp;
	bit [31:0] commit_num;
  bit ex_npc_msb_low;
  bit ex_npc_msb_high;
	bit [24:0] ex_npc_a_low;
	bit [24:0] ex_npc_a_high;
  bit ex_npc_msb_epc_low;
  bit ex_npc_msb_epc_high;
	bit [24:0] ex_npc_a_epc_low;
	bit [24:0] ex_npc_a_epc_high;
  // 127:64 pc  
	


	//`uvm_info(get_type_name(),$sformatf(" start spike! "),UVM_NONE);
 
  data_act_tr = new();
  data_exp_tr = new();
  data_act_tr_trap = new();


  fork
		
		while(1) begin

			data_agent_port_trap.get(data_act_tr_trap);
			
			if(data_act_tr_trap.verif_trap_valid == 1)begin
				if(data_act_tr_trap.verif_trap_code[63] == 1)begin
					difftest_raise_intr(64'b0, data_act_tr_trap.verif_trap_code);
				end
				else begin
		     inchi_difftest_exec();
				end
			end
		end

		while(1) begin

			data_agent_port.get(data_act_tr);
			


			if(data_act_tr.verif_commit_valid) begin

				//data_act_tr.verif_csr_mtvalWr[63:0] = data_act_tr.verif_csr_mtvalWr[63:0]& 64'hFF_FFFF_FFFF;
				//data_act_tr.verif_csr_mtvalWr[127:64] = data_act_tr.verif_csr_mtvalWr[127:64]& 64'hFF_FFFF_FFFF;
				
				//data_act_tr.verif_csr_mtvalWr = data_act_tr.verif_csr_mtvalWr& 64'hFF_FFFF_FFFF;
				//data_act_tr.verif_csr_mstatusWr = data_act_tr.verif_csr_mstatusWr & 32'h7FFF_9FFF;
        //data_act_tr.verif_csr_sstatusWr = data_act_tr.verif_csr_sstatusWr & 32'h7FFF_9FFF;
				
				->time_out_refresh;
        //finsh 
		    if( data_act_tr.verif_sim_halt == 1) begin
		    	`uvm_info(get_type_name(),$sformatf("instr test finish! "),UVM_NONE);
          instr_finish =1;
		    	//break;
		    end


		    if(data_act_tr.verif_commit_currPc[40:0] == 'h8000_0000) begin
		    	dut_start_cp = 1;
		    	init_spike_info(data_act_tr);
				  //force tb_top.testHarness.SimDTM.debug_req_bits_data[31:0] = 0;
				  //force tb_top.testHarness.SimDTM.debug_req_bits_op[1:0] = 0;
				  //force tb_top.testHarness.SimDTM.debug_req_bits_addr[6:0] = 0;
				  //force tb_top.testHarness.SimDTM.debug_req_valid = 0;
		    end

		    if(dut_start_cp & instr_finish!=1) begin
         	//`uvm_info(get_type_name(),{" scb get act data : ",data_act_tr.sprint},UVM_NONE);
		       if(data_act_tr.verif_commit_valid[0] == 1)begin
						 if(data_act_tr.verif_commit_insn[31:0] == 32'hb00027f3 || data_act_tr.verif_commit_insn[31:0] == 32'hb0002573 || data_act_tr.verif_commit_insn[31:0] == 32'hb0002773)begin
					 			inchi_difftest_exec();
		    	      init_spike_info_low(data_act_tr);
		       		  do_exp_tr();
		     	 		//data_act_tr.sprint_low(data_act_tr);
		     	 		//data_act_tr.sprint_low(data_exp_tr);

						 end
						 else begin
					 		inchi_difftest_exec();
		       		do_exp_tr();
					 		//inchi_difftest_exec();
		       		//do_exp_tr();
							ex_npc_a_low =  data_exp_tr.verif_commit_currPc[63:39];
							ex_npc_msb_low = (ex_npc_a_low == 25'h0 || &ex_npc_a_low) ? data_exp_tr.verif_commit_currPc[39] : ~data_exp_tr.verif_commit_currPc[38];
        			data_exp_tr.verif_commit_currPc[39:0] = {ex_npc_msb_low,data_exp_tr.verif_commit_currPc[38:0]};
							
							ex_npc_a_epc_low =  data_exp_tr.verif_csr_mepcWr[63:39];
							ex_npc_msb_epc_low = (ex_npc_a_epc_low == 25'h0 || &ex_npc_a_epc_low) ? data_exp_tr.verif_csr_mepcWr[39] : ~data_exp_tr.verif_csr_mepcWr[38];
        			data_exp_tr.verif_csr_mepcWr[39:0] = {ex_npc_msb_epc_low,data_exp_tr.verif_csr_mepcWr[38:0]};

		     	 		comp_pass_low = data_act_tr.my_compare_low(data_exp_tr);
		     	 		commit_num ++;

		     	 		if(comp_pass_low)begin
           		 	`uvm_info(get_type_name(),$sformatf(" dut and spike compare success,currPc=%0h,commit_num=%0d ",data_act_tr.verif_commit_currPc[63:0],commit_num),UVM_NONE);
		     	 		end
		     	 		else begin

         	 		  `uvm_info(get_type_name(),(" scb get act data : -------------- "),UVM_NONE);
		     	 			data_act_tr.sprint_low(data_act_tr);
								//`uvm_info(get_type_name(),{" scb get exp data : ",data_exp_tr.sprint},UVM_NONE);
								`uvm_info(get_type_name(),(" scb get exp data : -------------- "),UVM_NONE);
		     	 			data_act_tr.sprint_low(data_exp_tr);
		     	 			`uvm_error(get_type_name(),$sformatf(" dut and spike compare fail,currPc=%0h,commit_num=%0d ",data_act_tr.verif_commit_currPc[63:0],commit_num));

		     	 		end// end else if comp pass
						 end 
					 end

		       if(data_act_tr.verif_commit_valid[1] == 1)begin
						 if(data_act_tr.verif_commit_insn[63:32] == 32'hb00027f3 || data_act_tr.verif_commit_insn[63:32] == 32'hb0002573 || data_act_tr.verif_commit_insn[63:32] == 32'hb0002773)begin
					 		inchi_difftest_exec();
		    	    init_spike_info_high(data_act_tr);
		       		do_exp_tr();
		     	 		//data_act_tr.sprint_high(data_act_tr);
		     	 		//data_act_tr.sprint_low(data_exp_tr);
						 end
						 else begin
					 		inchi_difftest_exec();
		       		do_exp_tr();
							ex_npc_a_high =  data_exp_tr.verif_commit_currPc[63:39];
							ex_npc_msb_high = (ex_npc_a_high == 25'h0 || &ex_npc_a_high) ? data_exp_tr.verif_commit_currPc[39] : ~data_exp_tr.verif_commit_currPc[38];
        			data_exp_tr.verif_commit_currPc[39:0] = {ex_npc_msb_high,data_exp_tr.verif_commit_currPc[38:0]};
							
							ex_npc_a_epc_high =  data_exp_tr.verif_csr_mepcWr[63:39];
							ex_npc_msb_epc_high = (ex_npc_a_epc_high == 25'h0 || &ex_npc_a_epc_high) ? data_exp_tr.verif_csr_mepcWr[39] : ~data_exp_tr.verif_csr_mepcWr[38];
        			data_exp_tr.verif_csr_mepcWr[39:0] = {ex_npc_msb_epc_high,data_exp_tr.verif_csr_mepcWr[38:0]};
							

		     	 		comp_pass_high = data_act_tr.my_compare_high(data_exp_tr);
		     	 		commit_num ++;

		     	 		if(comp_pass_high)begin
           		 	`uvm_info(get_type_name(),$sformatf(" dut and spike compare success,currPc=%0h,commit_num=%0d ",data_act_tr.verif_commit_currPc[127:64],commit_num),UVM_NONE);
		     	 		end
		     	 		else begin

         	 		  `uvm_info(get_type_name(),(" scb get act data : -------------- "),UVM_NONE);
		     	 			data_act_tr.sprint_high(data_act_tr);
								`uvm_info(get_type_name(),(" scb get exp data : -------------- "),UVM_NONE);
		     	 			data_act_tr.sprint_low(data_exp_tr);
		     	 			`uvm_error(get_type_name(),$sformatf(" dut and spike compare fail,currPc=%0h,commit_num=%0d ",data_act_tr.verif_commit_currPc[127:64],commit_num));

		     	 		end// end else if comp pass
						 end
					 end

		    end //end if dut_start_cp
			end//end if valid
		//join		
		end //end while 1

		


	join


endtask

task vpu_scb::do_exp_tr();
 

  bit [63:0] spike_arry[154];
  /*
  struct diff_context_t {
  word_t gpr[32]; 122-153
  word_t fpr[32]; 90-121
  vector128_t vpr[32]; 26-89
  uint64_t priv; 25
  uint64_t mstatus; 24
  uint64_t sstatus; 23
  uint64_t mepc; 22
  uint64_t sepc; 21
  uint64_t mtval; 20
  uint64_t stval; 19
  uint64_t mtvec; 18
  uint64_t stvec; 17
  uint64_t mcause; 16
  uint64_t scause; 15
  uint64_t satp; 14
  uint64_t mip; 13
  uint64_t mie; 12
  uint64_t mscratch; 11
  uint64_t sscratch; 10
  uint64_t mideleg; 9
  uint64_t medeleg; 8
  uint64_t pc; 7
  uint64_t pre_pc; 6
  uint64_t minstret; 5
  uint64_t vtype; 4
  uint64_t vcsr; 3
  uint64_t vl; 2
  uint64_t vstart; 1
  uint64_t instruction; 0
  };
	*/

  inchi_difftest_get_reg(spike_arry);
  `uvm_info(get_type_name(),$sformatf(" get spike value spike_arry=%p", spike_arry),UVM_HIGH);

//if(spike_arry[6] == 'h8000_00e0)begin
//  inchi_difftest_exec();
//  inchi_difftest_get_reg(spike_arry);
//  `uvm_info(get_type_name(),$sformatf(" skip spike  spike_arry=%p", spike_arry),UVM_NONE);
//end


	data_exp_tr.verif_reg_gpr_arr = new[31];
  data_exp_tr.verif_reg_fpr_arr = new[32];
  data_exp_tr.verif_reg_vpr_arr = new[32];

    data_exp_tr.verif_commit_valid   =      1;		
    //data_exp_tr.verif_commit_start   =      1;
    data_exp_tr.verif_commit_currPc  =      spike_arry[6];
    data_exp_tr.verif_commit_insn    =      spike_arry[0];
    data_exp_tr.verif_sim_halt       =      0;//tie 0
    data_exp_tr.verif_trap_valid     =      0;//tie 0
    data_exp_tr.verif_trap_code      =      0;//tie 0

		for(int i=0;i<31;i++)begin
    	data_exp_tr.verif_reg_gpr_arr[i]   =      spike_arry[i+122+1];
		//`uvm_info(get_type_name(),$sformatf(" verif_reg_gpr_arr=%0h,verif_reg_gpr=%0h", data_exp_tr.verif_reg_gpr_arr[i],vif.verif_reg_gpr[64*i+:64]),UVM_NONE);
	  end
    for(int i=0;i<32;i++)begin
    	data_exp_tr.verif_reg_fpr_arr[i]   =      spike_arry[90+i];

    	data_exp_tr.verif_reg_vpr_arr[i]   =      {spike_arry[2*i+27],spike_arry[2*i+26]};
	   end




    data_exp_tr.verif_csr_mstatusWr  =      spike_arry[24]; // bit 13,14,31 not care
    data_exp_tr.verif_csr_mepcWr     =      spike_arry[22];
    data_exp_tr.verif_csr_mtvalWr    =      spike_arry[20];
    data_exp_tr.verif_csr_mtvecWr    =      spike_arry[18];
    data_exp_tr.verif_csr_mcauseWr   =      spike_arry[16];
    data_exp_tr.verif_csr_mipWr      =      spike_arry[13];//todoy
    data_exp_tr.verif_csr_mieWr      =      spike_arry[12];
    data_exp_tr.verif_csr_mscratchWr =      spike_arry[11];
    data_exp_tr.verif_csr_midelegWr  =      spike_arry[9];
    data_exp_tr.verif_csr_medelegWr  =      spike_arry[8];
    data_exp_tr.verif_csr_minstretWr =      spike_arry[5];//todo
    data_exp_tr.verif_csr_sstatusWr  =      spike_arry[23];
    data_exp_tr.verif_csr_sepcWr     =      spike_arry[21];
    data_exp_tr.verif_csr_stvalWr    =      spike_arry[19];
    data_exp_tr.verif_csr_stvecWr    =      spike_arry[17];
    data_exp_tr.verif_csr_scauseWr   =      spike_arry[15];
    data_exp_tr.verif_csr_satpWr     =      spike_arry[14];
    data_exp_tr.verif_csr_sscratchWr =      spike_arry[10];
    data_exp_tr.verif_csr_vtypeWr    =      spike_arry[4];
    data_exp_tr.verif_csr_vcsrWr     =      spike_arry[3];
    data_exp_tr.verif_csr_vlWr       =      spike_arry[2];
    data_exp_tr.verif_csr_vstartWr   =      spike_arry[1];



endtask



task vpu_scb::init_spike_info(data_trans data_act_tr);

    bit [63:0] spike_arry[154];

    spike_arry[6] = data_act_tr.verif_commit_currPc[63:0];
    spike_arry[0] = data_act_tr.verif_commit_insn[63:0];

		for(int i=0;i<31;i++)begin
    	spike_arry[i+122+1] = data_act_tr.verif_reg_gpr_arr[i];
		//`uvm_info(get_type_name(),$sformatf(" verif_reg_gpr_arr=%0h,verif_reg_gpr=%0h", data_exp_tr.verif_reg_gpr_arr[i],vif.verif_reg_gpr[64*i+:64]),UVM_NONE);
	  end
    for(int i=0;i<32;i++)begin
    	spike_arry[90+i] = data_act_tr.verif_reg_fpr_arr[i];

			spike_arry[2*i+26] = data_act_tr.verif_reg_vpr_arr[i][63:0];
			spike_arry[2*i+27] = data_act_tr.verif_reg_vpr_arr[i][127:64];
	   end



  spike_arry[24] =   data_act_tr.verif_csr_mstatusWr[63:0]  ;      
  spike_arry[22] =   data_act_tr.verif_csr_mepcWr[63:0]     ;      
  spike_arry[20] =   data_act_tr.verif_csr_mtvalWr[63:0]    ;      
  spike_arry[18] =   data_act_tr.verif_csr_mtvecWr[63:0]    ;      
  spike_arry[16] =   data_act_tr.verif_csr_mcauseWr[63:0]   ;      
  spike_arry[13] =   data_act_tr.verif_csr_mipWr[63:0]      ;      
  spike_arry[12] =   data_act_tr.verif_csr_mieWr[63:0]      ;      
  spike_arry[11] =   data_act_tr.verif_csr_mscratchWr[63:0] ;      
  spike_arry[9]  =   data_act_tr.verif_csr_midelegWr[63:0]  ;      
  spike_arry[8]  =   data_act_tr.verif_csr_medelegWr[63:0]  ;      
  spike_arry[5]  =   data_act_tr.verif_csr_minstretWr[63:0] ;      
  spike_arry[23] =   data_act_tr.verif_csr_sstatusWr[63:0]  ;      
  spike_arry[21] =   data_act_tr.verif_csr_sepcWr[63:0]     ;      
  spike_arry[19] =   data_act_tr.verif_csr_stvalWr[63:0]    ;      
  spike_arry[17] =   data_act_tr.verif_csr_stvecWr[63:0]    ;      
  spike_arry[15] =   data_act_tr.verif_csr_scauseWr[63:0]   ;      
  spike_arry[14] =   data_act_tr.verif_csr_satpWr[63:0]     ;      
  spike_arry[10] =   data_act_tr.verif_csr_sscratchWr[63:0] ;      
  spike_arry[4]  =   data_act_tr.verif_csr_vtypeWr[63:0]    ;      
  spike_arry[3]  =   data_act_tr.verif_csr_vcsrWr[63:0]     ;      
  spike_arry[2]  =   data_act_tr.verif_csr_vlWr[63:0]       ;      
  spike_arry[1]  =   data_act_tr.verif_csr_vstartWr[63:0]   ;      
  //`uvm_info(get_type_name(),$sformatf(" get set_reg initial value %0h",data_act_tr.verif_csr_medelegWr ),UVM_NONE);
  `uvm_info(get_type_name(),$sformatf(" before set reg %0h",spike_arry[5] ),UVM_NONE);

	inchi_difftest_set_reg(spike_arry);
	
endtask

task vpu_scb::init_spike_info_low(data_trans data_act_tr);

    bit [63:0] spike_arry[154];

    spike_arry[6] = data_act_tr.verif_commit_currPc[63:0];
    spike_arry[0] = data_act_tr.verif_commit_insn[63:0];

		for(int i=0;i<31;i++)begin
    	spike_arry[i+122+1] = data_act_tr.verif_reg_gpr_arr[i];
		//`uvm_info(get_type_name(),$sformatf(" verif_reg_gpr_arr=%0h,verif_reg_gpr=%0h", data_exp_tr.verif_reg_gpr_arr[i],vif.verif_reg_gpr[64*i+:64]),UVM_NONE);
	  end
    for(int i=0;i<32;i++)begin
    	spike_arry[90+i] = data_act_tr.verif_reg_fpr_arr[i];

			spike_arry[2*i+26] = data_act_tr.verif_reg_vpr_arr[i][63:0];
			spike_arry[2*i+27] = data_act_tr.verif_reg_vpr_arr[i][127:64];
	   end



  spike_arry[24] =   data_act_tr.verif_csr_mstatusWr[63:0]  ;      
  spike_arry[22] =   data_act_tr.verif_csr_mepcWr[63:0]     ;      
  spike_arry[20] =   data_act_tr.verif_csr_mtvalWr[63:0]    ;      
  spike_arry[18] =   data_act_tr.verif_csr_mtvecWr[63:0]    ;      
  spike_arry[16] =   data_act_tr.verif_csr_mcauseWr[63:0]   ;      
  spike_arry[13] =   data_act_tr.verif_csr_mipWr[63:0]      ;      
  spike_arry[12] =   data_act_tr.verif_csr_mieWr[63:0]      ;      
  spike_arry[11] =   data_act_tr.verif_csr_mscratchWr[63:0] ;      
  spike_arry[9]  =   data_act_tr.verif_csr_midelegWr[63:0]  ;      
  spike_arry[8]  =   data_act_tr.verif_csr_medelegWr[63:0]  ;      
  spike_arry[5]  =   data_act_tr.verif_csr_minstretWr[63:0] + 1;      
  spike_arry[23] =   data_act_tr.verif_csr_sstatusWr[63:0]  ;      
  spike_arry[21] =   data_act_tr.verif_csr_sepcWr[63:0]     ;      
  spike_arry[19] =   data_act_tr.verif_csr_stvalWr[63:0]    ;      
  spike_arry[17] =   data_act_tr.verif_csr_stvecWr[63:0]    ;      
  spike_arry[15] =   data_act_tr.verif_csr_scauseWr[63:0]   ;      
  spike_arry[14] =   data_act_tr.verif_csr_satpWr[63:0]     ;      
  spike_arry[10] =   data_act_tr.verif_csr_sscratchWr[63:0] ;      
  spike_arry[4]  =   data_act_tr.verif_csr_vtypeWr[63:0]    ;      
  spike_arry[3]  =   data_act_tr.verif_csr_vcsrWr[63:0]     ;      
  spike_arry[2]  =   data_act_tr.verif_csr_vlWr[63:0]       ;      
  spike_arry[1]  =   data_act_tr.verif_csr_vstartWr[63:0]   ;      
  //`uvm_info(get_type_name(),$sformatf(" get set_reg initial value %0h",data_act_tr.verif_csr_medelegWr ),UVM_NONE);

	inchi_difftest_set_reg(spike_arry);
	
endtask
task vpu_scb::init_spike_info_high(data_trans data_act_tr);

    bit [63:0] spike_arry[154];

    spike_arry[6] = data_act_tr.verif_commit_currPc[127:64];
    spike_arry[0] = data_act_tr.verif_commit_insn[127:64];

		for(int i=0;i<31;i++)begin
    	spike_arry[i+122+1] = data_act_tr.verif_reg_gpr_arr[i+31];
		//`uvm_info(get_type_name(),$sformatf(" verif_reg_gpr_arr=%0h,verif_reg_gpr=%0h", data_exp_tr.verif_reg_gpr_arr[i],vif.verif_reg_gpr[64*i+:64]),UVM_NONE);
	  end
    for(int i=0;i<32;i++)begin
    	spike_arry[90+i] = data_act_tr.verif_reg_fpr_arr[i+32];

			spike_arry[2*i+26] = data_act_tr.verif_reg_vpr_arr[i+32][63:0];
			spike_arry[2*i+27] = data_act_tr.verif_reg_vpr_arr[i+32][127:64];
	   end



  spike_arry[24] =   data_act_tr.verif_csr_mstatusWr[127:64]  ;      
  spike_arry[22] =   data_act_tr.verif_csr_mepcWr[127:64]     ;      
  spike_arry[20] =   data_act_tr.verif_csr_mtvalWr[127:64]    ;      
  spike_arry[18] =   data_act_tr.verif_csr_mtvecWr[127:64]    ;      
  spike_arry[16] =   data_act_tr.verif_csr_mcauseWr[127:64]   ;      
  spike_arry[13] =   data_act_tr.verif_csr_mipWr[127:64]      ;      
  spike_arry[12] =   data_act_tr.verif_csr_mieWr[127:64]      ;      
  spike_arry[11] =   data_act_tr.verif_csr_mscratchWr[127:64] ;      
  spike_arry[9]  =   data_act_tr.verif_csr_midelegWr[127:64]  ;      
  spike_arry[8]  =   data_act_tr.verif_csr_medelegWr[127:64]  ;      
  spike_arry[5]  =   data_act_tr.verif_csr_minstretWr[127:64] + 1 ;      
  spike_arry[23] =   data_act_tr.verif_csr_sstatusWr[127:64]  ;      
  spike_arry[21] =   data_act_tr.verif_csr_sepcWr[127:64]     ;      
  spike_arry[19] =   data_act_tr.verif_csr_stvalWr[127:64]    ;      
  spike_arry[17] =   data_act_tr.verif_csr_stvecWr[127:64]    ;      
  spike_arry[15] =   data_act_tr.verif_csr_scauseWr[127:64]   ;      
  spike_arry[14] =   data_act_tr.verif_csr_satpWr[127:64]     ;      
  spike_arry[10] =   data_act_tr.verif_csr_sscratchWr[127:64] ;      
  spike_arry[4]  =   data_act_tr.verif_csr_vtypeWr[127:64]    ;      
  spike_arry[3]  =   data_act_tr.verif_csr_vcsrWr[127:64]     ;      
  spike_arry[2]  =   data_act_tr.verif_csr_vlWr[127:64]       ;      
  spike_arry[1]  =   data_act_tr.verif_csr_vstartWr[127:64]   ;      
  //`uvm_info(get_type_name(),$sformatf(" get set_reg initial value %0h",data_act_tr.verif_csr_medelegWr ),UVM_NONE);

	inchi_difftest_set_reg(spike_arry);
	
endtask
`endif // VPU_SCB_SV


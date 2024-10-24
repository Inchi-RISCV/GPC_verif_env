//============================================================================
// Copyright(c) 2022 ; Inchi Technology Inc, All right reserved
// Company           : Inchi Technology .Inc
//============================================================================
// Project           :vpu
// File Name         :data_if.sv
// Author            :=huangxiaogang
// Email             :=huangxiaogang@inchitech.com
// Called by         :
// Reversion History :2023-09-04 14:45:34
// Reversion:        1.0
//============================================================================
// Description       :
//============================================================================

`ifndef _DATA_IF_SV_
`define _DATA_IF_SV_

interface data_if(input clk, input rst_n);
  
  //commit signals
	//logic [`NRET-1:0]          verif_commit_start;

  logic [`NRET-1:0]          verif_commit_valid;
  logic [`NRET*`XLEN-1:0]    verif_commit_currPc;
  logic [`NRET*32-1:0]       verif_commit_insn;
  
  //sim signals
  logic                     verif_sim_halt;

  //trap signals
  logic                     verif_trap_valid;
  logic [`NRET*`XLEN-1:0]   verif_trap_code;

  //reg signals
  logic [`NRET*31*`XLEN-1:0] verif_reg_gpr;
  logic [`NRET*32*`FLEN-1:0] verif_reg_fpr;
  logic [`NRET*32*`VLEN-1:0] verif_reg_vpr;


  //csr signals
  logic [`NRET*`XLEN-1:0]   verif_csr_mstatusWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_mepcWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_mtvalWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_mtvecWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_mcauseWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_mipWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_mieWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_mscratchWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_midelegWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_medelegWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_minstretWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_sstatusWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_sepcWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_stvalWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_stvecWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_scauseWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_satpWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_sscratchWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_vtypeWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_vcsrWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_vlWr;
  logic [`NRET*`XLEN-1:0]   verif_csr_vstartWr;


  clocking mon_cb@(posedge clk);
    //commit signals
		//output  verif_commit_start;
    output  verif_commit_valid;
    output  verif_commit_currPc;
    output  verif_commit_insn;
  
    //sim signals
    output  verif_sim_halt;

    //trap signals
    output  verif_trap_valid;
    output  verif_trap_code;

    //reg signals
    output  verif_reg_gpr;
    output  verif_reg_fpr;
		output  verif_reg_vpr;

    //csr signals
    output  verif_csr_mstatusWr;
    output  verif_csr_mepcWr;
    output  verif_csr_mtvalWr;
    output  verif_csr_mtvecWr;
    output  verif_csr_mcauseWr;
    output  verif_csr_mipWr;
    output  verif_csr_mieWr;
    output  verif_csr_mscratchWr;
    output  verif_csr_midelegWr;
    output  verif_csr_medelegWr;
    output  verif_csr_minstretWr;
    output  verif_csr_sstatusWr;
    output  verif_csr_sepcWr;
    output  verif_csr_stvalWr;
    output  verif_csr_stvecWr;
    output  verif_csr_scauseWr;
    output  verif_csr_satpWr;
    output  verif_csr_sscratchWr;
    output  verif_csr_vtypeWr;
    output  verif_csr_vcsrWr;
    output  verif_csr_vlWr;
    output  verif_csr_vstartWr;

  endclocking


endinterface : data_if

`endif // DATA_IF_SV

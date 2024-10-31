`define  RTL_PATH  tb_top.testHarness.ldut.tile_prci_domain.element_reset_domain_gpctile.core
`define  VIF_PATH  tb_top.m_data_if

TestHarness testHarness(
    .clock(clock),
    .reset(reset),
    .io_success(success)
  );


initial begin

 force `VIF_PATH.verif_commit_valid   =  `RTL_PATH.io_verif_commit_valid;
 force `VIF_PATH.verif_commit_currPc  =  `RTL_PATH.io_verif_commit_currPc;
 force `VIF_PATH.verif_commit_insn    =  `RTL_PATH.io_verif_commit_insn;
 force `VIF_PATH.verif_sim_halt       =  `RTL_PATH.io_verif_sim_halt;
 force `VIF_PATH.verif_trap_valid     =  `RTL_PATH.io_verif_trap_valid;
 force `VIF_PATH.verif_trap_code      =  `RTL_PATH.io_verif_trap_code;
 force `VIF_PATH.verif_reg_gpr        =  `RTL_PATH.io_verif_reg_gpr;
 force `VIF_PATH.verif_reg_fpr        =  `RTL_PATH.io_verif_reg_fpr;
 force `VIF_PATH.verif_reg_vpr        =  `RTL_PATH.io_verif_reg_vpr;
 force `VIF_PATH.verif_csr_mstatusWr  =  `RTL_PATH.io_verif_csr_mstatus;
 force `VIF_PATH.verif_csr_mepcWr     =  `RTL_PATH.io_verif_csr_mepc;
 force `VIF_PATH.verif_csr_mtvalWr    =  `RTL_PATH.io_verif_csr_mtval;
 force `VIF_PATH.verif_csr_mtvecWr    =  `RTL_PATH.io_verif_csr_mtvec;
 force `VIF_PATH.verif_csr_mcauseWr   =  `RTL_PATH.io_verif_csr_mcause;
 force `VIF_PATH.verif_csr_mipWr      =  `RTL_PATH.io_verif_csr_mip;
 force `VIF_PATH.verif_csr_mieWr      =  `RTL_PATH.io_verif_csr_mie;
 force `VIF_PATH.verif_csr_mscratchWr =  `RTL_PATH.io_verif_csr_mscratch;
 force `VIF_PATH.verif_csr_midelegWr  =  `RTL_PATH.io_verif_csr_mideleg;
 force `VIF_PATH.verif_csr_medelegWr  =  `RTL_PATH.io_verif_csr_medeleg;
 force `VIF_PATH.verif_csr_minstretWr =  `RTL_PATH.io_verif_csr_minstret;
 force `VIF_PATH.verif_csr_sstatusWr  =  `RTL_PATH.io_verif_csr_sstatus;
 force `VIF_PATH.verif_csr_sepcWr     =  `RTL_PATH.io_verif_csr_sepc;
 force `VIF_PATH.verif_csr_stvalWr    =  `RTL_PATH.io_verif_csr_stval;
 force `VIF_PATH.verif_csr_stvecWr    =  `RTL_PATH.io_verif_csr_stvec;
 force `VIF_PATH.verif_csr_scauseWr   =  `RTL_PATH.io_verif_csr_scause;
 force `VIF_PATH.verif_csr_satpWr     =  `RTL_PATH.io_verif_csr_satp;
 force `VIF_PATH.verif_csr_sscratchWr =  `RTL_PATH.io_verif_csr_sscratch;
 force `VIF_PATH.verif_csr_vtypeWr    =  `RTL_PATH.io_verif_csr_vtype;
 force `VIF_PATH.verif_csr_vcsrWr     =  `RTL_PATH.io_verif_csr_vcsr;
 force `VIF_PATH.verif_csr_vlWr       =  `RTL_PATH.io_verif_csr_vl;
 force `VIF_PATH.verif_csr_vstartWr   =  `RTL_PATH.io_verif_csr_vstart;
 end

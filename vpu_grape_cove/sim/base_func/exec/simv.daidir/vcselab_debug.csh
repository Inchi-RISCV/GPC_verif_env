#!/bin/csh -f

cd /datahdd/riscv/zhangxiran/GCC_verification/GPC_verif_env/vpu_grape_cove/sim

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/tools/synopsys/vcs/T-2022.06/linux64/bin/vcselab $* \
    -o \
    ./base_func/exec/simv \
    -nobanner \
    +vcs+lic+wait \

cd -


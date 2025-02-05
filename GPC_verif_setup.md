# How to set up verification env for GPC2.0
## Prerequisites
- Install build tool [mill](https://mill-build.com/)
- Install [firtool](https://github.com/llvm/circt)

Note: The version of firtool should match that of chisel3. For example, we should install v1.43.0 since GPC2.0 use Chisel v5.1.0 for now.

## Generate core RTL
### Prepare GPC2.0 source code
```bash
git clone https://github.com/IntelLabs/riscv-vector.git
cd riscv-vector
# GPC2.0 is in branch `gpcdev`
git checkout gpcdev
git submodule update --init
```

DCache is in the branch `gpc_cache_wb` of the same repository. Clone the repository in a directory different to above one, say `path-to-dcache` and switch to the branch.

Add it into the core like this:
```bash
# in directory `riscv-vector` of the first step (branch `gpcdev`)
make clean
mkdir -p src/main/scala/gpcdcache
cp path-to-dcache/src/main/scala/grapecoveDcache/* src/main/scala/gpcdcache/
```

### Build to generate SV files
```bash
 mill emulator[gpc.system.TestHarness,gpc.system.DefaultConfig].mfccompiler.compile
```

## Build Spike (reference model)
Find an independent directory:
```bash
git clone https://github.com/inchiZhangjun/riscv-isa-sim.git
cd cd riscv-isa-sim

# Disable XS Trap function
# Go to riscv/insns/xs_trap.h, then
# comment all the contents

cd difftest
./build.sh
```

## Set up testbench
Get the code of UVM testbench:
```bash
git clone https://github.com/Inchi-RISCV/GPC_verif_env.git
cd GPC_verif_env
git checkout develop
```

### Adjust configuration
- In file `vpu_grape_cove/cfg/cfg.mk`, set $UVM_HOME in line 1 according to your current settings:
```makefile
UVM_HOME = /home/radl/tools/snps/vcs/S-2021.09-SP1-1/etc/uvm-1.2
```

- Delete `-cc gcc-5` in Line 19

- Potential issue of incompatability of GCC and UVM:
```bash
UVM_ERROR: THIS VERSION OF VCS DOESN?T SUPPORT VCSMX_FAST_UVM. Compile without -DVCSMX_FAST_UVM
```
Here is the [solution](https://forums.accellera.org/topic/6834-unicode-characters-used-as-identifiers-in-uvm-source/).


### Prepare DUT
Copy DUT to directory `vpu_grape_cove/th` and modify a little bit of DTM:

```bash
cp -R path-to-/riscv-vector/out/emulator/gpc.system.TestHarness/gpc.system.DefaultConfig/mfccompiler/compile.dest vpu_grape_cove/th/
mv compile.dest compile_dest

# Make changes of DTM
cd vpu_grape_cove/th/compile_dest
sed -i '/\.\/SimDTM\.cc/s/^/\/\//' filelist.f
sed -i '/SimDTM SimDTM/,/);/ s/^/\/\//' TestHarness.sv
sed -i '/assign io_success = _SimDTM_exit == 32'"'"'h1;/i assign _SimDTM_debug_req_valid = 1'"'"'b0;\n  assign _SimDTM_debug_req_bits_addr = 7'"'"'h0;\n  assign _SimDTM_debug_req_bits_op = 2'"'"'h0; \n  assign _SimDTM_debug_req_bits_data = 32'"'"'h0;\n  assign _SimDTM_debug_resp_ready = 1'"'"'b1;\n  assign _SimDTM_exit = 32'"'"'h1;' TestHarness.sv
cd -
```

### Prepare Spike
Copy Spike to directory `vpu_grape_cove\common`
```bash
cp path-to-/riscv-isa-sim/difftest/build/libriscv64-spike.so vpu_grape_cove/common/
```

### Add tests
Put testcases into the directory `tc/sequence`. The names of testcases should end with “.elf”.Then generate dump, bin and hex files for testcases. For that, in directory `vpu/tc/sequence`:
```bash
./build_dump.sh testcases_folder_name 
./build_bin.sh testcases_folder_name 
./build_hex.sh testcases_folder_name/bin
```

### run tests
Say, add.elf is the testcase to be run:
```bash
cd sim
make run mode=base_func tc=instr_test fsdb=on seed=123 cov=on cfg=add.elf cfg_dir=../tc/sequence/testcases_folder_name
```

If a mismatch occurs, visualize the difference between DUT and reference model by this command:
```bash
./test.sh  base_func/logs/instr_test_<seed>.log
```
The waveform can be found in `./base_func/wave/`.
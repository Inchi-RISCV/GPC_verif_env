// Generated by CIRCT firtool-1.56.1
// Standard header to adapt well known macros to our needs.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

// Include register initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS

// Include rmemory initializers in init blocks unless synthesis is set
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_MEM_
    `define ENABLE_INITIAL_MEM_
  `endif // not def ENABLE_INITIAL_MEM_
`endif // not def SYNTHESIS

module DMIToTL(
  input         auto_out_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [2:0]  auto_out_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [1:0]  auto_out_d_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input         auto_out_d_bits_sink,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_d_bits_denied,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [31:0] auto_out_d_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input         auto_out_d_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                io_dmi_req_valid,	// src/main/scala/devices/debug/DMI.scala:88:16
  input  [6:0]  io_dmi_req_bits_addr,	// src/main/scala/devices/debug/DMI.scala:88:16
  input  [31:0] io_dmi_req_bits_data,	// src/main/scala/devices/debug/DMI.scala:88:16
  input  [1:0]  io_dmi_req_bits_op,	// src/main/scala/devices/debug/DMI.scala:88:16
  input         io_dmi_resp_ready,	// src/main/scala/devices/debug/DMI.scala:88:16
  output        auto_out_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [2:0]  auto_out_a_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [8:0]  auto_out_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [31:0] auto_out_a_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output        auto_out_d_ready,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                io_dmi_req_ready,	// src/main/scala/devices/debug/DMI.scala:88:16
                io_dmi_resp_valid,	// src/main/scala/devices/debug/DMI.scala:88:16
  output [31:0] io_dmi_resp_bits_data,	// src/main/scala/devices/debug/DMI.scala:88:16
  output [1:0]  io_dmi_resp_bits_resp	// src/main/scala/devices/debug/DMI.scala:88:16
);

  wire        nodeOut_a_ready = auto_out_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_a_valid = io_dmi_req_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_ready = io_dmi_resp_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_valid = auto_out_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  nodeOut_d_bits_opcode = auto_out_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]  nodeOut_d_bits_param = auto_out_d_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]  nodeOut_d_bits_size = auto_out_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_bits_sink = auto_out_d_bits_sink;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_bits_denied = auto_out_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0] nodeOut_d_bits_data = auto_out_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_bits_corrupt = auto_out_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0] pfbits_data = io_dmi_req_bits_data;	// src/main/scala/tilelink/Edges.scala:481:17
  wire [2:0]  gbits_opcode = 3'h4;	// src/main/scala/tilelink/Edges.scala:461:17
  wire [8:0]  nbits_address = 9'h48;	// src/main/scala/tilelink/Edges.scala:481:17
  wire [1:0]  gbits_a_mask_sizeOH = 2'h1;	// src/main/scala/util/Misc.scala:202:81
  wire [1:0]  pfbits_a_mask_sizeOH = 2'h1;	// src/main/scala/util/Misc.scala:202:81
  wire [1:0]  nbits_a_mask_sizeOH = 2'h1;	// src/main/scala/util/Misc.scala:202:81
  wire        gbits_legal = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        gbits_a_mask_acc = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        gbits_a_mask_acc_1 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        gbits_a_mask_size_1 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        gbits_a_mask_acc_2 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        gbits_a_mask_acc_3 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        gbits_a_mask_acc_4 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        gbits_a_mask_acc_5 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        pfbits_legal = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        pfbits_a_mask_acc = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        pfbits_a_mask_acc_1 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        pfbits_a_mask_size_1 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        pfbits_a_mask_acc_2 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        pfbits_a_mask_acc_3 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        pfbits_a_mask_acc_4 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        pfbits_a_mask_acc_5 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        nbits_legal = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        nbits_a_mask_nbit = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        nbits_a_mask_eq = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        nbits_a_mask_acc = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        nbits_a_mask_acc_1 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        nbits_a_mask_size_1 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        nbits_a_mask_nbit_1 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        nbits_a_mask_eq_2 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        nbits_a_mask_acc_2 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        nbits_a_mask_acc_3 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        nbits_a_mask_acc_4 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire        nbits_a_mask_acc_5 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:673:26, src/main/scala/util/Misc.scala:209:26, :211:20, :214:27, :215:29
  wire [1:0]  gbits_a_mask_lo = 2'h3;	// src/main/scala/util/Misc.scala:222:10
  wire [1:0]  gbits_a_mask_hi = 2'h3;	// src/main/scala/util/Misc.scala:222:10
  wire [1:0]  pfbits_a_mask_lo = 2'h3;	// src/main/scala/util/Misc.scala:222:10
  wire [1:0]  pfbits_a_mask_hi = 2'h3;	// src/main/scala/util/Misc.scala:222:10
  wire [1:0]  nbits_a_mask_lo = 2'h3;	// src/main/scala/util/Misc.scala:222:10
  wire [1:0]  nbits_a_mask_hi = 2'h3;	// src/main/scala/util/Misc.scala:222:10
  wire [31:0] gbits_data = 32'h0;	// src/main/scala/devices/debug/DMI.scala:110:{64,76}, :111:76, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire [31:0] nbits_data = 32'h0;	// src/main/scala/devices/debug/DMI.scala:110:{64,76}, :111:76, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire [3:0]  nodeOut_a_bits_mask = 4'hF;	// src/main/scala/devices/debug/DMI.scala:109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:222:10
  wire [3:0]  gbits_mask = 4'hF;	// src/main/scala/devices/debug/DMI.scala:109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:222:10
  wire [3:0]  pfbits_mask = 4'hF;	// src/main/scala/devices/debug/DMI.scala:109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:222:10
  wire [3:0]  nbits_mask = 4'hF;	// src/main/scala/devices/debug/DMI.scala:109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:222:10
  wire        nodeOut_a_bits_source = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        nodeOut_a_bits_corrupt = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        nodeOut_d_bits_source = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        src = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        gbits_source = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        gbits_corrupt = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        gbits_a_mask_sizeOH_shiftAmount = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        gbits_a_mask_size = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        pfbits_source = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        pfbits_corrupt = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        pfbits_a_mask_sizeOH_shiftAmount = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        pfbits_a_mask_size = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        nbits_source = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        nbits_corrupt = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        nbits_a_mask_sizeOH_shiftAmount = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        nbits_a_mask_size = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        nbits_a_mask_eq_1 = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        nbits_a_mask_eq_3 = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        nbits_a_mask_eq_4 = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire        nbits_a_mask_eq_5 = 1'h0;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
  wire [1:0]  nodeOut_a_bits_size = 2'h2;	// src/main/scala/devices/debug/DMI.scala:109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire [1:0]  gbits_size = 2'h2;	// src/main/scala/devices/debug/DMI.scala:109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire [1:0]  pfbits_size = 2'h2;	// src/main/scala/devices/debug/DMI.scala:109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire [1:0]  nbits_size = 2'h2;	// src/main/scala/devices/debug/DMI.scala:109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire [2:0]  nodeOut_a_bits_param = 3'h0;	// src/main/scala/devices/debug/DMI.scala:109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire [2:0]  gbits_param = 3'h0;	// src/main/scala/devices/debug/DMI.scala:109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire [2:0]  pfbits_opcode = 3'h0;	// src/main/scala/devices/debug/DMI.scala:109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire [2:0]  pfbits_param = 3'h0;	// src/main/scala/devices/debug/DMI.scala:109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire [2:0]  nbits_opcode = 3'h0;	// src/main/scala/devices/debug/DMI.scala:109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire [2:0]  nbits_param = 3'h0;	// src/main/scala/devices/debug/DMI.scala:109:{64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire [8:0]  addr = {io_dmi_req_bits_addr, 2'h0};	// src/main/scala/devices/debug/DMI.scala:95:{24,46}
  wire [8:0]  gbits_address = addr;	// src/main/scala/devices/debug/DMI.scala:95:24, src/main/scala/tilelink/Edges.scala:461:17
  wire [8:0]  pfbits_address = addr;	// src/main/scala/devices/debug/DMI.scala:95:24, src/main/scala/tilelink/Edges.scala:481:17
  wire        gbits_a_mask_bit = addr[1];	// src/main/scala/devices/debug/DMI.scala:95:24, src/main/scala/util/Misc.scala:210:26
  wire        pfbits_a_mask_bit = addr[1];	// src/main/scala/devices/debug/DMI.scala:95:24, src/main/scala/util/Misc.scala:210:26
  wire        gbits_a_mask_eq_1 = gbits_a_mask_bit;	// src/main/scala/util/Misc.scala:210:26, :214:27
  wire        gbits_a_mask_nbit = ~gbits_a_mask_bit;	// src/main/scala/util/Misc.scala:210:26, :211:20
  wire        gbits_a_mask_eq = gbits_a_mask_nbit;	// src/main/scala/util/Misc.scala:211:20, :214:27
  wire        gbits_a_mask_bit_1 = addr[0];	// src/main/scala/devices/debug/DMI.scala:95:24, src/main/scala/util/Misc.scala:210:26
  wire        pfbits_a_mask_bit_1 = addr[0];	// src/main/scala/devices/debug/DMI.scala:95:24, src/main/scala/util/Misc.scala:210:26
  wire        gbits_a_mask_nbit_1 = ~gbits_a_mask_bit_1;	// src/main/scala/util/Misc.scala:210:26, :211:20
  wire        gbits_a_mask_eq_2 = gbits_a_mask_eq & gbits_a_mask_nbit_1;	// src/main/scala/util/Misc.scala:211:20, :214:27
  wire        gbits_a_mask_eq_3 = gbits_a_mask_eq & gbits_a_mask_bit_1;	// src/main/scala/util/Misc.scala:210:26, :214:27
  wire        gbits_a_mask_eq_4 = gbits_a_mask_eq_1 & gbits_a_mask_nbit_1;	// src/main/scala/util/Misc.scala:211:20, :214:27
  wire        gbits_a_mask_eq_5 = gbits_a_mask_eq_1 & gbits_a_mask_bit_1;	// src/main/scala/util/Misc.scala:210:26, :214:27
  wire        pfbits_a_mask_eq_1 = pfbits_a_mask_bit;	// src/main/scala/util/Misc.scala:210:26, :214:27
  wire        pfbits_a_mask_nbit = ~pfbits_a_mask_bit;	// src/main/scala/util/Misc.scala:210:26, :211:20
  wire        pfbits_a_mask_eq = pfbits_a_mask_nbit;	// src/main/scala/util/Misc.scala:211:20, :214:27
  wire        pfbits_a_mask_nbit_1 = ~pfbits_a_mask_bit_1;	// src/main/scala/util/Misc.scala:210:26, :211:20
  wire        pfbits_a_mask_eq_2 = pfbits_a_mask_eq & pfbits_a_mask_nbit_1;	// src/main/scala/util/Misc.scala:211:20, :214:27
  wire        pfbits_a_mask_eq_3 = pfbits_a_mask_eq & pfbits_a_mask_bit_1;	// src/main/scala/util/Misc.scala:210:26, :214:27
  wire        pfbits_a_mask_eq_4 = pfbits_a_mask_eq_1 & pfbits_a_mask_nbit_1;	// src/main/scala/util/Misc.scala:211:20, :214:27
  wire        pfbits_a_mask_eq_5 = pfbits_a_mask_eq_1 & pfbits_a_mask_bit_1;	// src/main/scala/util/Misc.scala:210:26, :214:27
  wire        _GEN = io_dmi_req_bits_op == 2'h2;	// src/main/scala/devices/debug/DMI.scala:109:{30,64,76}, :110:64, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire        _GEN_0 = io_dmi_req_bits_op == 2'h1;	// src/main/scala/devices/debug/DMI.scala:110:37, src/main/scala/util/Misc.scala:202:81
  wire [2:0]  nodeOut_a_bits_opcode = _GEN ? 3'h0 : {_GEN_0, 2'h0};	// src/main/scala/devices/debug/DMI.scala:95:46, :109:{30,64,76}, :110:{37,64,76}, :111:76, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire [8:0]  nodeOut_a_bits_address =
    _GEN ? pfbits_address : _GEN_0 ? gbits_address : 9'h48;	// src/main/scala/devices/debug/DMI.scala:109:{30,64,76}, :110:{37,64,76}, :111:76, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  wire [31:0] nodeOut_a_bits_data = _GEN ? pfbits_data : 32'h0;	// src/main/scala/devices/debug/DMI.scala:109:{30,64,76}, :110:{64,76}, :111:76, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17
  assign auto_out_a_valid = nodeOut_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_opcode = nodeOut_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_address = nodeOut_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_data = nodeOut_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_d_ready = nodeOut_d_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign io_dmi_req_ready = nodeOut_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign io_dmi_resp_valid = nodeOut_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign io_dmi_resp_bits_data = nodeOut_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign io_dmi_resp_bits_resp = {1'h0, nodeOut_d_bits_corrupt | nodeOut_d_bits_denied};	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/devices/debug/DMI.scala:94:24, :109:{64,76}, :110:64, :119:{28,53}, src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:461:17, :481:17, src/main/scala/util/Misc.scala:209:26, :214:27
endmodule


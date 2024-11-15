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

module TLAsyncCrossingSource(
  input         clock,
                reset,
                auto_in_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [2:0]  auto_in_a_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [8:0]  auto_in_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [31:0] auto_in_a_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input         auto_in_d_ready,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_a_ridx,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_a_safe_ridx_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_a_safe_sink_reset_n,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [2:0]  auto_out_d_mem_0_opcode,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [1:0]  auto_out_d_mem_0_param,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_d_mem_0_size,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input         auto_out_d_mem_0_source,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_d_mem_0_sink,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_d_mem_0_denied,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [31:0] auto_out_d_mem_0_data,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input         auto_out_d_mem_0_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_d_widx,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_d_safe_widx_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_d_safe_source_reset_n,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output        auto_in_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_in_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [2:0]  auto_in_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [1:0]  auto_in_d_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_in_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output        auto_in_d_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_in_d_bits_sink,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_in_d_bits_denied,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [31:0] auto_in_d_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output        auto_in_d_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [2:0]  auto_out_a_mem_0_opcode,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_a_mem_0_param,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [1:0]  auto_out_a_mem_0_size,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output        auto_out_a_mem_0_source,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [8:0]  auto_out_a_mem_0_address,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [3:0]  auto_out_a_mem_0_mask,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [31:0] auto_out_a_mem_0_data,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output        auto_out_a_mem_0_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_a_widx,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_a_safe_widx_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_a_safe_source_reset_n,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_d_ridx,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_d_safe_ridx_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_d_safe_sink_reset_n	// src/main/scala/diplomacy/LazyModule.scala:367:18
);

  wire        nodeOut_d_safe_sink_reset_n;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_safe_ridx_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_ridx;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0] nodeIn_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeOut_a_safe_source_reset_n;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_a_safe_widx_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_a_widx;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0] nodeOut_a_mem_0_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [8:0]  nodeOut_a_mem_0_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  nodeOut_a_mem_0_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeIn_a_valid = auto_in_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_a_bits_opcode = auto_in_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [8:0]  nodeIn_a_bits_address = auto_in_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [31:0] nodeIn_a_bits_data = auto_in_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_ready = auto_in_d_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeOut_a_ridx = auto_out_a_ridx;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_a_safe_ridx_valid = auto_out_a_safe_ridx_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_a_safe_sink_reset_n = auto_out_a_safe_sink_reset_n;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  nodeOut_d_mem_0_opcode = auto_out_d_mem_0_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]  nodeOut_d_mem_0_param = auto_out_d_mem_0_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]  nodeOut_d_mem_0_size = auto_out_d_mem_0_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_mem_0_source = auto_out_d_mem_0_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_mem_0_sink = auto_out_d_mem_0_sink;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_mem_0_denied = auto_out_d_mem_0_denied;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0] nodeOut_d_mem_0_data = auto_out_d_mem_0_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_mem_0_corrupt = auto_out_d_mem_0_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_widx = auto_out_d_widx;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_safe_widx_valid = auto_out_d_safe_widx_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_safe_source_reset_n = auto_out_d_safe_source_reset_n;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0] nodeOut_b_mem_0_data = 32'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [31:0] nodeOut_c_mem_0_data = 32'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]  nodeOut_b_mem_0_mask = 4'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [8:0]  nodeOut_b_mem_0_address = 9'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [8:0]  nodeOut_c_mem_0_address = 9'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]  nodeOut_b_mem_0_param = 2'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]  nodeOut_b_mem_0_size = 2'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]  nodeOut_c_mem_0_size = 2'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [3:0]  nodeIn_a_bits_mask = 4'hF;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire [3:0]  nodeOut_a_mem_0_mask = 4'hF;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeIn_a_bits_source = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeIn_a_bits_corrupt = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_a_mem_0_source = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_a_mem_0_corrupt = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_b_mem_0_source = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_b_mem_0_corrupt = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_b_ridx = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_b_widx = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_b_safe_ridx_valid = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_b_safe_widx_valid = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_b_safe_source_reset_n = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_b_safe_sink_reset_n = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_c_mem_0_source = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_c_mem_0_corrupt = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_c_ridx = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_c_widx = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_c_safe_ridx_valid = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_c_safe_widx_valid = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_c_safe_source_reset_n = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_c_safe_sink_reset_n = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_e_mem_0_sink = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_e_ridx = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_e_widx = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_e_safe_ridx_valid = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_e_safe_widx_valid = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_e_safe_source_reset_n = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeOut_e_safe_sink_reset_n = 1'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire [1:0]  nodeIn_a_bits_size = 2'h2;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire [1:0]  nodeOut_a_mem_0_size = 2'h2;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire [2:0]  nodeIn_a_bits_param = 3'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire [2:0]  nodeOut_a_mem_0_param = 3'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire [2:0]  nodeOut_b_mem_0_opcode = 3'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire [2:0]  nodeOut_c_mem_0_opcode = 3'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire [2:0]  nodeOut_c_mem_0_param = 3'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25, src/main/scala/util/AsyncQueue.scala:216:24
  wire        nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]  nodeIn_d_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [1:0]  nodeIn_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_bits_sink;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  TLMonitor_33 monitor (	// src/main/scala/tilelink/Nodes.scala:24:25
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (nodeIn_a_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_valid        (nodeIn_a_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_opcode  (nodeIn_a_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_address (nodeIn_a_bits_address),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_ready        (nodeIn_d_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_valid        (nodeIn_d_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_opcode  (nodeIn_d_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_param   (nodeIn_d_bits_param),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_size    (nodeIn_d_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_source  (nodeIn_d_bits_source),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_sink    (nodeIn_d_bits_sink),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_denied  (nodeIn_d_bits_denied),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_corrupt (nodeIn_d_bits_corrupt)	// src/main/scala/diplomacy/Nodes.scala:1214:17
  );
  AsyncQueueSource nodeOut_a_source (	// src/main/scala/util/AsyncQueue.scala:216:24
    .clock                        (clock),
    .reset                        (reset),
    .io_enq_valid                 (nodeIn_a_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_opcode           (nodeIn_a_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_address          (nodeIn_a_bits_address),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_data             (nodeIn_a_bits_data),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_async_ridx                (nodeOut_a_ridx),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_async_safe_ridx_valid     (nodeOut_a_safe_ridx_valid),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_async_safe_sink_reset_n   (nodeOut_a_safe_sink_reset_n),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_enq_ready                 (nodeIn_a_ready),
    .io_async_mem_0_opcode        (nodeOut_a_mem_0_opcode),
    .io_async_mem_0_address       (nodeOut_a_mem_0_address),
    .io_async_mem_0_data          (nodeOut_a_mem_0_data),
    .io_async_widx                (nodeOut_a_widx),
    .io_async_safe_widx_valid     (nodeOut_a_safe_widx_valid),
    .io_async_safe_source_reset_n (nodeOut_a_safe_source_reset_n)
  );
  AsyncQueueSink nodeIn_d_sink (	// src/main/scala/util/AsyncQueue.scala:207:22
    .clock                        (clock),
    .reset                        (reset),
    .io_deq_ready                 (nodeIn_d_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_async_mem_0_opcode        (nodeOut_d_mem_0_opcode),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_async_mem_0_param         (nodeOut_d_mem_0_param),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_async_mem_0_size          (nodeOut_d_mem_0_size),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_async_mem_0_source        (nodeOut_d_mem_0_source),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_async_mem_0_sink          (nodeOut_d_mem_0_sink),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_async_mem_0_denied        (nodeOut_d_mem_0_denied),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_async_mem_0_data          (nodeOut_d_mem_0_data),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_async_mem_0_corrupt       (nodeOut_d_mem_0_corrupt),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_async_widx                (nodeOut_d_widx),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_async_safe_widx_valid     (nodeOut_d_safe_widx_valid),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_async_safe_source_reset_n (nodeOut_d_safe_source_reset_n),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_deq_valid                 (nodeIn_d_valid),
    .io_deq_bits_opcode           (nodeIn_d_bits_opcode),
    .io_deq_bits_param            (nodeIn_d_bits_param),
    .io_deq_bits_size             (nodeIn_d_bits_size),
    .io_deq_bits_source           (nodeIn_d_bits_source),
    .io_deq_bits_sink             (nodeIn_d_bits_sink),
    .io_deq_bits_denied           (nodeIn_d_bits_denied),
    .io_deq_bits_data             (nodeIn_d_bits_data),
    .io_deq_bits_corrupt          (nodeIn_d_bits_corrupt),
    .io_async_ridx                (nodeOut_d_ridx),
    .io_async_safe_ridx_valid     (nodeOut_d_safe_ridx_valid),
    .io_async_safe_sink_reset_n   (nodeOut_d_safe_sink_reset_n)
  );
  assign auto_in_a_ready = nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_valid = nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_opcode = nodeIn_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_param = nodeIn_d_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_size = nodeIn_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_source = nodeIn_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_sink = nodeIn_d_bits_sink;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_denied = nodeIn_d_bits_denied;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_data = nodeIn_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_corrupt = nodeIn_d_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_out_a_mem_0_opcode = nodeOut_a_mem_0_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_mem_0_param = nodeOut_a_mem_0_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_mem_0_size = nodeOut_a_mem_0_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_mem_0_source = nodeOut_a_mem_0_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_mem_0_address = nodeOut_a_mem_0_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_mem_0_mask = nodeOut_a_mem_0_mask;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_mem_0_data = nodeOut_a_mem_0_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_mem_0_corrupt = nodeOut_a_mem_0_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_widx = nodeOut_a_widx;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_safe_widx_valid = nodeOut_a_safe_widx_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_safe_source_reset_n = nodeOut_a_safe_source_reset_n;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_d_ridx = nodeOut_d_ridx;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_d_safe_ridx_valid = nodeOut_d_safe_ridx_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_d_safe_sink_reset_n = nodeOut_d_safe_sink_reset_n;	// src/main/scala/diplomacy/Nodes.scala:1205:17
endmodule


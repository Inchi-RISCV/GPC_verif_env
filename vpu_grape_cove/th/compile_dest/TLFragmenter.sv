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

module TLFragmenter(
  input         clock,
                reset,
                auto_in_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [2:0]  auto_in_a_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_in_a_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_in_a_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [6:0]  auto_in_a_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [25:0] auto_in_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [7:0]  auto_in_a_bits_mask,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [63:0] auto_in_a_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input         auto_in_a_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_in_d_ready,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [2:0]  auto_out_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [1:0]  auto_out_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [10:0] auto_out_d_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  input  [63:0] auto_out_d_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output        auto_in_a_ready,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_in_d_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [2:0]  auto_in_d_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_in_d_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [6:0]  auto_in_d_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [63:0] auto_in_d_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output        auto_out_a_valid,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [2:0]  auto_out_a_bits_opcode,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_a_bits_param,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [1:0]  auto_out_a_bits_size,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [10:0] auto_out_a_bits_source,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [25:0] auto_out_a_bits_address,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [7:0]  auto_out_a_bits_mask,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output [63:0] auto_out_a_bits_data,	// src/main/scala/diplomacy/LazyModule.scala:367:18
  output        auto_out_a_bits_corrupt,	// src/main/scala/diplomacy/LazyModule.scala:367:18
                auto_out_d_ready	// src/main/scala/diplomacy/LazyModule.scala:367:18
);

  wire        nodeOut_a_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  nodeOut_a_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        _repeater_io_full;	// src/main/scala/tilelink/Fragmenter.scala:264:30
  wire [2:0]  _repeater_io_deq_bits_opcode;	// src/main/scala/tilelink/Fragmenter.scala:264:30
  wire [2:0]  _repeater_io_deq_bits_size;	// src/main/scala/tilelink/Fragmenter.scala:264:30
  wire [6:0]  _repeater_io_deq_bits_source;	// src/main/scala/tilelink/Fragmenter.scala:264:30
  wire [25:0] _repeater_io_deq_bits_address;	// src/main/scala/tilelink/Fragmenter.scala:264:30
  wire [7:0]  _repeater_io_deq_bits_mask;	// src/main/scala/tilelink/Fragmenter.scala:264:30
  wire        nodeIn_a_valid = auto_in_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_a_bits_opcode = auto_in_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_a_bits_param = auto_in_a_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [2:0]  nodeIn_a_bits_size = auto_in_a_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [6:0]  nodeIn_a_bits_source = auto_in_a_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [25:0] nodeIn_a_bits_address = auto_in_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [7:0]  nodeIn_a_bits_mask = auto_in_a_bits_mask;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire [63:0] nodeIn_a_bits_data = auto_in_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_a_bits_corrupt = auto_in_a_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_ready = auto_in_d_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeOut_a_ready = auto_out_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_valid = auto_out_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [2:0]  nodeOut_d_bits_opcode = auto_out_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [1:0]  nodeOut_d_bits_size = auto_out_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [10:0] nodeOut_d_bits_source = auto_out_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [63:0] nodeOut_d_bits_data = auto_out_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        find_0 = 1'h1;	// src/main/scala/tilelink/Parameters.scala:603:12
  wire        nodeIn_d_bits_sink = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_bits_denied = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeIn_d_bits_corrupt = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  wire        nodeOut_d_bits_sink = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_bits_denied = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        nodeOut_d_bits_corrupt = 1'h0;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire        acknum_size = 1'h0;	// src/main/scala/tilelink/Fragmenter.scala:203:36
  wire [1:0]  nodeIn_d_bits_param = 2'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25
  wire [1:0]  nodeOut_d_bits_param = 2'h0;	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Nodes.scala:24:25
  wire [1:0]  limit = 2'h3;	// src/main/scala/chisel3/util/Mux.scala:77:13
  wire [63:0] nodeOut_a_bits_data = nodeIn_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [2:0]  nodeIn_d_bits_opcode = nodeOut_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  wire [1:0]  dsizeOH_shiftAmount = nodeOut_d_bits_size;	// src/main/scala/chisel3/util/OneHot.scala:64:49, src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [63:0] nodeIn_d_bits_data = nodeOut_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17
  reg  [2:0]  acknum;	// src/main/scala/tilelink/Fragmenter.scala:191:29
  reg  [2:0]  dOrig;	// src/main/scala/tilelink/Fragmenter.scala:192:24
  reg         dToggle;	// src/main/scala/tilelink/Fragmenter.scala:193:30
  wire [2:0]  dFragnum = nodeOut_d_bits_source[2:0];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Fragmenter.scala:194:41
  wire [2:0]  acknum_fragment = dFragnum;	// src/main/scala/tilelink/Fragmenter.scala:194:41, :202:40
  wire        dFirst = acknum == 3'h0;	// src/main/scala/tilelink/Fragmenter.scala:191:29, :195:29
  wire        dLast = dFragnum == 3'h0;	// src/main/scala/tilelink/Fragmenter.scala:191:29, :194:41, :196:30
  wire [3:0]  dsizeOH = 4'h1 << dsizeOH_shiftAmount;	// src/main/scala/chisel3/util/OneHot.scala:64:49, :65:{12,27}
  wire [5:0]  _dsizeOH1_T_1 = 6'h7 << nodeOut_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/util/package.scala:235:71
  wire [2:0]  dsizeOH1 = ~(_dsizeOH1_T_1[2:0]);	// src/main/scala/util/package.scala:235:{46,71,76}
  wire        dHasData = nodeOut_d_bits_opcode[0];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Edges.scala:107:36
  wire [2:0]  dFirst_acknum = acknum_fragment;	// src/main/scala/tilelink/Fragmenter.scala:202:40, :205:45
  wire        ack_decrement = dHasData | dsizeOH[3];	// src/main/scala/chisel3/util/OneHot.scala:65:27, src/main/scala/tilelink/Edges.scala:107:36, src/main/scala/tilelink/Fragmenter.scala:206:{32,56}
  wire [2:0]  _GEN = ~dFragnum;	// src/main/scala/tilelink/Fragmenter.scala:194:41, src/main/scala/util/package.scala:233:49
  wire [2:0]  dFirst_size_hi = dFragnum & {1'h1, _GEN[2:1]};	// src/main/scala/chisel3/util/OneHot.scala:30:18, src/main/scala/tilelink/Fragmenter.scala:194:41, src/main/scala/util/package.scala:233:{47,49}
  wire [3:0]  dFirst_size_lo = {dsizeOH1, 1'h1} & {_GEN[0], ~dsizeOH1};	// src/main/scala/chisel3/util/OneHot.scala:31:18, src/main/scala/util/package.scala:233:{47,49}, :235:46
  wire [3:0]  _dFirst_size_T_8 = {1'h0, dFirst_size_hi} | dFirst_size_lo;	// src/main/scala/chisel3/util/OneHot.scala:30:18, :31:18, :32:28
  wire [1:0]  dFirst_size_hi_1 = _dFirst_size_T_8[3:2];	// src/main/scala/chisel3/util/OneHot.scala:30:18, :32:28
  wire [1:0]  dFirst_size_lo_1 = _dFirst_size_T_8[1:0];	// src/main/scala/chisel3/util/OneHot.scala:31:18, :32:28
  wire [2:0]  dFirst_size =
    {|dFirst_size_hi, |dFirst_size_hi_1, dFirst_size_hi_1[1] | dFirst_size_lo_1[1]};	// src/main/scala/chisel3/util/OneHot.scala:30:18, :31:18, :32:{10,14,28}
  wire        drop = ~dHasData & ~dLast;	// src/main/scala/tilelink/Edges.scala:107:36, src/main/scala/tilelink/Fragmenter.scala:196:30, :224:{20,30,33}
  wire        nodeOut_d_ready = nodeIn_d_ready | drop;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Fragmenter.scala:224:30, :225:35
  wire        nodeIn_d_valid = nodeOut_d_valid & ~drop;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Fragmenter.scala:224:30, :226:{36,39}
  wire [6:0]  nodeIn_d_bits_source = nodeOut_d_bits_source[10:4];	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Fragmenter.scala:228:47
  wire [2:0]  nodeIn_d_bits_size = dFirst ? dFirst_size : dOrig;	// src/main/scala/chisel3/util/OneHot.scala:32:10, src/main/scala/diplomacy/Nodes.scala:1214:17, src/main/scala/tilelink/Fragmenter.scala:192:24, :195:29, :229:32
  wire [2:0]  aFrag = _repeater_io_deq_bits_size[2] ? 3'h3 : _repeater_io_deq_bits_size;	// src/main/scala/tilelink/Fragmenter.scala:264:30, :287:{24,31}
  wire [12:0] _aOrigOH1_T_1 = 13'h3F << _repeater_io_deq_bits_size;	// src/main/scala/tilelink/Fragmenter.scala:264:30, src/main/scala/util/package.scala:235:71
  wire [5:0]  aOrigOH1 = ~(_aOrigOH1_T_1[5:0]);	// src/main/scala/util/package.scala:235:{46,71,76}
  wire [9:0]  _aFragOH1_T_1 = 10'h7 << aFrag;	// src/main/scala/tilelink/Fragmenter.scala:287:24, src/main/scala/util/package.scala:235:71
  wire [2:0]  aFragOH1 = ~(_aFragOH1_T_1[2:0]);	// src/main/scala/util/package.scala:235:{46,71,76}
  wire        aHasData = ~(_repeater_io_deq_bits_opcode[2]);	// src/main/scala/tilelink/Edges.scala:93:{28,37}, src/main/scala/tilelink/Fragmenter.scala:264:30
  wire [2:0]  aMask = aHasData ? 3'h0 : aFragOH1;	// src/main/scala/tilelink/Edges.scala:93:28, src/main/scala/tilelink/Fragmenter.scala:191:29, :291:24, src/main/scala/util/package.scala:235:46
  reg  [2:0]  gennum;	// src/main/scala/tilelink/Fragmenter.scala:293:29
  wire        aFirst = gennum == 3'h0;	// src/main/scala/tilelink/Fragmenter.scala:191:29, :293:29, :294:29
  wire [2:0]  old_gennum1 = aFirst ? aOrigOH1[5:3] : gennum - 3'h1;	// src/main/scala/tilelink/Fragmenter.scala:293:29, :294:29, :295:{30,48,79}, src/main/scala/util/package.scala:235:46
  wire [2:0]  new_gennum = old_gennum1;	// src/main/scala/tilelink/Fragmenter.scala:295:30, :296:26
  wire [2:0]  aFragnum = old_gennum1;	// src/main/scala/tilelink/Fragmenter.scala:295:30, :297:24
  wire        aLast = aFragnum == 3'h0;	// src/main/scala/tilelink/Fragmenter.scala:191:29, :297:24, :298:30
  reg         aToggle_r;	// src/main/scala/tilelink/Fragmenter.scala:299:54
  wire        aToggle = ~(aFirst ? dToggle : aToggle_r);	// src/main/scala/tilelink/Fragmenter.scala:193:30, :294:29, :299:{23,27,54}
  wire [25:0] nodeOut_a_bits_address =
    {_repeater_io_deq_bits_address[25:6],
     _repeater_io_deq_bits_address[5:0] | {~(old_gennum1 | ~(aOrigOH1[5:3])), 3'h0}};	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Fragmenter.scala:191:29, :264:30, :295:30, :306:{49,51,88,90,111}, src/main/scala/util/package.scala:235:46
  wire [7:0]  nodeOut_a_bits_source_hi = {_repeater_io_deq_bits_source, aToggle};	// src/main/scala/tilelink/Fragmenter.scala:264:30, :299:23, :307:33
  wire [10:0] nodeOut_a_bits_source = {nodeOut_a_bits_source_hi, aFragnum};	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Fragmenter.scala:297:24, :307:33
  wire [1:0]  nodeOut_a_bits_size = aFrag[1:0];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Fragmenter.scala:287:24, :308:25
  `ifndef SYNTHESIS	// src/main/scala/tilelink/Fragmenter.scala:311:16
    always @(posedge clock) begin	// src/main/scala/tilelink/Fragmenter.scala:311:16
      if (~reset & ~(~_repeater_io_full | ~aHasData)) begin	// src/main/scala/tilelink/Edges.scala:93:28, src/main/scala/tilelink/Fragmenter.scala:264:30, :304:31, :311:{16,17,35}
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/tilelink/Fragmenter.scala:311:16
          $error("Assertion failed\n    at Fragmenter.scala:311 assert (!repeater.io.full || !aHasData)\n");	// src/main/scala/tilelink/Fragmenter.scala:311:16
        if (`STOP_COND_)	// src/main/scala/tilelink/Fragmenter.scala:311:16
          $fatal;	// src/main/scala/tilelink/Fragmenter.scala:311:16
      end
      if (~reset & ~(~_repeater_io_full | (&_repeater_io_deq_bits_mask))) begin	// src/main/scala/tilelink/Fragmenter.scala:264:30, :311:{16,17}, :314:{16,35,53}
        if (`ASSERT_VERBOSE_COND_)	// src/main/scala/tilelink/Fragmenter.scala:314:16
          $error("Assertion failed\n    at Fragmenter.scala:314 assert (!repeater.io.full || in_a.bits.mask === fullMask)\n");	// src/main/scala/tilelink/Fragmenter.scala:314:16
        if (`STOP_COND_)	// src/main/scala/tilelink/Fragmenter.scala:314:16
          $fatal;	// src/main/scala/tilelink/Fragmenter.scala:314:16
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        nodeOut_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  wire [7:0]  nodeOut_a_bits_mask = _repeater_io_full ? 8'hFF : nodeIn_a_bits_mask;	// src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Fragmenter.scala:264:30, :314:53, :315:31
  always @(posedge clock) begin
    automatic logic _GEN_0;	// src/main/scala/chisel3/util/Decoupled.scala:52:35
    automatic logic _GEN_1;	// src/main/scala/tilelink/Fragmenter.scala:192:24, :210:27, :212:25, :213:19
    _GEN_0 = nodeOut_d_ready & nodeOut_d_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1205:17
    _GEN_1 = _GEN_0 & dFirst;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Fragmenter.scala:192:24, :195:29, :210:27, :212:25, :213:19
    if (reset) begin
      acknum <= 3'h0;	// src/main/scala/tilelink/Fragmenter.scala:191:29
      dToggle <= 1'h0;	// src/main/scala/tilelink/Fragmenter.scala:193:30
      gennum <= 3'h0;	// src/main/scala/tilelink/Fragmenter.scala:191:29, :293:29
    end
    else begin
      if (_GEN_0) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35
        if (dFirst)	// src/main/scala/tilelink/Fragmenter.scala:195:29
          acknum <= dFirst_acknum;	// src/main/scala/tilelink/Fragmenter.scala:191:29, :205:45
        else	// src/main/scala/tilelink/Fragmenter.scala:195:29
          acknum <= acknum - {2'h0, ack_decrement};	// src/main/scala/diplomacy/LazyModule.scala:367:18, src/main/scala/diplomacy/Nodes.scala:1205:17, :1214:17, src/main/scala/tilelink/Fragmenter.scala:191:29, :206:32, :211:55, src/main/scala/tilelink/Nodes.scala:24:25
      end
      if (_GEN_1)	// src/main/scala/tilelink/Fragmenter.scala:192:24, :210:27, :212:25, :213:19
        dToggle <= nodeOut_d_bits_source[3];	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Fragmenter.scala:193:30, :214:41
      if (nodeOut_a_ready & nodeOut_a_valid)	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/diplomacy/Nodes.scala:1205:17
        gennum <= new_gennum;	// src/main/scala/tilelink/Fragmenter.scala:293:29, :296:26
    end
    if (_GEN_1)	// src/main/scala/tilelink/Fragmenter.scala:192:24, :210:27, :212:25, :213:19
      dOrig <= dFirst_size;	// src/main/scala/chisel3/util/OneHot.scala:32:10, src/main/scala/tilelink/Fragmenter.scala:192:24
    if (aFirst)	// src/main/scala/tilelink/Fragmenter.scala:294:29
      aToggle_r <= dToggle;	// src/main/scala/tilelink/Fragmenter.scala:193:30, :299:54
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      automatic logic [31:0] _RANDOM[0:0];
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM[/*Zero width*/ 1'b0] = `RANDOM;
        acknum = _RANDOM[/*Zero width*/ 1'b0][2:0];	// src/main/scala/tilelink/Fragmenter.scala:191:29
        dOrig = _RANDOM[/*Zero width*/ 1'b0][5:3];	// src/main/scala/tilelink/Fragmenter.scala:191:29, :192:24
        dToggle = _RANDOM[/*Zero width*/ 1'b0][6];	// src/main/scala/tilelink/Fragmenter.scala:191:29, :193:30
        gennum = _RANDOM[/*Zero width*/ 1'b0][9:7];	// src/main/scala/tilelink/Fragmenter.scala:191:29, :293:29
        aToggle_r = _RANDOM[/*Zero width*/ 1'b0][10];	// src/main/scala/tilelink/Fragmenter.scala:191:29, :299:54
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  wire        nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  TLMonitor_14 monitor (	// src/main/scala/tilelink/Nodes.scala:24:25
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (nodeIn_a_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_valid        (nodeIn_a_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_opcode  (nodeIn_a_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_param   (nodeIn_a_bits_param),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_size    (nodeIn_a_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_source  (nodeIn_a_bits_source),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_address (nodeIn_a_bits_address),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_mask    (nodeIn_a_bits_mask),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_a_bits_corrupt (nodeIn_a_bits_corrupt),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_ready        (nodeIn_d_ready),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_valid        (nodeIn_d_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_opcode  (nodeIn_d_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_size    (nodeIn_d_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_in_d_bits_source  (nodeIn_d_bits_source)	// src/main/scala/diplomacy/Nodes.scala:1214:17
  );
  Repeater repeater (	// src/main/scala/tilelink/Fragmenter.scala:264:30
    .clock               (clock),
    .reset               (reset),
    .io_repeat           (~aHasData & (|aFragnum)),	// src/main/scala/tilelink/Edges.scala:93:28, src/main/scala/tilelink/Fragmenter.scala:297:24, :304:{31,41,53}
    .io_enq_valid        (nodeIn_a_valid),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_opcode  (nodeIn_a_bits_opcode),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_param   (nodeIn_a_bits_param),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_size    (nodeIn_a_bits_size),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_source  (nodeIn_a_bits_source),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_address (nodeIn_a_bits_address),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_mask    (nodeIn_a_bits_mask),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_data    (nodeIn_a_bits_data),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_enq_bits_corrupt (nodeIn_a_bits_corrupt),	// src/main/scala/diplomacy/Nodes.scala:1214:17
    .io_deq_ready        (nodeOut_a_ready),	// src/main/scala/diplomacy/Nodes.scala:1205:17
    .io_full             (_repeater_io_full),
    .io_enq_ready        (nodeIn_a_ready),
    .io_deq_valid        (nodeOut_a_valid),
    .io_deq_bits_opcode  (_repeater_io_deq_bits_opcode),
    .io_deq_bits_param   (nodeOut_a_bits_param),
    .io_deq_bits_size    (_repeater_io_deq_bits_size),
    .io_deq_bits_source  (_repeater_io_deq_bits_source),
    .io_deq_bits_address (_repeater_io_deq_bits_address),
    .io_deq_bits_mask    (_repeater_io_deq_bits_mask),
    .io_deq_bits_corrupt (nodeOut_a_bits_corrupt)
  );
  wire [2:0]  nodeOut_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign nodeOut_a_bits_opcode = _repeater_io_deq_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17, src/main/scala/tilelink/Fragmenter.scala:264:30
  assign auto_in_a_ready = nodeIn_a_ready;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_valid = nodeIn_d_valid;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_opcode = nodeIn_d_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_size = nodeIn_d_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_source = nodeIn_d_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_in_d_bits_data = nodeIn_d_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1214:17
  assign auto_out_a_valid = nodeOut_a_valid;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_opcode = nodeOut_a_bits_opcode;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_param = nodeOut_a_bits_param;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_size = nodeOut_a_bits_size;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_source = nodeOut_a_bits_source;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_address = nodeOut_a_bits_address;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_mask = nodeOut_a_bits_mask;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_data = nodeOut_a_bits_data;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_a_bits_corrupt = nodeOut_a_bits_corrupt;	// src/main/scala/diplomacy/Nodes.scala:1205:17
  assign auto_out_d_ready = nodeOut_d_ready;	// src/main/scala/diplomacy/Nodes.scala:1205:17
endmodule


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

module WritebackEntry_5(
  input          clock,
                 reset,
                 io_req_valid,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
                 io_req_bits_voluntary,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
  input  [32:0]  io_req_bits_lineAddr,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
  input  [2:0]   io_req_bits_perm,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
  input          io_req_bits_hasData,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
  input  [511:0] io_req_bits_data,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
  input  [4:0]   io_req_bits_source,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
  input          io_missCheck_valid,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
  input  [32:0]  io_missCheck_lineAddr,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
  input          io_release_ready,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
                 io_grant_valid,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
  output         io_missCheck_blockMiss,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
                 io_release_valid,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
  output [2:0]   io_release_bits_opcode,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
                 io_release_bits_param,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
  output [4:0]   io_release_bits_source,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
  output [31:0]  io_release_bits_address,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
  output [63:0]  io_release_bits_data,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
  output         io_grant_ready,	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
                 io_wbFinish	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
);

  wire         _io_grant_ready_output;	// src/main/scala/gpcdcache/WritebackQueue.scala:152:28
  wire         _io_release_valid_output;	// src/main/scala/gpcdcache/WritebackQueue.scala:136:30
  reg  [1:0]   state;	// src/main/scala/gpcdcache/WritebackQueue.scala:51:26
  wire [4:0]   release_source = 5'hD;	// src/main/scala/tilelink/Edges.scala:381:17
  wire [4:0]   releaseData_source = 5'hD;	// src/main/scala/tilelink/Edges.scala:397:17
  wire [2:0]   releaseData_opcode = 3'h7;	// src/main/scala/tilelink/Edges.scala:397:17
  wire         probeAck_corrupt = 1'h0;	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14, :137:25, src/main/scala/tilelink/Edges.scala:381:17, :397:17, :417:17, :434:17
  wire         probeAckData_corrupt = 1'h0;	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14, :137:25, src/main/scala/tilelink/Edges.scala:381:17, :397:17, :417:17, :434:17
  wire         release_corrupt = 1'h0;	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14, :137:25, src/main/scala/tilelink/Edges.scala:381:17, :397:17, :417:17, :434:17
  wire         releaseData_corrupt = 1'h0;	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14, :137:25, src/main/scala/tilelink/Edges.scala:381:17, :397:17, :417:17, :434:17
  wire [2:0]   probeAck_opcode = 3'h4;	// src/main/scala/tilelink/Edges.scala:417:17
  wire [3:0]   probeAck_size = 4'h6;	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14, :137:25, src/main/scala/tilelink/Edges.scala:381:17, :397:17, :417:17, :434:17
  wire [3:0]   probeAckData_size = 4'h6;	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14, :137:25, src/main/scala/tilelink/Edges.scala:381:17, :397:17, :417:17, :434:17
  wire [3:0]   release_size = 4'h6;	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14, :137:25, src/main/scala/tilelink/Edges.scala:381:17, :397:17, :417:17, :434:17
  wire [3:0]   releaseData_size = 4'h6;	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14, :137:25, src/main/scala/tilelink/Edges.scala:381:17, :397:17, :417:17, :434:17
  wire [63:0]  probeAck_data = 64'h0;	// src/main/scala/tilelink/Edges.scala:381:17, :417:17
  wire [63:0]  release_data = 64'h0;	// src/main/scala/tilelink/Edges.scala:381:17, :417:17
  wire [2:0]   release_opcode = 3'h6;	// src/main/scala/tilelink/Edges.scala:381:17
  wire [2:0]   probeAckData_opcode = 3'h5;	// src/main/scala/tilelink/Edges.scala:434:17
  wire [8:0]   allBeatDone_beats1_decode = 9'h7;	// src/main/scala/tilelink/Edges.scala:221:59
  wire         _reqReg_T = ~(|state) & io_req_valid;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/gpcdcache/WritebackQueue.scala:51:26, :56:17, :91:14
  reg          reqReg_voluntary;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
  reg  [32:0]  reqReg_lineAddr;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
  reg  [2:0]   reqReg_perm;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
  wire [2:0]   probeAck_param = reqReg_perm;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, src/main/scala/tilelink/Edges.scala:417:17
  wire [2:0]   probeAckData_param = reqReg_perm;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, src/main/scala/tilelink/Edges.scala:434:17
  wire [2:0]   release_param = reqReg_perm;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, src/main/scala/tilelink/Edges.scala:381:17
  wire [2:0]   releaseData_param = reqReg_perm;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, src/main/scala/tilelink/Edges.scala:397:17
  reg          reqReg_hasData;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
  wire         allBeatDone_beats1_opdata = reqReg_hasData;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, src/main/scala/tilelink/Edges.scala:103:36
  reg  [511:0] reqReg_data;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
  reg  [4:0]   reqReg_source;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
  wire [4:0]   probeAck_source = reqReg_source;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, src/main/scala/tilelink/Edges.scala:417:17
  wire [4:0]   probeAckData_source = reqReg_source;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, src/main/scala/tilelink/Edges.scala:434:17
  wire         _allBeatDone_T = io_release_ready & _io_release_valid_output;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/gpcdcache/WritebackQueue.scala:136:30
  wire [8:0]   allBeatDone_beats1 = allBeatDone_beats1_opdata ? 9'h7 : 9'h0;	// src/main/scala/tilelink/Edges.scala:103:36, :221:59, :222:14, :230:27
  reg  [8:0]   allBeatDone_counter;	// src/main/scala/tilelink/Edges.scala:230:27
  wire [8:0]   allBeatDone_counter1 = allBeatDone_counter - 9'h1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
  wire         allBeatDone_first = allBeatDone_counter == 9'h0;	// src/main/scala/tilelink/Edges.scala:230:27, :232:25
  wire         allBeatDone_last =
    allBeatDone_counter == 9'h1 | allBeatDone_beats1 == 9'h0;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27, :233:{25,33,43}
  wire         allBeatDone = allBeatDone_last & _allBeatDone_T;	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/tilelink/Edges.scala:233:33, :234:22
  wire [8:0]   allBeatDone_count = allBeatDone_beats1 & ~allBeatDone_counter1;	// src/main/scala/tilelink/Edges.scala:222:14, :231:28, :235:{25,27}
  wire         _GEN = state == 2'h1;	// src/main/scala/gpcdcache/WritebackQueue.scala:51:26, :56:17, :59:19
  wire [1:0]   nextState =
    (|state)
      ? (_GEN
           ? (allBeatDone ? {reqReg_voluntary, 1'h0} : 2'h1)
           : state == 2'h2 ? {~(_io_grant_ready_output & io_grant_valid), 1'h0} : 2'h0)
      : {1'h0, _reqReg_T};	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/gpcdcache/WritebackQueue.scala:31:14, :46:25, :51:26, :52:30, :56:17, :58:25, :59:19, :61:19, :65:25, :66:32, :67:21, :69:21, :72:19, :76:27, :77:19, :79:19, :137:25, :152:28, src/main/scala/tilelink/Edges.scala:234:22, :381:17, :397:17, :417:17, :434:17
  reg  [2:0]   remainBeats;	// src/main/scala/gpcdcache/WritebackQueue.scala:88:28
  wire [511:0] _curBeatData_beatData_T_1 =
    reqReg_data >> {502'h0, 3'h4 - remainBeats, 7'h0};	// src/main/scala/gpcdcache/WritebackQueue.scala:42:{22,32}, :46:25, :88:28, :89:48, src/main/scala/tilelink/Edges.scala:417:17
  wire [127:0] curBeatData = _curBeatData_beatData_T_1[127:0];	// src/main/scala/gpcdcache/WritebackQueue.scala:41:24, :42:{14,22}
  wire [38:0]  releaseAddr = {reqReg_lineAddr, 6'h0};	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, :98:37
  wire [31:0]  probeAck_address = releaseAddr[31:0];	// src/main/scala/gpcdcache/WritebackQueue.scala:98:37, src/main/scala/tilelink/Edges.scala:417:17, :422:15
  wire [31:0]  probeAckData_address = releaseAddr[31:0];	// src/main/scala/gpcdcache/WritebackQueue.scala:98:37, src/main/scala/tilelink/Edges.scala:422:15, :434:17
  wire [31:0]  release_address = releaseAddr[31:0];	// src/main/scala/gpcdcache/WritebackQueue.scala:98:37, src/main/scala/tilelink/Edges.scala:381:17, :422:15
  wire [31:0]  releaseData_address = releaseAddr[31:0];	// src/main/scala/gpcdcache/WritebackQueue.scala:98:37, src/main/scala/tilelink/Edges.scala:397:17, :422:15
  wire [63:0]  probeAckData_data = curBeatData[63:0];	// src/main/scala/gpcdcache/WritebackQueue.scala:41:24, src/main/scala/tilelink/Edges.scala:434:17, :442:15
  wire [63:0]  releaseData_data = curBeatData[63:0];	// src/main/scala/gpcdcache/WritebackQueue.scala:41:24, src/main/scala/tilelink/Edges.scala:397:17, :442:15
  wire         release_legal = releaseAddr[31];	// src/main/scala/gpcdcache/WritebackQueue.scala:98:37, src/main/scala/tilelink/Edges.scala:422:15, src/main/scala/tilelink/Parameters.scala:673:26
  wire         releaseData_legal = releaseAddr[31];	// src/main/scala/gpcdcache/WritebackQueue.scala:98:37, src/main/scala/tilelink/Edges.scala:422:15, src/main/scala/tilelink/Parameters.scala:673:26
  assign _io_release_valid_output = state == 2'h1;	// src/main/scala/gpcdcache/WritebackQueue.scala:51:26, :59:19, :136:30
  assign _io_grant_ready_output = state == 2'h2;	// src/main/scala/gpcdcache/WritebackQueue.scala:51:26, :67:21, :152:28
  always @(posedge clock) begin
    if (_reqReg_T) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35
      reqReg_voluntary <= io_req_bits_voluntary;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
      reqReg_lineAddr <= io_req_bits_lineAddr;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
      reqReg_perm <= io_req_bits_perm;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
      reqReg_hasData <= io_req_bits_hasData;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
      reqReg_data <= io_req_bits_data;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
      reqReg_source <= io_req_bits_source;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
    end
    if (reset) begin
      state <= 2'h0;	// src/main/scala/gpcdcache/WritebackQueue.scala:51:26
      allBeatDone_counter <= 9'h0;	// src/main/scala/tilelink/Edges.scala:230:27
      remainBeats <= 3'h0;	// src/main/scala/gpcdcache/WritebackQueue.scala:88:28
    end
    else begin
      state <= nextState;	// src/main/scala/gpcdcache/WritebackQueue.scala:51:26, :52:30
      if (_allBeatDone_T) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35
        if (allBeatDone_first)	// src/main/scala/tilelink/Edges.scala:232:25
          allBeatDone_counter <= allBeatDone_beats1;	// src/main/scala/tilelink/Edges.scala:222:14, :230:27
        else	// src/main/scala/tilelink/Edges.scala:232:25
          allBeatDone_counter <= allBeatDone_counter1;	// src/main/scala/tilelink/Edges.scala:230:27, :231:28
      end
      if (~(|state) & _reqReg_T) begin	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/gpcdcache/WritebackQueue.scala:51:26, :56:17, :91:{14,28}
        if (io_req_bits_hasData)	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
          remainBeats <= 3'h4;	// src/main/scala/gpcdcache/WritebackQueue.scala:88:28, src/main/scala/tilelink/Edges.scala:417:17
        else	// src/main/scala/gpcdcache/WritebackQueue.scala:31:14
          remainBeats <= 3'h1;	// src/main/scala/gpcdcache/WritebackQueue.scala:88:28, :92:23
      end
      else if (_GEN & _allBeatDone_T)	// src/main/scala/chisel3/util/Decoupled.scala:52:35, src/main/scala/gpcdcache/WritebackQueue.scala:56:17, :93:38
        remainBeats <= remainBeats - 3'h1;	// src/main/scala/gpcdcache/WritebackQueue.scala:88:28, :94:32
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      automatic logic [31:0] _RANDOM[0:17];
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        for (logic [4:0] i = 5'h0; i < 5'h12; i += 5'h1) begin
          _RANDOM[i] = `RANDOM;
        end
        reqReg_voluntary = _RANDOM[5'h0][0];	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
        reqReg_lineAddr = {_RANDOM[5'h0][31:1], _RANDOM[5'h1][1:0]};	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
        reqReg_perm = _RANDOM[5'h1][4:2];	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
        reqReg_hasData = _RANDOM[5'h1][5];	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
        reqReg_data =
          {_RANDOM[5'h1][31:6],
           _RANDOM[5'h2],
           _RANDOM[5'h3],
           _RANDOM[5'h4],
           _RANDOM[5'h5],
           _RANDOM[5'h6],
           _RANDOM[5'h7],
           _RANDOM[5'h8],
           _RANDOM[5'h9],
           _RANDOM[5'hA],
           _RANDOM[5'hB],
           _RANDOM[5'hC],
           _RANDOM[5'hD],
           _RANDOM[5'hE],
           _RANDOM[5'hF],
           _RANDOM[5'h10],
           _RANDOM[5'h11][5:0]};	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
        reqReg_source = _RANDOM[5'h11][10:6];	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25
        state = _RANDOM[5'h11][12:11];	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, :51:26
        allBeatDone_counter = _RANDOM[5'h11][21:13];	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, src/main/scala/tilelink/Edges.scala:230:27
        remainBeats = _RANDOM[5'h11][24:22];	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, :88:28
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_missCheck_blockMiss =
    io_missCheck_valid & (|state) & io_missCheck_lineAddr == reqReg_lineAddr;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, :51:26, :144:25, :148:27, :149:28
  assign io_release_valid = _io_release_valid_output;	// src/main/scala/gpcdcache/WritebackQueue.scala:136:30
  assign io_release_bits_opcode = {1'h1, reqReg_voluntary, reqReg_hasData};	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, :137:25, src/main/scala/tilelink/Edges.scala:231:28
  assign io_release_bits_param =
    reqReg_voluntary
      ? (reqReg_hasData ? releaseData_param : release_param)
      : reqReg_hasData ? probeAckData_param : probeAck_param;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, :137:25, :139:8, :140:8, src/main/scala/tilelink/Edges.scala:381:17, :397:17, :417:17, :434:17
  assign io_release_bits_source =
    reqReg_voluntary ? 5'hD : reqReg_hasData ? probeAckData_source : probeAck_source;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, :137:25, :140:8, src/main/scala/tilelink/Edges.scala:417:17, :434:17
  assign io_release_bits_address =
    reqReg_voluntary
      ? (reqReg_hasData ? releaseData_address : release_address)
      : reqReg_hasData ? probeAckData_address : probeAck_address;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, :137:25, :139:8, :140:8, src/main/scala/tilelink/Edges.scala:381:17, :397:17, :417:17, :434:17
  assign io_release_bits_data =
    reqReg_hasData ? (reqReg_voluntary ? releaseData_data : probeAckData_data) : 64'h0;	// src/main/scala/gpcdcache/WritebackQueue.scala:46:25, :137:25, :139:8, :140:8, src/main/scala/tilelink/Edges.scala:381:17, :397:17, :417:17, :434:17
  assign io_grant_ready = _io_grant_ready_output;	// src/main/scala/gpcdcache/WritebackQueue.scala:152:28
  assign io_wbFinish = (|state) & nextState == 2'h0;	// src/main/scala/gpcdcache/WritebackQueue.scala:51:26, :52:30, :144:{25,40,54}
endmodule


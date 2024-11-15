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

module DataArray(
  input         clock,
                reset,
                io_read_valid,	// src/main/scala/gpcdcache/DataArray.scala:73:14
  input  [6:0]  io_read_bits_setIdx,	// src/main/scala/gpcdcache/DataArray.scala:73:14
  input         io_write_valid,	// src/main/scala/gpcdcache/DataArray.scala:73:14
  input  [6:0]  io_write_bits_setIdx,	// src/main/scala/gpcdcache/DataArray.scala:73:14
  input  [3:0]  io_write_bits_wayEn,	// src/main/scala/gpcdcache/DataArray.scala:73:14
  input  [63:0] io_write_bits_data_0,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_write_bits_data_1,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_write_bits_data_2,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_write_bits_data_3,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_write_bits_data_4,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_write_bits_data_5,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_write_bits_data_6,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_write_bits_data_7,	// src/main/scala/gpcdcache/DataArray.scala:73:14
  output [63:0] io_resp_0_0,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_0_1,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_0_2,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_0_3,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_0_4,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_0_5,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_0_6,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_0_7,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_1_0,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_1_1,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_1_2,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_1_3,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_1_4,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_1_5,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_1_6,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_1_7,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_2_0,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_2_1,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_2_2,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_2_3,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_2_4,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_2_5,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_2_6,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_2_7,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_3_0,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_3_1,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_3_2,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_3_3,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_3_4,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_3_5,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_3_6,	// src/main/scala/gpcdcache/DataArray.scala:73:14
                io_resp_3_7	// src/main/scala/gpcdcache/DataArray.scala:73:14
);

  wire wen = io_write_valid;	// src/main/scala/gpcdcache/DataArray.scala:82:30
  wire wen_1 = io_write_valid;	// src/main/scala/gpcdcache/DataArray.scala:82:30
  wire wen_2 = io_write_valid;	// src/main/scala/gpcdcache/DataArray.scala:82:30
  wire wen_3 = io_write_valid;	// src/main/scala/gpcdcache/DataArray.scala:82:30
  wire wen_4 = io_write_valid;	// src/main/scala/gpcdcache/DataArray.scala:82:30
  wire wen_5 = io_write_valid;	// src/main/scala/gpcdcache/DataArray.scala:82:30
  wire wen_6 = io_write_valid;	// src/main/scala/gpcdcache/DataArray.scala:82:30
  wire wen_7 = io_write_valid;	// src/main/scala/gpcdcache/DataArray.scala:82:30
  DataSRAMBank dataBanks_0 (	// src/main/scala/gpcdcache/DataArray.scala:79:52
    .clock                (clock),
    .reset                (reset),
    .io_read_valid        (io_read_valid),
    .io_read_bits_setIdx  (io_read_bits_setIdx),
    .io_write_valid       (wen),	// src/main/scala/gpcdcache/DataArray.scala:82:30
    .io_write_bits_setIdx (io_write_bits_setIdx),
    .io_write_bits_wayEn  (io_write_bits_wayEn),
    .io_write_bits_data   (io_write_bits_data_0),
    .io_resp_0            (io_resp_0_0),
    .io_resp_1            (io_resp_1_0),
    .io_resp_2            (io_resp_2_0),
    .io_resp_3            (io_resp_3_0)
  );
  DataSRAMBank dataBanks_1 (	// src/main/scala/gpcdcache/DataArray.scala:79:52
    .clock                (clock),
    .reset                (reset),
    .io_read_valid        (io_read_valid),
    .io_read_bits_setIdx  (io_read_bits_setIdx),
    .io_write_valid       (wen_1),	// src/main/scala/gpcdcache/DataArray.scala:82:30
    .io_write_bits_setIdx (io_write_bits_setIdx),
    .io_write_bits_wayEn  (io_write_bits_wayEn),
    .io_write_bits_data   (io_write_bits_data_1),
    .io_resp_0            (io_resp_0_1),
    .io_resp_1            (io_resp_1_1),
    .io_resp_2            (io_resp_2_1),
    .io_resp_3            (io_resp_3_1)
  );
  DataSRAMBank dataBanks_2 (	// src/main/scala/gpcdcache/DataArray.scala:79:52
    .clock                (clock),
    .reset                (reset),
    .io_read_valid        (io_read_valid),
    .io_read_bits_setIdx  (io_read_bits_setIdx),
    .io_write_valid       (wen_2),	// src/main/scala/gpcdcache/DataArray.scala:82:30
    .io_write_bits_setIdx (io_write_bits_setIdx),
    .io_write_bits_wayEn  (io_write_bits_wayEn),
    .io_write_bits_data   (io_write_bits_data_2),
    .io_resp_0            (io_resp_0_2),
    .io_resp_1            (io_resp_1_2),
    .io_resp_2            (io_resp_2_2),
    .io_resp_3            (io_resp_3_2)
  );
  DataSRAMBank dataBanks_3 (	// src/main/scala/gpcdcache/DataArray.scala:79:52
    .clock                (clock),
    .reset                (reset),
    .io_read_valid        (io_read_valid),
    .io_read_bits_setIdx  (io_read_bits_setIdx),
    .io_write_valid       (wen_3),	// src/main/scala/gpcdcache/DataArray.scala:82:30
    .io_write_bits_setIdx (io_write_bits_setIdx),
    .io_write_bits_wayEn  (io_write_bits_wayEn),
    .io_write_bits_data   (io_write_bits_data_3),
    .io_resp_0            (io_resp_0_3),
    .io_resp_1            (io_resp_1_3),
    .io_resp_2            (io_resp_2_3),
    .io_resp_3            (io_resp_3_3)
  );
  DataSRAMBank dataBanks_4 (	// src/main/scala/gpcdcache/DataArray.scala:79:52
    .clock                (clock),
    .reset                (reset),
    .io_read_valid        (io_read_valid),
    .io_read_bits_setIdx  (io_read_bits_setIdx),
    .io_write_valid       (wen_4),	// src/main/scala/gpcdcache/DataArray.scala:82:30
    .io_write_bits_setIdx (io_write_bits_setIdx),
    .io_write_bits_wayEn  (io_write_bits_wayEn),
    .io_write_bits_data   (io_write_bits_data_4),
    .io_resp_0            (io_resp_0_4),
    .io_resp_1            (io_resp_1_4),
    .io_resp_2            (io_resp_2_4),
    .io_resp_3            (io_resp_3_4)
  );
  DataSRAMBank dataBanks_5 (	// src/main/scala/gpcdcache/DataArray.scala:79:52
    .clock                (clock),
    .reset                (reset),
    .io_read_valid        (io_read_valid),
    .io_read_bits_setIdx  (io_read_bits_setIdx),
    .io_write_valid       (wen_5),	// src/main/scala/gpcdcache/DataArray.scala:82:30
    .io_write_bits_setIdx (io_write_bits_setIdx),
    .io_write_bits_wayEn  (io_write_bits_wayEn),
    .io_write_bits_data   (io_write_bits_data_5),
    .io_resp_0            (io_resp_0_5),
    .io_resp_1            (io_resp_1_5),
    .io_resp_2            (io_resp_2_5),
    .io_resp_3            (io_resp_3_5)
  );
  DataSRAMBank dataBanks_6 (	// src/main/scala/gpcdcache/DataArray.scala:79:52
    .clock                (clock),
    .reset                (reset),
    .io_read_valid        (io_read_valid),
    .io_read_bits_setIdx  (io_read_bits_setIdx),
    .io_write_valid       (wen_6),	// src/main/scala/gpcdcache/DataArray.scala:82:30
    .io_write_bits_setIdx (io_write_bits_setIdx),
    .io_write_bits_wayEn  (io_write_bits_wayEn),
    .io_write_bits_data   (io_write_bits_data_6),
    .io_resp_0            (io_resp_0_6),
    .io_resp_1            (io_resp_1_6),
    .io_resp_2            (io_resp_2_6),
    .io_resp_3            (io_resp_3_6)
  );
  DataSRAMBank dataBanks_7 (	// src/main/scala/gpcdcache/DataArray.scala:79:52
    .clock                (clock),
    .reset                (reset),
    .io_read_valid        (io_read_valid),
    .io_read_bits_setIdx  (io_read_bits_setIdx),
    .io_write_valid       (wen_7),	// src/main/scala/gpcdcache/DataArray.scala:82:30
    .io_write_bits_setIdx (io_write_bits_setIdx),
    .io_write_bits_wayEn  (io_write_bits_wayEn),
    .io_write_bits_data   (io_write_bits_data_7),
    .io_resp_0            (io_resp_0_7),
    .io_resp_1            (io_resp_1_7),
    .io_resp_2            (io_resp_2_7),
    .io_resp_3            (io_resp_3_7)
  );
endmodule


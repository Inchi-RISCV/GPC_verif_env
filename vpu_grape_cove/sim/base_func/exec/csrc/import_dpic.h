
 extern void debug_rob_push_trace(/* INPUT */int hartid, /* INPUT */unsigned char should_wb, /* INPUT */unsigned char has_wb, /* INPUT */long long wb_tag, /* INPUT */unsigned char trace_valid, /* INPUT */long long trace_iaddr, /* INPUT */long long trace_insn, /* INPUT */int trace_priv, /* INPUT */unsigned char trace_exception, /* INPUT */unsigned char trace_interrupt, 
/* INPUT */long long trace_cause, /* INPUT */long long trace_tval, const /* INPUT */long long *trace_wdata);

 extern void debug_rob_push_wb(/* INPUT */int hartid, /* INPUT */unsigned char valid, /* INPUT */long long wb_tag, const /* INPUT */long long *wb_data);

 extern void debug_rob_pop_trace(/* INPUT */int hartid, /* OUTPUT */unsigned char *trace_valid, /* OUTPUT */long long *trace_iaddr, /* OUTPUT */long long *trace_insn, /* OUTPUT */int *trace_priv, /* OUTPUT */unsigned char *trace_exception, /* OUTPUT */unsigned char *trace_interrupt, /* OUTPUT */long long *trace_cause, /* OUTPUT */long long *trace_tval, /* OUTPUT */long long *trace_wdata
);

 extern int debug_tick(/* OUTPUT */unsigned char *debug_req_valid, /* INPUT */unsigned char debug_req_ready, /* OUTPUT */int *debug_req_bits_addr, /* OUTPUT */int *debug_req_bits_op, /* OUTPUT */int *debug_req_bits_data, /* INPUT */unsigned char debug_resp_valid, /* OUTPUT */unsigned char *debug_resp_ready, /* INPUT */int debug_resp_bits_resp, /* INPUT */int debug_resp_bits_data);

 extern unsigned char inchi_difftest_init();

 extern unsigned char inchi_difftest_memcpy(/* INPUT */const char* s);

 extern unsigned char inchi_difftest_exec();

 extern unsigned char raise_intr();

 extern unsigned char inchi_difftest_set_reg(const /* INPUT */svBitVecVal *arr);

 extern unsigned char inchi_difftest_get_reg(/* OUTPUT */svBitVecVal *arr);

 extern int uvm_hdl_check_path(/* INPUT */const char* path);

 extern int uvm_hdl_deposit(/* INPUT */const char* path, const /* INPUT */svLogicVecVal *value);

 extern int uvm_hdl_force(/* INPUT */const char* path, const /* INPUT */svLogicVecVal *value);

 extern int uvm_hdl_release_and_read(/* INPUT */const char* path, /* INOUT */svLogicVecVal *value);

 extern int uvm_hdl_release(/* INPUT */const char* path);

 extern int uvm_hdl_read(/* INPUT */const char* path, /* OUTPUT */svLogicVecVal *value);

 extern SV_STRING uvm_hdl_read_string(/* INPUT */const char* path);

 extern int uvm_memory_load(/* INPUT */const char* nid, /* INPUT */const char* scope, /* INPUT */const char* fileName, /* INPUT */const char* radix, /* INPUT */const char* startaddr, /* INPUT */const char* endaddr, /* INPUT */const char* types);

 extern SV_STRING uvm_dpi_get_next_arg_c(/* INPUT */int init);

 extern SV_STRING uvm_dpi_get_tool_name_c();

 extern SV_STRING uvm_dpi_get_tool_version_c();

 extern void* uvm_dpi_regcomp(/* INPUT */const char* regex);

 extern int uvm_dpi_regexec(/* INPUT */void* preg, /* INPUT */const char* str);

 extern void uvm_dpi_regfree(/* INPUT */void* preg);

 extern int uvm_re_match(/* INPUT */const char* re, /* INPUT */const char* str);

 extern void uvm_dump_re_cache();

 extern SV_STRING uvm_glob_to_re(/* INPUT */const char* glob);

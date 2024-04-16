cppdbg_exceptions = { "SIGABRT", "SEGFAULT", "SIGINT", "stopped", "aborted", "Assertion" }
return {
  rust = {
    exception_breakpoints = {
      "panicked"
    }  
  },
  cpp = {
    exception_breakpoints = cppdbg_exceptions
  },
  c = {
    exception_breakpoints = cppdbg_exceptions
  }
}



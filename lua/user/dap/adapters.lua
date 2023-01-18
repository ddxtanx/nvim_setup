require('dap').set_log_level('DEBUG')
code_lldb_port_num = 13000

return {
  lldb = {
    type = 'server',
    executable = { 
      command = '/Users/Garrett_Credi/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/adapter/codelldb',
      args = {"--port", code_lldb_port_num},  -- adjust as needed, must be absolute path
    },
    name = 'lldb',
    host = '127.0.0.1',
    port = code_lldb_port_num, 
  }
}

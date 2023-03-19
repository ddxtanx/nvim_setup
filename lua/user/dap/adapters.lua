code_lldb_port_num = 13000
default = {
  type = "server",
  executable = {
    command = vim.env.HOME .. "/.config/nvim/lua/user/dap/codelldb/adapter/codelldb",
    args = { "--port", code_lldb_port_num }, -- adjust as needed, must be absolute path
  },
  name = "lldb",
  host = "127.0.0.1",
  port = code_lldb_port_num,
}

return {
  lldb = default,
  cppdbg = default,
}

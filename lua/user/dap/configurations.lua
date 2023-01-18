cpp_conf = {
    name = 'VSCode LLDB Debugger',
    type = 'lldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
}

rust_conf = cpp_conf

rust_conf['program'] = function()
  vim.fn.system('cargo build')
  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
end

require("dap").defaults.rust.exception_breakpoints = {"panicked"}

return {
  cpp = {cpp_conf},
  c = {cpp_conf},
  rust = {rust_conf}
}

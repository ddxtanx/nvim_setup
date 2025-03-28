vim.cmd [[
tnoremap("<esc>", "<C-\><C-n>", opts)
tnoremap('jk', "<C-\><C-n>", opts)
tnoremap('<C-h>', "<C-\><C-n><C-W>h", opts)
tnoremap('<C-j>', "<C-\><C-n><C-W>j", opts)
tnoremap('<C-k>', "<C-\><C-n><C-W>k", opts)
tnoremap('<C-l>', "<C-\><C-n><C-W>l", opts)
]]

vim.keymap.set(
  "n",
  "<Leader>dC",
  ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
  { desc = "Set a conditional breakpoint" }
)
vim.keymap.set(
  "n",
  "<Leader>dE",
  ":lua require'dap'.set_exception_breakpoints({'all'})<cr>",
  { desc = "Set an exception breakpoint" }
)
vim.keymap.set(
  "n",
  "<leader>dV",
  ":lua require('dap.ext.vscode').load_launchjs(nil, { lldb = {'c', 'cpp', 'rust' }, cppdbg = {'c', 'cpp'} })<cr>",
  { desc = "Loads a launch.json config for debugging" }
)

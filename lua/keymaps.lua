vim.cmd([[
tnoremap("<esc>", "<C-\><C-n>", opts)
tnoremap('jk', "<C-\><C-n>", opts)
tnoremap('<C-h>', "<C-\><C-n><C-W>h", opts)
tnoremap('<C-j>', "<C-\><C-n><C-W>j", opts)
tnoremap('<C-k>', "<C-\><C-n><C-W>k", opts)
tnoremap('<C-l>', "<C-\><C-n><C-W>l", opts)
]])

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


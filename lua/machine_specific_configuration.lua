--automatic autocorrect keybound to <Leader>l
vim.api.nvim_set_keymap("i", "<Leader>l", "<c-g>u<Esc>[s1z=`]a<c-g>u", { noremap = true })

vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"
vim.cmd([[
  set conceallevel=1
]])
vim.g.tex_conceal='abdmg'
vim.g.UltiSnipsSnippetDirectories={"UltiSnips"}
vim.opt.numberwidth = 3
vim.o.statuscolumn = "%=%{v:lnum . '  ' : v:lnum}%=%s"

vim.g.vimtex_view_method = "skim"
vim.cmd([[
  set conceallevel=1
]])
vim.g.tex_conceal='abdmg'
vim.g.UltiSnipsSnippetDirectories={"UltiSnips"}
vim.opt.numberwidth = 3
vim.o.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"

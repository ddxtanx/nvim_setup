return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if not opts.ignore_install then opts.ignore_install = {} end
      vim.list_extend(opts.ignore_install, { "latex" })
    end,
  },
}

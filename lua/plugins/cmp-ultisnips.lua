return {
  "Saghen/blink.cmp",
  optional = true,
  dependencies = {
    "quangnguyen30192/cmp-nvim-ultisnips",
  },
  spec = {
    {
      "Saghen/blink.compat",
      version = "*",
      lazy = true,
      opts = {},
    },
  },
  opts = {
    sources = {
      default = { "lsp", "path", "buffer", "snippets", "ultisnips" },
      providers = {
        ultisnips = {
          name = "ultisnips",
          module = "blink.compat.source",
          score_offset = 3,
        },
      },
    },
  },
}

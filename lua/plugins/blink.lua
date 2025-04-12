return {
  "Saghen/blink.cmp",
  opts = {
    keymap = {
      ["<Tab>"] = { "snippet_forward", "fallback" },
    },
    sources = {
      providers = {
        lsp = { score_offset = 10 },
        snippets = { score_offset = 9 },
        buffer = { score_offset = 1 },
        path = { score_offset = 2 },
        ultisnips = { score_offset = 8 },
        vimtex = { score_offset = 9 },
      },
    },
  },
}

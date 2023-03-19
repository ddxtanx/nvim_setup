return {
  "AstroNvim/astrocommunity",
  {
    import = "astrocommunity.pack.rust",
    opts = {
      
    },
  },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.colorscheme.tokyonight", enable=true },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.treej" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.media.pets-nvim" },
  { import = "astrocommunity.note-taking.neorg" },
  { import = "astrocommunity.project.nvim-spectre" },
  { import = "astrocommunity.test.neotest" },
  {
    "simrat39/rust-tools.nvim",
    opts = {
      server = {
        settings = {
          -- to enable rust-analyzer settings visit:
          -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
          ["rust-analyzer"] = {
            -- enable clippy on save
            cargo = {
                features = "all",
            },
            checkOnSave = {
                command = "clippy",
            },
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },

            inlayHints = {
                typeHints = {
                    enable =  true,
                },
                chainingHints = {
                    enable = true,
                },
            },
          },
        },
      },
    }
  }
}

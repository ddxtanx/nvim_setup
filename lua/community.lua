-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  {
    import = "astrocommunity.pack.rust",
  },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.json" },
  {
    import = "astrocommunity.completion.copilot-lua",
  },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.media.pets-nvim" },
  { import = "astrocommunity.note-taking.neorg" },
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
                enable = true,
              },
              chainingHints = {
                enable = true,
              },
            },
          },
        },
      },
    },
  },
  {
    "copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-S-CR>",
          accept_line = "<C-CR>",
        },
      },
    },
  },
  -- import/override with your plugins folder
}

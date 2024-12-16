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
    "copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-S-Enter>",
          accept_line = "<C-Enter>",
        },
      },
    },
  },
  -- import/override with your plugins folder
}

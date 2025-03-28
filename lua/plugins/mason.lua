-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      ensure_installed = {
        "lua-language-server",
        "debugpy",
        "stylua",
        "tree-sitter-cli",
        "basedpyright",
        "json-lsp",
        "neocmakelsp",
        "taplo",
        "codelldb",
        -- add more arguments for adding more language servers
      },
    },
  },
}

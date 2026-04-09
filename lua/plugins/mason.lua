-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "mason-org/mason.nvim",
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
        "ruff",
        -- add more arguments for adding more language servers
      },
    },
  },
}

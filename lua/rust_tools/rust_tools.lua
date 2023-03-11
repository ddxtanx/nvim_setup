local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

---- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local rt = require("rust-tools")
require("inlay-hints").setup({
  only_current_line = true,

  eol = {
    right_align = true,
  }
})
local ih = require("inlay-hints")


local opts = {
  tools = { -- rust-tools options

    -- how to execute terminal commands
    -- options right now: termopen / quickfix

    -- callback to execute once rust-analyzer is done initializing the workspace
    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"

    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
    reload_workspace_from_cargo_toml = true,

    -- These apply to the default RustSetInlayHints command
    on_initialized = function()
      ih.set_all()
    end,
    inlay_hints = {
      auto = true,
    },
   -- options same as lsp hover / vim.lsp.util.open_floating_preview()
    hover_actions = {

      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },

      -- Maximal width of the hover window. Nil means no max.
      max_width = nil,

      -- Maximal height of the hover window. Nil means no max.
      max_height = nil,

      -- whether the hover action window gets automatically focused
      -- default: false
      auto_focus = false,
    },
  },
  
  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
	server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = function(c, b)
      ih.on_attach(c, b)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
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
  -- debugging stuff
  dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
  },
  -- dap = {
  --   adapter = {
  --     type = "server",
  --     port = "21111",
  --     host = "127.0.0.1",
  --     executable = {
  --       command = codelldb_path,
  --       args = { "--liblldb", liblldb_path, "--port", "21111" },
  --     },  

}
local rust_tools = require("rust-tools")
rust_tools.setup(opts)


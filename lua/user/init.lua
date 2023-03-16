--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "nightly",   -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main",       -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false,   -- automatically reload and sync packer after a successful update
    auto_quit = false,     -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },
  -- Set colorscheme to use
  colorscheme = "tokyonight-night",
  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },
  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true,         -- sets vim.opt.number
      spell = false,         -- sets vim.opt.spell
      signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
      wrap = false,          -- sets vim.opt.wrap
    },
    g = {
      mapleader = " ",                   -- sets vim.g.mapleader
      autoformat_enabled = true,         -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true,                -- enable completion at start
      autopairs_enabled = true,          -- enable autopairs at start
      diagnostics_enabled = true,        -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline
      icons_enabled = true,              -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true,   -- disable notifications when toggling UI elements
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {
    " █████  ███████ ████████ ██████   ██████",
    "██   ██ ██         ██    ██   ██ ██    ██",
    "███████ ███████    ██    ██████  ██    ██",
    "██   ██      ██    ██    ██   ██ ██    ██",
    "██   ██ ███████    ██    ██   ██  ██████",
    " ",
    "    ███    ██ ██    ██ ██ ███    ███",
    "    ████   ██ ██    ██ ██ ████  ████",
    "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "    ██   ████   ████   ██ ██      ██",
  },
  -- Default theme configuration
  default_theme = {
    -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#1e222a",
    },
    highlights = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      hl.Normal = { fg = C.fg, bg = C.bg }

      -- New approach instead of diagnostic_style
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      cmp = true,
      dashboard = true,
      highlighturl = true,
      hop = true,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      treesitter = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      "pyright",
      "clangd"
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false,    -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },
  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["tn"] = { ":bn<cr>", desc = "Next tab" },
      ["tp"] = { ":bp<cr>", desc = "Previous tab" },
      ["tq"] = { ":bd<cr>", desc = "Close tab" },
      ["<leader>uD"] = { "<cmd> echo system('date')<cr>", desc = "Display Current Time" },
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },
  plugins = {
    -- You can disable default plugins as follows:
    -- ["goolord/alpha-nvim"] = { disable = true },

    -- You can also add new plugins here as well:
    -- Add plugins, the packer syntax without the "use"
    -- require("user/plugins/community"),
    {
      "ActivityWatch/aw-watcher-vim",
      lazy = false
    },
    {
      "iamcco/markdown-preview.nvim",
      build = function() vim.fn["mkdp#util#install"]() end,
      ft = "md"
    },
    {
      "ray-x/lsp_signature.nvim",
      config = function() require("lsp_signature/setup") end,
      event = "BufEnter"
    },
    {
      'paretje/nvim-man',
      ft = {
        "c",
        "cpp",
        "h",
        "hpp"
      }
    },
    {
      'EthanJWright/vs-tasks.nvim',
      dependencies = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim'
      },
      keys = "<leader>v"
    },
    {
      "simrat39/inlay-hints.nvim",
      ft = "rs"
    },
    -- {
    --   "simrat39/rust-tools.nvim",
    --   dependencies = {
    --     "simrat39/inlay-hints.nvim",
    --   },
    --   config = function() require("rust_tools/rust_tools") end,
    --   lazy = false,
    -- },
    {
      'SirVer/ultisnips'
    },
    {
      'lervag/vimtex',
      ft = "tex"
    },
    {
      "Pocco81/auto-save.nvim",
      config = function()
        require("auto-save").setup {
        }
      end,
      event = "BufEnter"
    },
    {
      "andweeb/presence.nvim",
      config = function() require("presence/setup") end,
      lazy = false
    },
    "quangnguyen30192/cmp-nvim-ultisnips",
    { -- override nvim-autopairs plugin
      "hrsh7th/nvim-cmp",
      dependencies = {
        "quangnguyen30192/cmp-nvim-ultisnips",
        "SirVer/ultisnips"
      },
      -- override the options table that is used in the `require("cmp").setup()` call
      opts = function(_, opts)
        -- opts parameter is the default options table
        -- the function is lazy loaded so cmp is able to be required
        local cmp = require "cmp"
        -- modify the sources part of the options table
        opts.sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 1000 },
          { name = "ultisnips", priority = 900 },
          { name = "luasnip", priority = 750 },
          { name = "buffer", priority = 500 },
          { name = "path", priority = 250 },
        }

        -- return the new table to be used
        return opts
      end
    },
    {
      "ggandor/leap.nvim",
      config = function()
        require('leap').add_default_mappings()
      end,
      event = "BufEnter"
    },
    'folke/tokyonight.nvim',
    require("user/astrocommunity"),
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      dependencies = {
        "nvim-treesitter/nvim-treesitter"
      },
      event = "BufEnter",
      config = function() 
        require'nvim-treesitter.configs'.setup {
          textobjects = {
            select = {
              enable = true,

              -- Automatically jump forward to textobj, similar to targets.vim
              lookahead = true,

              keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                -- You can also use captures from other query groups like `locals.scm`
                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
              },
              -- You can choose the select mode (default is charwise 'v')
              --
              -- Can also be a function which gets passed a table with the keys
              -- * query_string: eg '@function.inner'
              -- * method: eg 'v' or 'o'
              -- and should return the mode ('v', 'V', or '<c-v>') or a table
              -- mapping query_strings to modes.
              selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
              },
              -- If you set this to `true` (default is `false`) then any textobject is
              -- extended to include preceding or succeeding whitespace. Succeeding
              -- whitespace has priority in order to act similarly to eg the built-in
              -- `ap`.
              --
              -- Can also be a function which gets passed a table with the keys
              -- * query_string: eg '@function.inner'
              -- * selection_mode: eg 'v'
              -- and should return true of false
              include_surrounding_whitespace = true,
            },
          },
        }
      end
    }
    -- {
    --   "saecki/crates.nvim",
    --   tag = "v0.3.0",
    --   requires = { "nvim-lua/plenary.nvim" },
    --   after = "nvim-cmp",
    --   config = function()
    --     require("crates").setup()
    --     astronvim.add_cmp_source("crates", 100)
    --   end,
    -- },
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },

    -- We also support a key value style plugin definition similar to NvChad:
    -- ["ray-x/lsp_signature.nvim"] = {
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ---    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
    ---      -- config variable is the default configuration table for the setup function call
    ---      local null_ls = require "null-ls"
    ---
    ---      -- Check supported formatters and linters
    ---      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    ---      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    ---      config.sources = {
    ---        -- Set a formatter
    ---        -- null_ls.builtins.formatting.stylua,
    ---        -- null_ls.builtins.formatting.prettier,
    ---        null_ls.builtins.formatting.rustfmt,
    ---      }
    ---      return config -- return final config table
    ---    end,
    ---    treesitter = { -- overrides `require("treesitter").setup(...)`
    ---      -- ensure_installed = { "lua" },
    ---    },
    ---    -- use mason-lspconfig to configure LSP installations
    ---    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
    ---      -- ensure_installed = { "sumneko_lua" },
    ---    },
    --       {
    --         "williamboman/mason-lspconfig.nvim",
    --         config = function(plugin, opts)
    --           require("plugins.configs.mason-lspconfig")(plugin, {
    --             ensure_installed = {
    --               "clangd",
    --               "pyright",
    --             }
    --           })
    --         end,
    --         lazy = false
    --       },
    -- ---    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    -- ---    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
    -- ---      -- ensure_installed = { "prettier", "stylua", "rustfmt" },
    -- ---    },
    --       {
    --         "jay-babu/mason-null-ls.nvim",
    --         config = function(plugin, opts)
    --           require("plugins.configs.mason-null-ls")(plugin,{
    --             ensure_installed = {
    --               "cmakelang",
    --               "luacheck",
    --               "pyflakes",
    --               "autopep8",
    --               "latexindent",
    --               "rustfmt"
    --             }
    --           })
    --         end,
    --         lazy = false
    --       },
    ---    "mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
    ---      ensure_installed = { "cppdbg" },
    ---    },
  },
  -- LuaSnip Options
  luasnip = {
    -- Extend filetypes
    filetype_extend = {
      -- javascript = { "javascriptreact" },
    },
    -- Configure luasnip loaders (vscode, lua, and/or snipmate)
    vscode = {
      -- Add paths for including more VS Code style snippets in luasnip
      paths = {},
    },
  },
  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      ultisnips = 1200,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },
  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    require "constants"
    require "keymaps"
  end,
  dap = {
    adapters = require("user/dap/adapters"),
    configurations = require("user/dap/configurations"),
    defaults = require("user/dap/defaults")
  }
}

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"


return config

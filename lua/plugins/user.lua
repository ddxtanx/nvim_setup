-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            " █████  ███████ ████████ ██████   ██████ ",
            "██   ██ ██         ██    ██   ██ ██    ██",
            "███████ ███████    ██    ██████  ██    ██",
            "██   ██      ██    ██    ██   ██ ██    ██",
            "██   ██ ███████    ██    ██   ██  ██████ ",
            "",
            "███    ██ ██    ██ ██ ███    ███",
            "████   ██ ██    ██ ██ ████  ████",
            "██ ██  ██ ██    ██ ██ ██ ████ ██",
            "██  ██ ██  ██  ██  ██ ██  ██  ██",
            "██   ████   ████   ██ ██      ██",
          }, "\n"),
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      style = "storm",
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules {
        Rule("$", "$", { "tex", "latex" }):with_move(function(opts_2) return opts_2.next_char == opts_2.char end),
        -- Rule("$", "$", { "tex", "latex" })
        --   -- don't add a pair if the next character is %
        --   :with_pair(cond.not_after_regex "%%")
        --   -- don't add a pair if  the previous character is xxx
        --   :with_pair(cond.not_before_regex("xxx", 3))
        --   -- don't move right when repeat character
        --   :with_move(cond.none())
        --   -- don't delete if the next character is xx
        --   :with_del(cond.not_after_regex "xx")
        --   -- disable adding a newline when you press <cr>
        --   :with_cr(cond.none()),
      }
      npairs.get_rule("'")[1].not_filetypes = { "tex", "rs" }
    end,
  },
  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    event = {
      "BufEnter *.py",
      "BufEnter *.ipynb",
    },
    -- build = "conda run --no-capture-output -n jupynium pip install .",
    -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    event = {
      "BufEnter",
    },
  },
  {
    "lambdalisue/suda.vim",
    event = "BufEnter",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufEnter",
  },
  {
    "ActivityWatch/aw-watcher-vim",
    lazy = false,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
    ft = "markdown",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require("lsp_signature").setup(opts) end,
  },
  {
    "paretje/nvim-man",
    ft = {
      "c",
      "cpp",
      "h",
      "hpp",
    },
  },
  {
    "simrat39/inlay-hints.nvim",
    ft = "rs",
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
    "SirVer/ultisnips",
    config = function()
      vim.g.UltiSnipsExpandTrigger = "<tab>"
      vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"
    end,
  },
  {
    "mattn/emmet-vim",
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_view_sioyek_options = "--new-window"
      vim.g.tex_conceal = "abdmg"
      vim.opt_local.conceallevel = 2
      vim.g.vimtex_quickfix_mode = 0
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_compiler_latexmk_engines = {
        _ = "-lualatex",
      }
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "mustache/vim-mustache-handlebars",
    ft = "hbs",
  },
  {
    "kevinhwang91/nvim-fundo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "BufEnter",
    build = function() require("fundo").install() end,
    setup = function() require("fundo").setup() end,
  },
  {
    "IogaMaster/neocord",
    event = "VeryLazy",
  },
  { "nvim-neotest/nvim-nio" },
  {
    "AstroNvim/astrolsp",
    opts = {
      -- set configuration options  as described below
    },
  },
  {
    "ggandor/leap.nvim",
    config = function() require("leap").add_default_mappings() end,
    event = "BufEnter",
  },
}

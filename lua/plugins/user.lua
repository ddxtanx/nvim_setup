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
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
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
      }
      return opts
    end,
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
    "EthanJWright/vs-tasks.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = "<leader>v",
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
  },
  {
    "mattn/emmet-vim",
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "sioyek"
      vim.g.tex_conceal = "abdmg"
      vim.opt_local.conceallevel = 2
      vim.g.vimtex_quickfix_mode = 0
      vim.g.tex_flavor = "latex"
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
  "quangnguyen30192/cmp-nvim-ultisnips",
  { -- override nvim-autopairs plugin
    "hrsh7th/nvim-cmp",
    dependencies = {
      "quangnguyen30192/cmp-nvim-ultisnips",
      "SirVer/ultisnips",
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
      -- Remove tab binding
      opts.mapping["<Tab>"] = nil

      -- return the new table to be used
      return opts
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function() require("leap").add_default_mappings() end,
    event = "BufEnter",
  },
}

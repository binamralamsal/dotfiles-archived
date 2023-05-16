local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    cmd = "NvimTreeToggle",
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "aca/emmet-ls",
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  { "b0o/schemastore.nvim",     ft = { "json" } },

  {
    "github/copilot.vim",
    event = "BufEnter",
  },

  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    event = "BufEnter",
    opts = {
      -- configurations go here
    },
  },
  --
  -- {
  --   "RRethy/vim-illuminate",
  --   lazy = false,
  --   config = function()
  --     require "custom.configs.vim-illuminate"
  --   end,
  -- },

  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end,
  },

  -- {
  --   "folke/noice.nvim",
  --   -- lazy = false,
  --   config = function()
  --     require("noice").setup {
  --       lsp = {
  --         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --         override = {
  --           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --           ["vim.lsp.util.stylize_markdown"] = true,
  --           ["cmp.entry.get_documentation"] = true,
  --         },
  --         hover = {
  --           enabled = false,
  --         },
  --         signature = {
  --           enabled = false,
  --         },
  --       },
  --       -- you can enable a preset for easier configuration
  --       presets = {
  --         bottom_search = true,         -- use a classic bottom cmdline for search
  --         command_palette = true,       -- position the cmdline and popupmenu together
  --         long_message_to_split = true, -- long messages will be sent to a split
  --         inc_rename = false,           -- enables an input dialog for inc-rename.nvim
  --         lsp_doc_border = false,       -- add a border to hover docs and signature help
  --       },
  --     }
  --   end,
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   },
  -- },

  -- { "MunifTanjim/nui.nvim", lazy = false },
  --
  -- { "rcarriga/nvim-notify", lazy = false },

  {
    "windwp/nvim-ts-autotag",
    -- lazy = false,
    ft = { "html", "jsx", "tsx" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- {
  --   "yamatsum/nvim-cursorline",
  --   lazy = false,
  --   config = function()
  --     require("nvim-cursorline").setup {
  --       cursorline = {
  --         enable = true,
  --         timeout = 1000,
  --         number = false,
  --       },
  --       cursorword = {
  --         enable = true,
  --         min_length = 3,
  --         hl = { underline = true },
  --       },
  --     }
  --   end,
  -- },

  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end,
  },

  {
    "barrett-ruth/live-server.nvim",
    build = "npm i -g live-server",
    ft = "html",
    config = function()
      require("live-server").setup()
    end,
  },

  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },

  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup {
        api_key_cmd = "echo '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'",
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = { "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter", "LazyGitFilterCurrentFile" },
  },
}

return plugins

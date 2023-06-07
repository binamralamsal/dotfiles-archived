local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    { "b0o/schemastore.nvim",                   ft = { "json" } },
    {
      "tzachar/cmp-tabnine",
      build = "./install.sh",
      config = function()
        local tabnine = require("cmp_tabnine.config")
        tabnine:setup({}) -- put your options here
      end,
    },
    {
      "L3MON4D3/LuaSnip",
      dependencies = "rafamadriz/friendly-snippets",
      opts = { history = true, updateevents = "TextChanged,TextChangedI" },
      config = function(_, opts)
        require("luasnip").config.set_config(opts)

        -- vscode format
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }

        -- snipmate format
        require("luasnip.loaders.from_snipmate").load()
        require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

        -- lua format
        require("luasnip.loaders.from_lua").load()
        require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

        vim.api.nvim_create_autocmd("InsertLeave", {
          callback = function()
            if
                require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                and not require("luasnip").session.jump_active
            then
              require("luasnip").unlink_current()
            end
          end,
        })
      end,
    },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)   -- For `luasnip` users.
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(_, item)
          local icons = require("utils.icons").lspkind
          local icon = " " .. icons[item.kind] .. " "

          item.menu = "   (" .. item.kind .. ")"
          item.kind = icon
          return item
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert'
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),   -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      }),
      sources = cmp.config.sources({
        {
          name = "copilot",
          -- keyword_length = 0,
          max_item_count = 3,
          trigger_characters = {
            {
              ".",
              ":",
              "(",
              "'",
              '"',
              "[",
              ",",
              "#",
              "*",
              "@",
              "|",
              "=",
              "-",
              "{",
              "/",
              "\\",
              "+",
              "?",
              " ",
              -- "\t",
              -- "\n",
            },
          },
        },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },   -- For luasnip users.
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "cmp_tabnine" },
        { name = "treesitter" },
        { name = "tmux" },
      })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' },   -- You can specify the `cmp_git` source if you were installed it.
      }, {
        { name = 'buffer' },
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })
  end,
}

return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'moyiz/blink-emoji.nvim',
    'nvim-tree/nvim-web-devicons',
    'onsails/lspkind.nvim',
  },
  -- enabled = false,
  version = '1.*',
  opts = {
    cmdline = {
      keymap = {
        preset = 'inherit',
      },
      completion = {
        ghost_text = {
          enabled = true,
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = true,
          },
        },
        menu = {
          auto_show = true,
        },
      },
    },
    keymap = { preset = 'super-tab' },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
      documentation = {
        auto_show = true,
      },
      ghost_text = {
        enabled = true,
      },
      keyword = {
        range = 'full',
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        },
      },
      trigger = {
        show_on_backspace_in_keyword = true,
        show_on_insert = true,
      },
      menu = {
        border = 'rounded',
        draw = {
          columns = {
            { 'kind_icon', gap = 1 },
            { 'label',     'label_description', gap = 1 },
          },
          components = {
            kind_icon = {
              text = function(ctx)
                local lspkind = require("lspkind")

                -- default kind icon
                local icon = ctx.kind_icon

                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                else
                  icon = lspkind.symbolic(ctx.kind, {
                    mode = "symbol",
                  })
                end

                -- if LSP source, check for color derived from documentation
                if ctx.item.source_name == 'LSP' then
                  local color_item = require('nvim-highlight-colors').format(ctx.item.documentation, { kind = ctx.kind })
                  if color_item and color_item.abbr ~= '' then
                    icon = color_item.abbr
                  end
                end
                return icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                end

                -- if LSP source, check for color derived from documentation
                if ctx.item.source_name == 'LSP' then
                  local color_item = require('nvim-highlight-colors').format(ctx.item.documentation, { kind = ctx.kind })
                  if color_item and color_item.abbr_hl_group then
                    hl = color_item.abbr_hl_group
                  end
                end
                return hl
              end,
            },
          },
          treesitter = { 'lsp' },
        },
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'emoji' },
      providers = {
        emoji = {
          module = 'blink-emoji',
          name = 'Emoji',
          score_offset = 15,
        },
      },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },
  opts_extend = { 'sources.default' },
}

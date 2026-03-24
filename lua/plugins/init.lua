-- ~/.config/nvim/lua/plugins/init.lua
return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.mapping["<Tab>"] = nil
      opts.mapping["<S-Tab>"] = nil
      opts.mapping["<Down>"] = cmp.mapping.select_next_item()
      opts.mapping["<Up>"] = cmp.mapping.select_prev_item()
      return opts
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      document_color = {
        enabled = false,
        kind = "inline",
      },
      conceal = {
        enabled = false,
        symbol = "󱏿",
      },
    },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    config = function()
      require("nvim-highlight-colors").setup({
        render = "background",
        enable_tailwind = true,
        enable_named_colors = true,
        enable_var_usage = true,
      })
    end,
  },
  {
    "Pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require("auto-save").setup({ enabled = true, debounce_delay = 500 })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  { "jwalton512/vim-blade", ft = "blade" },
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' },
    config = true,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {}
  },
  { "rcarriga/nvim-notify", opts = { timeout = 300,background_colour = "#1e1e2e", } },
  { 'nvim-treesitter/nvim-treesitter', lazy = false, build = ':TSUpdate' },
  { "goolord/alpha-nvim", event = "VimEnter", config = function() require("configs.alpha-config") end },
  {
    'nvim-telescope/telescope.nvim', version = '*',
    opts={
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.75,
          },
          width = 0.90,
          height = 0.90,
        },
        sorting_strategy = "ascending",
        border = true,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
    },

    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },
  {
    'stevearc/overseer.nvim',
    cmd = { "OverseerRun", "OverseerToggle", "OverseerBuild", "OverseerInfo" },
    config = function()
      require("configs.overseer")
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local custom_codedark = require('lualine.themes.codedark')
      custom_codedark.normal.a.bg = '#569cd6'
      custom_codedark.normal.a.fg = '#ffffff'
      custom_codedark.normal.b.bg = '#2c2f33'
      custom_codedark.normal.c.bg = '#1e1e1e'
      custom_codedark.insert.a.bg = '#6a9955'
      custom_codedark.insert.a.fg = '#FFFFFF'
      custom_codedark.visual.a.bg = '#dcdcaa'
      custom_codedark.visual.a.fg = '#000000'
      custom_codedark.replace.a.bg = '#f44747'
      custom_codedark.replace.a.fg = '#ffffff'

      require("lualine").setup {
        options = {
          theme = custom_codedark,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
          refresh = {
            statusline = 100,
          },
          disabled_filetypes = {
            statusline = { 'alpha', 'dashboard' },
          },
        },
        sections = {
          lualine_a = {
            { 'mode', icon = '', separator = { left = '' }, right_padding = 2 },
          },
          lualine_b = {
            { 'branch', icon = '' },
            { 'diff', symbols = { added = ' ', modified = '柳 ', removed = ' ' } },
            { 'diagnostics', symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
          },
          lualine_c = {
            { 'filename', path = 1, symbols = { modified = ' ', readonly = ' ' } },
          },
          lualine_x = {
            {
              "overseer",
              label = '',
              symbols = {
                running = ' ',
                success = ' ',
                failed = ' ',
              },
            },
            { 'encoding', icon = '' },
            { 'fileformat', icon = '' },
            { 'filetype', icon = '' },
          },
          lualine_y = {
            { 'progress', icon = '' },
          },
          lualine_z = {
            { 'location', icon = '', separator = { right = '' } },
            {
              'datetime',
              style = '%H:%M',
              icon = '',
              separator = { right = '' },
              color = { fg = '#161617', bg = '#86e1fc', bold = true },
             },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = {
            {
              -- 'tabs'
              'buffers',
              mode = 2,
              max_length = vim.o.columns,
              tabs_color = {
                active = 'lualine_a_normal',
                inactive = 'lualine_c_normal',
              },
              symbols = {
                modified = '●',
              },
            }
          },
          lualine_z = {
            {
              'hostname',
              icon = '󰖟',
            }
          },
        },
        extensions = {
          'nvim-tree',
          'fugitive',
          'quickfix',
          'nvim-dap-ui',
        },
      }
      vim.api.nvim_create_autocmd('ModeChanged', {
        pattern = '*',
        callback = function()
          vim.cmd('redrawstatus')
        end,
      })
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      current_line_blame = true,
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {},
  },
  {
    'smoka7/hop.nvim',
    cmd={
      "HopWord"
    },
    version = "*",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "php",
          "phpdoc",
          "blade",
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "scss",
          "tailwindcss",
          "json",
          "yaml",
          "sql",
          "lua",
          "vim",
          "regex",
          "bash",
        })
      end
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
        highlight = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
      },
      whitespace = {
        highlight = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        injected_languages = false,
        highlight = "Function",
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "TelescopePrompt",
          "NvimTree",
          "Outline",
        },
      },
    },
    config = function(_, opts)
      vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#2a2b3c" })
      vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#2a2b3c" })
      vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = "#2a2b3c" })
      vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = "#2a2b3c" })
      vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = "#2a2b3c" })
      vim.api.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = "#2a2b3c" })
      require("ibl").setup(opts)
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#565f89", bold = true })
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require('neoscroll').setup({
        easing_function = "quadratic",
        pre_hide = { length = 10 },
      })
    end,
  },
  {
    "nmac427/guess-indent.nvim",
    event = "VeryLazy",
    config = function()
      require('guess-indent').setup({
        auto_cmd = true,
        override_editorconfig = false,
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require('Comment').setup({
        toggler = {
          line = "<leader>cc",
          block = "<leader>cb",
        },
        opleader = {
          line = "<leader>c",
          block = "<leader>b",
        },
      })
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        kitty = { enabled = false },
      },
    },
  },
  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable" },
    opts = {},
  },
  {
    "sphamba/smear-cursor.nvim",
    lazy = false,
    opts = {
      stiffness = 0.8,
      trailing_stiffness = 0.5,
      distance_stop_animating = 0.5,
      hide_target_hack = false,
      cursor_color = "#e0af68",
      normal_cursor_color = "#c0caf5",
      insert_cursor_color = "#7dcfff",
      visual_cursor_color = "#bb9af7",
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 300,
      icons = {
        mappings = false,
        keys = {
          Up = "▲ ",
          Down = "▼ ",
          Left = "◀ ",
          Right = "▶ ",
          C = "Ctrl ",
          M = "Alt ",
          D = "Cmd ",
          S = "Shift ",
          CR = "⏎ ",
          Esc = "⎋ ",
          ScrollWheelDown = "⇣ ",
          ScrollWheelUp = "⇡ ",
          NextScreen = "PageDown ",
          PreviousScreen = "PageUp ",
        },
      },
    },
  },
  {
    "anuvyklack/fold-preview.nvim",
    dependencies = "anuvyklack/keymap-amend.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    "declancm/cinnamon.nvim",
    event = "VeryLazy",
    opts = {
      keymaps = {
        basic = true,
        extra = true,
      },
    },
  },
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    keys = {
      { "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
      { "<leader>gc", "<cmd>Git commit<CR>", desc = "Git commit" },
      { "<leader>gp", "<cmd>Git push<CR>", desc = "Git push" },
      { "<leader>gl", "<cmd>Git pull<CR>", desc = "Git pull" },
      { "<leader>gd", "<cmd>Git diff<CR>", desc = "Git diff" },
      { "<leader>gb", "<cmd>Git branch<CR>", desc = "Git branch" },
    },
  },
  {
    "3rd/image.nvim",
    rocks = { hererocks = true },
    lazy = false,
    priority = 500,
    opts = {
      backend = "kitty",
      processor = "magick_cli",
      integrations = {
        markdown = { enabled = true },
        nvimtree = { enabled = true },
      },
    },
    config = function(_, opts)
      local lazy_rocks = vim.fn.stdpath("data") .. "/lazy-rocks/image.nvim"
      package.path = package.path .. ";" .. lazy_rocks .. "/share/lua/5.1/?.lua;" .. lazy_rocks .. "/share/lua/5.1/?/init.lua"
      package.cpath = package.cpath .. ";" .. lazy_rocks .. "/lib/lua/5.1/?.so"
      require("image").setup(opts)
      print("✓ image.nvim loaded with backend: " .. vim.inspect(require("image").backend_available))
    end,
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        shade_terminals = true,
        direction = 'float',
        float_opts = {
          border = 'rounded',
          winblend = 10,
        },
      })
    end
  },
  {
    "aikhe/wrapped.nvim",
    dependencies = { "nvzone/volt" },
    cmd = { "WrappedNvim" },
    opts = {},
  },
}

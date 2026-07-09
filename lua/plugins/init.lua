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
    opts = {
      lsp={
        signature={
          enabled=false
        }
      }
    }
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 1500,
      background_colour = "#1e1e2e",
    }
  },
  { 'nvim-treesitter/nvim-treesitter', lazy = false, build = ':TSUpdate' },
  { "goolord/alpha-nvim", event = "VimEnter", config = function() require("configs.alpha-config") end },
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
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    main = "nvim-silicon",
    opts = {
      font = "JetBrainsMono Nerd Font=14",
      theme = "Dracula",
      background = "#FFF",
      no_round_corner = false,
      no_window_controls = false,
      -- line_number = true,
      line_offset = function(args)
        return args.line1
      end,
      pad_horiz = 60,
      pad_vert = 40,
      shadow_blur_radius = 10,
      shadow_offset_x = 8,
      shadow_offset_y = 8,
      shadow_color = "#100808",
      to_clipboard = true,
      output = "~/Pictures/silicon/",
    },
  },
}

return{
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
}

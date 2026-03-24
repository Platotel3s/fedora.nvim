return{
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
}

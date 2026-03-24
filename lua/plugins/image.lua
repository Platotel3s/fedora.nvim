return{
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
}

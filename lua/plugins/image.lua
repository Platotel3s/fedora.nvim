-- ~/.config/nvim/lua/plugins/image.lua
return {
  {
    "3rd/image.nvim",
    build = true,
    lazy = false,
    priority = 500,
    rocks = { "magick" },
    opts = {
      backend = "kitty",
      processor = "magick_cli",
      integrations = {
        markdown = { enabled = true },
        nvimtree = { enabled = true },
      },
    },
    config = function(_, opts)
      require("image").setup(opts)
      
      vim.schedule(function()
        local is_available = require("image").backend_available
        print("✓ image.nvim loaded. Backend Kitty tersedia: " .. tostring(is_available))
      end)
    end,
  },
}


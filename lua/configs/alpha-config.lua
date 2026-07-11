local status_ok, alpha = pcall(require, "alpha")
if not status_ok then return end

vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#c678dd" })
vim.api.nvim_set_hl(0, "AlphaTagline", { fg = "#565f89", bold = false })
vim.api.nvim_set_hl(0, "AlphaTime",   { fg = "#e06c75" })
vim.api.nvim_set_hl(0, "AlphaDate",   { fg = "#98c379" })
vim.api.nvim_set_hl(0, "AlphaPlug",   { fg = "#61afef" })
vim.api.nvim_set_hl(0, "AlphaButton", { fg = "#abb2bf" })
vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#565f89", italic = true })

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "",
  " Syaiful Yudha Platoteles ",
}dashboard.section.header.opts.hl = "AlphaHeader"

local ok, lazy = pcall(require, "lazy")
local plug_count = ok and lazy.stats().count or 0

local tagline = {
  type = "text",
  val = "C O D E   .   B U G   .   F I X   ·   R E P E A T",
  opts = { position = "center", hl = "AlphaTagline" },
}

local infoblock = {
  type = "group",
  val = {
    {
      type = "text",
      val = string.format(
        "  %s        %s       󰏖 %d plugins",
        os.date("%H:%M"),
        os.date("%a, %d %b %Y"),
        plug_count
      ),
      opts = {
        position = "center",
        hl = {
          { "AlphaTime", 0,  7  },
          { "AlphaDate", 15, 32 },
          { "AlphaPlug", 39, 60 },
        },
      },
    },
  },
}

dashboard.section.buttons.val = {
  dashboard.button("F2", "  Toggle File Explorer ", "<cmd>NvimTreeToggle<CR>"),
  dashboard.button("F3", "  Find Files           ", "<cmd>Telescope find_files<CR>"),
  dashboard.button("F4", "󰱼  Search Text          ", "<cmd>Telescope live_grep<CR>"),
  dashboard.button("a",  "  New File             ", "<cmd>enew<CR>"),
  dashboard.button("d",  "  Delete Current File  ", "<cmd>!rm %<CR>"),
  dashboard.button("<leader>t", "  Change Theme    ", "<cmd>Telescope themes<CR>"),
  dashboard.button("w",  "󰛔  Open Wrapped Menu    ", "<cmd>WrappedNvim<CR>"),
  dashboard.button("q",  "  Quit Neovim          ", "<cmd>q<CR>"),
}
dashboard.section.buttons.opts.hl = "AlphaButton"

dashboard.section.footer.val = {
  "",
  "Sukses berawal dari mimpi, maka itu perbanyaklah tidur ...",
}
dashboard.section.footer.opts.hl = "AlphaFooter"

alpha.setup {
  layout = {
    { type = "padding", val = 4 },
    dashboard.section.header,
    { type = "padding", val = 1 },
    tagline,
    { type = "padding", val = 1 },
    infoblock,
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    { type = "padding", val = 1 },
    dashboard.section.footer,
  },
  opts = { noautocmd = true },
}

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
[[  ██████╗ ██████╗ ██████╗ ███████╗               ██████╗ ██╗   ██╗ ██████╗    ]],
[[ ██╔════╝██╔═══██╗██╔══██╗██╔════╝               ██╔══██╗██║   ██║██╔════╝    ]],
[[ ██║     ██║   ██║██║  ██║█████╗       █████╗    ██████╔╝██║   ██║██║  ███╗   ]],
[[ ██║     ██║   ██║██║  ██║██╔══╝       ╚════╝    ██╔══██╗██║   ██║██║   ██║   ]],
[[ ╚██████╗╚██████╔╝██████╔╝███████╗               ██████╔╝╚██████╔╝╚██████╔╝   ]],
[[  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝               ╚═════╝  ╚═════╝  ╚═════╝    ]],
[[                                                                              ]],
[[ ███████╗██╗ ██╗  ██╗               ██████╗ ███████╗██████╗ ███████╗ █████╗ ████████╗ ]],
[[ ██╔════╝██║ ╚██╗██╔╝               ██╔══██╗██╔════╝██╔══██╗██╔════╝██╔══██╗╚══██╔══╝ ]],
[[ █████╗  ██║  ╚███╔╝     █████╗     ██████╔╝█████╗  ██████╔╝█████╗  ███████║   ██║    ]],
[[ ██╔══╝  ██║  ██╔██╗     ╚════╝     ██╔══██╗██╔══╝  ██╔═══╝ ██╔══╝  ██╔══██║   ██║    ]],
[[ ██║     ██║ ██╔╝ ██╗               ██║  ██║███████╗██║     ███████╗██║  ██║   ██║    ]],
[[ ╚═╝     ╚═╝ ╚═╝  ╚═╝               ╚═╝  ╚═╝╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝    ]],
}

dashboard.section.buttons.val = {
  dashboard.button("F2", "  Toggle File Explorer", "<cmd>NvimTreeToggle<CR>"),
  dashboard.button("F3", "  Find Files", "<cmd>Telescope find_files<CR>"),
  dashboard.button("F4", "󰱼  Search Text", "<cmd>Telescope live_grep<CR>"),
  dashboard.button("a",  "  New File", "<cmd>enew<CR>"),
  dashboard.button("d",  "  Delete Current File", "<cmd>!rm %<CR>"),
  dashboard.button("<leader>t", "  Change Theme", "<cmd>Telescope themes<CR>"),
  dashboard.button("w", "󰛔  Open Wrapped Menu", "<cmd>WrappedNvim<CR>"),
  dashboard.button("q",  "  Quit Neovim", "<cmd>q<CR>"),
}

dashboard.section.footer.val = {
  "",
  "The way of obtaining something is more important than the thing itself ..."
}
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)

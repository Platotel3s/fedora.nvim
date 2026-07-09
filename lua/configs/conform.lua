-- ~/.config/nvim/lua/configs/conform.lua
local options = {
  formatters_by_ft = {
    lua={"stylua"},
    css={"prettier"},
    html={ "prettier" },
    javascript={"prettier"},
    typescript={"prettier"},
    python={"black"},
    blade={"blade-formatter"},
    php={"php-cs-fixer"},
    cmake = { "cmake_format" },
    c={"clang_format"},
    cpp={"clang_format"},
    h={"clang_format"}
  },
  linters_by_ft={
    cmake={"cmakelint"}
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options

-- ~/.config/nvim/lua/configs/lspconfig.lua

require("nvchad.configs.lspconfig").defaults()
local on_attach = function(client)
  if client.server_capabilities then
    client.server_capabilities.documentFormattingProvider = false
  end
end

vim.lsp.config.lua_ls = {
  on_attach = on_attach,
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
        },
        checkThirdParty = false,
      },
    },
  },
}
vim.lsp.enable("lua_ls")

vim.lsp.config.html = {
  on_attach = on_attach,
  filetypes = { "html","blade" },
}
vim.lsp.enable("html")

vim.lsp.config.cssls = {
  on_attach = on_attach,
  filetypes = { "css", "scss", "less" },
}
vim.lsp.enable("cssls")

vim.lsp.config.tailwindcss = {
  on_attach = function(client)
    on_attach(client)
    -- client.server_capabilities.colorProvider = false
  end,
  filetypes = {
    "html",
    "css",
    "scss",
    "javascriptreact",
    "typescriptreact",
    "blade",
  },
  init_options = {
    userLanguages = {
      ["blade"] = "html",
    },
  },
}
vim.lsp.enable("tailwindcss")

vim.lsp.config.intelephense = {
  on_attach = on_attach,
  filetypes = { "php" },
}
vim.lsp.enable("intelephense")

vim.lsp.config.laravel_ls = {
  on_attach = on_attach,
  filetypes = { "php" },
}
vim.lsp.enable("laravel_ls")

vim.lsp.config.ts_ls = {
  on_attach = on_attach,
  filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "js",
    "ts",
    "jsx",
    "tsx"
  },
}
vim.lsp.enable("ts_ls")

vim.lsp.config.pyright = {
  on_attach = on_attach,
}
vim.lsp.enable("pyright")

vim.lsp.config.clangd = {
  on_attach = on_attach,
  filetypes = { "c", "cpp" },
}
vim.lsp.enable("clangd")

vim.lsp.config.rust_analyzer = {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = vim.fs.root(0, { ".git", "Cargo.toml" }),
  on_attach = on_attach,
}
vim.lsp.enable("rust_analyzer")

vim.lsp.config.dartls = {
  on_attach = on_attach,
  filetypes = { "dart" },
}
vim.lsp.enable("dartls")


vim.lsp.config.lemminx={
  on_attach=on_attach,
  filetypes={"xml"},
}
vim.lsp.enable("lemminx")

vim.lsp.config.jdtls = {
  on_attach = on_attach,
  filetypes = { "java" },
  root_dir = vim.fs.root(0, {
    "pom.xml",
    "build.gradle",
    "settings.gradle",
    ".git",
  }),
}
vim.lsp.enable("jdtls")

vim.lsp.config.qmlls={
  on_attach=on_attach,
  filetypes={"qml"},
}
vim.lsp.enable("qmlls")

vim.lsp.config.taplo={
  on_attach=on_attach,
  filetypes={"toml"}
}
vim.lsp.enable("taplo")

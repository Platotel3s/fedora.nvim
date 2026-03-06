require "nvchad.autocmds"
vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade.php",
  },
})

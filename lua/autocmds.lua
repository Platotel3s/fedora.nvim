require "nvchad.autocmds"
vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade.php",
  },
})
vim.filetype.add({
  extension = {
    ino = "arduino",
  },
})

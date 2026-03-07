local overseer = require("overseer")

overseer.setup({
  templates = { "builtin" },
})

overseer.register_template({
  name = "Laravel Dev",
  builder = function()
    return {
      cmd = { "composer" },
      args = { "run", "dev" },
      name = "Composer Dev",
      components = { "default" },
    }
  end,
  condition = {
    callback = function() return vim.fn.filereadable("composer.json") == 1 end,
  },
})
vim.api.nvim_create_user_command("LaravelRun", function()
  overseer.run_task({ name = "Laravel Dev" })
end, {})

vim.api.nvim_create_user_command("Artisan", function(opts)
  local args = vim.split(opts.args, " ")
  local task = overseer.new_task({
    cmd = { "php", "artisan" },
    args = args,
    name = "php artisan " .. table.concat(args, " "),
    components = { "default" },
  })
  task:start()
end, { nargs = "*" })

vim.api.nvim_create_user_command("Npm", function(opts)
  local args = vim.split(opts.args, " ")
  local task = overseer.new_task({
    cmd = { "npm" },
    args = args,
    name = "npm " .. table.concat(args, " "),
    components = { "default" },
  })
  task:start()
end, { nargs = "*" })

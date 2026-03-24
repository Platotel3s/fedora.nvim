return{
  {
    'stevearc/overseer.nvim',
    cmd = { "OverseerRun", "OverseerToggle", "OverseerBuild", "OverseerInfo" },
    config = function()
      require("configs.overseer")
    end,
  },
}

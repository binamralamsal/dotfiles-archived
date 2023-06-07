return {
  "barrett-ruth/live-server.nvim",
  build = "npm i -g live-server",
  ft = "html",
  config = function()
    require("live-server").setup()
  end,
}

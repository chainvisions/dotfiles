return {
  "stevearc/oil.nvim",
  ---@module oil
  ---@type oil.SetupOpts
  opts = {},
  config = function()
    require("oil").setup({
      default_file_explorer = true,
    })
  end,
  dependencies = {
    {
      "echasnovski/mini.icons",
      opts = {},
    },
  },
}

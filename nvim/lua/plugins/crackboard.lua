return {
  {
    "boganworld/crackboard.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crackboard").setup({
        session_key = "4a193487a2936cbd2d7fc25ede19d0bedf6b0006467c42dbc104b925f7a51530",
      })
    end,
  },
}

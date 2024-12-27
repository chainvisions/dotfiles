return {
  {
    "Equilibris/nx.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      nx_cmd_root = "nx",
    },
    keys = {
      { "<leader>nx", "<cmd>Telescope nx actions<CR>", desc = "nx actions" },
    },
  },
}

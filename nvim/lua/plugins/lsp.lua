return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim", cmd = "Mason", build = ":MasonUpdate" },
      { "williamboman/mason-lspconfig.nvim", config = function(_, opts) end },
    },
    opts = {},
    config = function(_, opts)
      require("mason").setup()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      local lsp_capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require("blink.cmp").get_lsp_capabilities()
      )

      mason_lspconfig.setup({
        ensure_installed = {
          "rust_analyzer",
          "svelte",
          "tailwindcss",
          "marksman",
          "solidity_ls_nomicfoundation",
        },
      })
      mason_lspconfig.setup_handlers({
        function(server_name)
          if server_name == "rust_analyzer" then
            return
          end
          lspconfig[server_name].setup({
            capabilities = lsp_capabilities,
            settings = opts.servers[server_name] and opts.servers[server_name].settings or {},
          })
        end,
      })
    end,
  },
}

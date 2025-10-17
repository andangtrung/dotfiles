return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls" },
      automatic_installation = true,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Configure LSP servers using vim.lsp.config
    local servers = {
      lua_ls = {},
    }

    for server, config in pairs(servers) do
      vim.lsp.config[server] = vim.tbl_deep_extend("force", {
        capabilities = capabilities,
      }, config)
      vim.lsp.enable(server)
    end

    -- LSP keybindings
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end,
    })
  end,
}

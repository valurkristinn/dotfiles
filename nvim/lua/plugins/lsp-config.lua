return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "bashls", "eslint", "jdtls", "pyright", "ts_ls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })
            vim.lsp.config("clangd", {
                capabilities = capabilities,
            })
            vim.lsp.config("jdtls", {
                capabilities = capabilities,
            })
            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })
            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
            })
            vim.lsp.config("bashls", {
                capabilities = capabilities,
            })
            vim.lsp.config("eslint", {
                capabilities = capabilities,
            })

            vim.keymap.set("n", "grd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})

            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
            vim.keymap.set("n", "<space>de", vim.diagnostic.open_float, {})
            vim.keymap.set("n", "<space>dq", vim.diagnostic.setloclist, {})

            vim.opt.signcolumn = "yes"
        end,
    },
}

local langs = {
  "lua_ls",
  "clangd",
  "bashls",
  "oxlint",
  "pyright",
  "vtsls",
  "cssls",
  "astro",
  "tinymist",
}
return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = langs,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for _, l in ipairs(langs) do
        vim.lsp.config(l, { capabilities = capabilities })
        vim.lsp.enable(l)
      end

      vim.keymap.set("n", "grd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
      vim.keymap.set("n", "<space>de", vim.diagnostic.open_float, {})
      vim.keymap.set("n", "<space>dq", vim.diagnostic.setloclist, {})

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          local jdtls_install = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
          local workspace_dir = vim.fn.stdpath("cache")
              .. "/jdtls/"
              .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

          vim.lsp.start({
            name = "jdtls-manual",
            cmd = {
              "java",
              "-Declipse.application=org.eclipse.jdt.ls.core.id1",
              "-Dosgi.bundles.defaultStartLevel=4",
              "-Declipse.product=org.eclipse.jdt.ls.core.product",
              "-Dlog.protocol=true",
              "-Dlog.level=ALL",
              "-Xmx1g",
              "--add-modules=ALL-SYSTEM",
              "--add-opens",
              "java.base/java.util=ALL-UNNAMED",
              "--add-opens",
              "java.base/java.lang=ALL-UNNAMED",
              "-jar",
              vim.fn.glob(jdtls_install .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
              "-configuration",
              jdtls_install .. "/config_mac",
              "-data",
              workspace_dir,
            },
            root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
            capabilities = capabilities,
            init_options = {
              bundles = {},
            },
          })
        end,
      })
    end,
  },
}

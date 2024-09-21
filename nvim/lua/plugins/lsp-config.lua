return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = { auto_install = true },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- "asm-lsp",
          "clangd",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })

      lspconfig.ocamllsp.setup({
        capabilities = capabilities,
      })

      lspconfig.clangd.setup({
        capabilities = capabilities,
      })

      vim.g.asmsyntax = 'asm68k'
      lspconfig.m68k.setup {
        capabilities = capabilities,
        cmd = { "m68k-lsp-server", "--stdio" },
        filetype = { "asm68k", "asm" },
      }

      -- lspconfig.omnisharp.setup({
      --   cmd = {
      --     "mono",
      --     "--assembly-loader=strict",
      --     "/home/lepotototor/.config/nvim/omnisharp/" .. "/omnisharp/OmniSharp.exe",
      --   },
      --   use_mono = true,
      -- })
    end,
  },
}

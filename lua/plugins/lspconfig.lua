return {
  "neovim/nvim-lspconfig",

  opts = {
    servers = {
      denols = {
        root_dir = require("lspconfig.util").root_pattern(
          "deno.json",
          "deno.jsonc"
        ),
      },
      tsserver = {
        root_dir = require("lspconfig.util").root_pattern("package.json"),
      },
      eslint = {},
      emmet_language_server = {},
    },

    setup = {
      clangd = function(_, opts)
        -- Fix clangd offset encoding
        opts.capabilities.offsetEncoding = { "utf-16" }
      end,

      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}

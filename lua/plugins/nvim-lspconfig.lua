return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",

    { "j-hui/fidget.nvim",       opts = {} },

    "folke/neodev.nvim",

    "mfussenegger/nvim-jdtls",
  },
  config = function()
    local on_attach = function(_, bufnr)
      local _augroups = {}
      local get_augroup = function(client)
        if not _augroups[client.id] then
          local group_name = "kickstart-lsp-format-" .. client.name
          local id = vim.api.nvim_create_augroup(group_name, { clear = true })
          _augroups[client.id] = id
        end

        return _augroups[client.id]
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach-format", { clear = true }),
        callback = function(args)
          local client_id = args.data.client_id
          local client = vim.lsp.get_client_by_id(client_id)
          local bufnr = args.buf

          if not client.server_capabilities.documentFormattingProvider then
            return
          end

          if client.name == "tsserver" then
            return
          end

          vim.api.nvim_create_autocmd("BufWritePre", {
            group = get_augroup(client),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format {
                async = false,
                filter = function(c)
                  return c.id == client.id
                end,
              }
            end,
          })
        end,
      })

      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

      nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
      nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
      nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
      nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
      nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
      nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

      nmap("K", vim.lsp.buf.hover, "Hover Documentation")
      nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

      nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
      nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
      nmap("<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, "[W]orkspace [L]ist Folders")

      vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
      end, { desc = "Format current buffer with LSP" })
    end

    require("which-key").register {
      ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
      ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
      ["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
      ["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
      ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
      ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
      ["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
      ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
    }
    require("which-key").register({
      ["<leader>"] = { name = "VISUAL <leader>" },
      ["<leader>h"] = { "Git [H]unk" },
    }, { mode = "v" })

    require("mason").setup()
    require("mason-lspconfig").setup()

    local servers = {
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = { disable = { "missing-fields" } },
        },
      },

      angularls = {},
      bashls = {},
      clangd = {},
      cmake = {},
      cssls = {},
      denols = {},
      docker_compose_language_service = {},
      dockerls = {},
      golangci_lint_ls = {},
      gradle_ls = {},
      hls = {},
      html = {},
      hydra_lsp = {},
      jdtls = {},
      jedi_language_server = {},
      jsonls = {},
      marksman = {},
      ocamllsp = {},
      omnisharp = {},
      rust_analyzer = {},
      sqlls = {},
      svelte = {},
      taplo = {},
      texlab = {},
      -- tsserver = {},
      volar = {},
      zls = {},
    }

    require("neodev").setup()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    local mason_lspconfig = require "mason-lspconfig"

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require("lspconfig")[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }
  end,
}

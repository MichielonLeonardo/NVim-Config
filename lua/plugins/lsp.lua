-- ~/.config/nvim/lua/plugins/lsp.lua
-- Stile ThePrimeagen, adattato: UltiSnips al posto di LuaSnip,
-- namespace <leader>v* per l'LSP, Tab intoccato.
-- Richiede Neovim >= 0.11

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "quangnguyen30192/cmp-nvim-ultisnips", -- il ponte cmp <-> UltiSnips
    "j-hui/fidget.nvim",                   -- indicatore "il server sta pensando"
  },
  config = function()
    local cmp = require("cmp")

    require("fidget").setup({})
    require("mason").setup({ ui = { border = "rounded" } })

    -- ========================================================================
    -- 1. CAPABILITIES: diciamo ai server che abbiamo cmp installato
    --    Va fatto PRIMA di abilitare i server.
    -- ========================================================================
    vim.lsp.config("*", {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    -- ========================================================================
    -- 2. IMPOSTAZIONI PER SERVER SPECIFICI
    -- ========================================================================
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim", "latex", "manim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })

    vim.lsp.config("texlab", {
      settings = {
        texlab = {
          build = { onSave = false }, -- compila Vimtex, non lui
          forwardSearch = { executable = "zathura" },
          chktex = { onOpenAndSave = true },
        },
      },
    })

    -- ========================================================================
    -- 3. MASON-LSPCONFIG: installa i binari e abilita i server
    -- ========================================================================
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "pyright", "bashls", "texlab" },
      automatic_enable = true,
    })

    -- ========================================================================
    -- 4. KEYMAPS: solo nei buffer dove un server si e' agganciato
    -- ========================================================================
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
      callback = function(e)
        local opts = { buffer = e.buf, silent = true }

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)

        -- Prime usa <C-h> per la signature help, ma tu ce l'hai su <C-w>.
        vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)

        -- Prime ha [d e ]d invertiti rispetto alla convenzione. Qui sono giusti.
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)

        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
      end,
    })

    -- ========================================================================
    -- 5. NVIM-CMP: le mappature firmate Primeagen
    -- ========================================================================
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        -- Nessun <Tab>: appartiene a UltiSnips.
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "ultisnips" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })

    -- ========================================================================
    -- 6. DIAGNOSTICA
    -- ========================================================================
    vim.diagnostic.config({
      virtual_text = { prefix = "●" },
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
    })
  end,
}

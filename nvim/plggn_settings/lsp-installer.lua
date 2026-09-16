local lsp_installer = require("nvim-lsp-installer")

-- nvim-cmp capabilities (shared by all servers)
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  -- default_capabilities is the modern API; fallback for older cmp_nvim_lsp
  if cmp_nvim_lsp.default_capabilities then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  elseif cmp_nvim_lsp.update_capabilities then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  end
end

-- Standard LSP keymaps (buffer-local when a server attaches)
local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local map = vim.keymap.set

  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  map("n", "<leader>rn", vim.lsp.buf.rename, opts)
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  map("n", "gr", vim.lsp.buf.references, opts)
  map("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
  map("n", "[d", vim.diagnostic.goto_prev, opts)
  map("n", "]d", vim.diagnostic.goto_next, opts)
  map("n", "<leader>e", vim.diagnostic.open_float, opts)
  map("n", "<leader>q", vim.diagnostic.setloclist, opts)
end

-- Per-server settings
local server_opts = {
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
        gofumpt = true,
        usePlaceholders = true,
        completeUnimported = true,
      },
    },
  },
}

-- Ensure gopls (and any other listed servers) are installed
local ensure_installed = { "gopls" }
for _, name in ipairs(ensure_installed) do
  local ok, server = lsp_installer.get_server(name)
  if ok and not server:is_installed() then
    server:install()
  end
end

-- Register a handler that will be called for each installed server when it's ready
-- (i.e. when installation is finished or if the server is already installed).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if server_opts[server.name] then
    for k, v in pairs(server_opts[server.name]) do
      opts[k] = v
    end
  end

  -- This setup() function will take the provided server configuration and decorate
  -- it with the necessary properties before passing it onwards to lspconfig.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)

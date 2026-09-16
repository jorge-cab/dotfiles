local lsp_installer = require("nvim-lsp-installer")

-- Ensure gopls (and any other desired servers) are installed
local servers = { "gopls" }
for _, name in pairs(servers) do
  local ok, server = require("nvim-lsp-installer.servers").get_server(name)
  if ok and not server:is_installed() then
    server:install()
  end
end

-- nvim-cmp capabilities so LSP completion works with the existing cmp setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  -- Support both older update_capabilities and newer default_capabilities APIs
  if cmp_nvim_lsp.default_capabilities then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  elseif cmp_nvim_lsp.update_capabilities then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  end
end

local function on_attach(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
end

-- Per-server option overrides (keep in the same style as the stock comment example)
local enhance_server_opts = {
  ["gopls"] = function(opts)
    opts.settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
        gofumpt = true,
      },
    }
  end,
}

-- Register a handler that will be called for each installed server when it's ready
-- (i.e. when installation is finished or if the server is already installed).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if enhance_server_opts[server.name] then
    enhance_server_opts[server.name](opts)
  end

  -- This setup() function will take the provided server configuration and decorate
  -- it with the necessary properties before passing it onwards to lspconfig.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)

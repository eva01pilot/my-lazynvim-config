-- If you are using mason.nvim, you can get the ts_plugin_path like this
local mason_registry = require("mason-registry")
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
  .. "/node_modules/@vue/language-server"

local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
})

-- No need to set `hybridMode` to `true` as it's the default value
lspconfig.volar.setup({
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
  on_attach = function()
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
  end,
})

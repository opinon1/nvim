-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" , "tsserver"}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.jdtls.setup {
  on_attach = function()
    local bemol_dir = vim.fs.find({ ".bemol" }, { upward = true, type = "directory" })[1]
    local ws_folders_lsp = {}
    if bemol_dir then
      local file = io.open(bemol_dir .. "/ws_root_folders", "r")
      if file then
        for line in file:lines() do
          table.insert(ws_folders_lsp, line)
        end
        file:close()
      end
    end
    for _, line in ipairs(ws_folders_lsp) do
      vim.lsp.buf.add_workspace_folder(line)
    end
  end,
  cmd = {
    "jdtls",
    "--jvm-arg=-javaagent:" .. require("mason-registry").get_package("jdtls"):get_install_path() .. "/lombok.jar",
  },
}

lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

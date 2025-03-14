require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local function opts(desc)
  return { desc = "LSP " .. desc }
end
-- LSP keybindings
map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

map("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts "List workspace folders")

map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")

map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
map("n", "gr", vim.lsp.buf.references, opts "Show references")

map("i", "<C-Space>", require("cmp").mapping.confirm, opts "Complete")

map("n", "ff", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "Confomr format file" })

-- Other custom mappings
map("n", ";", ":", { desc = "Enter command mode" })
map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

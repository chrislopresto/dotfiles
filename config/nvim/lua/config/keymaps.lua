-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open current file in VS Code
vim.api.nvim_create_user_command("OpenInCode", function()
  local file = vim.fn.expand("%:p")
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  vim.fn.system({ "code", "--goto", file .. ":" .. line .. ":" .. col })
end, { desc = "Open current file in VS Code" })

vim.keymap.set("n", "<leader>oic", "<cmd>OpenInCode<cr>", { desc = "Open in Code" })

-- Open current file in Sublime Text
vim.api.nvim_create_user_command("OpenInSublime", function()
  local file = vim.fn.expand("%:p")
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  vim.fn.system({ "subl", file .. ":" .. line .. ":" .. col })
end, { desc = "Open current file in Sublime Text" })

vim.keymap.set("n", "<leader>ois", "<cmd>OpenInSublime<cr>", { desc = "Open in Sublime" })

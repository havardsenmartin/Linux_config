-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Open man page for selection
vim.keymap.set("v", "<leader>m", function()
  -- Save current register
  local save_reg = vim.fn.getreg('"')

  -- Yank visual selection
  vim.cmd("normal! y")
  local text = vim.fn.getreg('"')

  -- Restore register
  vim.fn.setreg('"', save_reg)

  -- Trim whitespace/newlines
  text = text:gsub("%s+", "")

  -- Open man page
  vim.cmd("Man " .. text)
end, { desc = "Man page for selection" })

vim.keymap.set("n", "<leader>cd", function()
  vim.cmd("cd %:p:h")
end, { desc = "CD to current file directory" })

-- Make ¤ behave like $
vim.keymap.set({ "n", "v", "x" }, "¤", "$")

-- jk bind ;-; we rly doin dis
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

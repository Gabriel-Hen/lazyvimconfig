-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local dap_ok, dap = pcall(require, "dap")
if dap_ok then
  map("n", "<F5>", function() dap.continue() end, { desc = "DAP Continue" })
  map("n", "<F10>", function() dap.step_over() end, { desc = "DAP Step Over" })
  map("n", "<F11>", function() dap.step_into() end, { desc = "DAP Step Into" })
  map("n", "<F12>", function() dap.step_out() end, { desc = "DAP Step Out" })
  map("n", "<leader>b", function() dap.toggle_breakpoint() end, { desc = "DAP Toggle Breakpoint" })
  map("n", "<leader>B", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
  end, { desc = "DAP Set Conditional Breakpoint" })
end


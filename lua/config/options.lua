-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Transparência para o fundo
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4 -- Define o tamanho visual do tab como 4 espaços
vim.opt.softtabstop = 4 -- Define o tamanho do tab ao editar (pressionar Tab)
vim.opt.shiftwidth = 4 -- Define o tamanho da indentação (usado por >>, <<, etc.)
vim.opt.expandtab = true -- Converte tabs em espaços
vim.opt.colorcolumn = "120"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- mostra somente erros no inline do phpactor
vim.diagnostic.config({
    virtual_text = {
        severity = { min = vim.diagnostic.severity.ERROR }, -- Mostra apenas erros
    },
    signs = {
        severity = { min = vim.diagnostic.severity.ERROR }, -- Mostra apenas erros nos sinais
    },
    underline = {
        severity = { min = vim.diagnostic.severity.ERROR }, -- Sublinha apenas erros
    },
})

vim.g.autoformat = true

-- vim.g.clipboard = {
--     name = "win32yank",
--     copy = {
--         ["+"] = "win32yank.exe -i",
--         ["*"] = "win32yank.exe -i",
--     },
--     paste = {
--         ["+"] = "win32yank.exe -o",
--         ["*"] = "win32yank.exe -o",
--     },
--     cache_enabled = false,
-- }

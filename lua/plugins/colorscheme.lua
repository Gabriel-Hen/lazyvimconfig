--[[return {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { 
        style = "storm",
        transparent = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
    },
}
]]

return {
    -- {
    --     "arcticicestudio/nord-vim",
    --     lazy = true,
    --     config = function()
    --         vim.g.nord_borders = true -- Habilita bordas, se desejar
    --         vim.g.nord_contrast = true -- Aumenta o contraste, se desejar
    --         vim.g.nord_disable_background = true
    --     end,
    -- },
    {
        "gbprod/nord.nvim",
        -- ou "shaunsingh/nord.nvim" (muito similar)
        lazy = false, -- carrega imediatamente
        priority = 1000, -- carrega antes de tudo
        opts = {
            -- aqui você pode customizar se quiser
            transparent = false, -- ou true se quiser fundo transparente
            errors = { mode = "none" }, -- ou "background" / "undercurl"
        },
        config = function(_, opts)
            require("nord").setup(opts)
            -- não precisa chamar vim.cmd.colorscheme aqui
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "nord",
        },
    },
}

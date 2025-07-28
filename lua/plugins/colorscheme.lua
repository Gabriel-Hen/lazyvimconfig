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
    {
        "arcticicestudio/nord-vim",
        lazy = true,
        config = function()
            vim.g.nord_borders = true -- Habilita bordas, se desejar
            vim.g.nord_contrast = true -- Aumenta o contraste, se desejar
            vim.g.nord_disable_background = true
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "nord",
        },
    },
}

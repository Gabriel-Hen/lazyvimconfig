return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "nvim-telescope/telescope-live-grep-args.nvim" },
        },
        opts = function(_, opts)
            -- Suas configs atuais (mantidas intactas)
            opts.defaults = opts.defaults or {}
            opts.defaults.file_ignore_patterns = opts.defaults.file_ignore_patterns or {}

            opts.pickers = opts.pickers or {}
            opts.pickers.find_files = vim.tbl_extend("force", opts.pickers.find_files or {}, {
                hidden = true,
                no_ignore = true,
            })

            opts.pickers.live_grep = vim.tbl_extend("force", opts.pickers.live_grep or {}, {
                additional_args = { "--hidden", "--no-ignore" },
            })

            -- Configuração da extensão live_grep_args (adicione aqui dentro do opts)
            opts.extensions = opts.extensions or {}
            opts.extensions.live_grep_args = {
                auto_quoting = true, -- coloca aspas automáticas ao usar <C-k>
                mappings = { -- atalhos dentro do prompt (modo insert)
                    i = {
                        ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
                        -- Exemplos extras que você pode usar ou remover:
                        -- ["<C-f>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " -t cs -t cshtml" }),
                        -- ["<C-g>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " -g \"*.cs\" -g \"*.cshtml\"" }),
                    },
                },
                -- Outras opções úteis (opcional):
                -- theme = "dropdown",
                -- layout_config = { mirror = true },
            }

            return opts
        end,
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)
            -- Carrega a extensão (obrigatório!)
            telescope.load_extension("live_grep_args")
        end,
    },

    -- Adiciona os keymaps customizados (pode ficar aqui ou em lua/config/keymaps.lua)
    {
        "folke/which-key.nvim",
        optional = true,
        opts = function(_, opts)
            opts.spec = opts.spec or {}
            vim.list_extend(opts.spec, {
                { "<leader>s", group = "search" },
                {
                    "<leader>sf",
                    function()
                        require("telescope").extensions.live_grep_args.live_grep_args()
                    end,
                    desc = "Grep (root dir) com args/flags",
                },
                -- Opcional: atalho dedicado para C# / Razor
                {
                    "<leader>sc",
                    function()
                        require("telescope").extensions.live_grep_args.live_grep_args({
                            default_args = { "--hidden", "--no-ignore", "-t", "cs", "-t", "cshtml" },
                        })
                    end,
                    desc = "Grep só .cs + .cshtml (com args)",
                },
            })
        end,
    },
}

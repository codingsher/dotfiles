function ColorMyPencils(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        opts = {},
        config = function()
            ColorMyPencils()
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })

            ColorMyPencils();
        end
    },
    {
        "marko-cerovac/material.nvim",
        name = "material",
        config = function()
            require('material').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })

            ColorMyPencils();
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require('catppuccin').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })

            ColorMyPencils();
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require('gruvbox').setup({
                disaabled_background = true,
                styles = {
                    ilatic = false,
                }
            })

            ColorMyPencils()
        end
    }
}

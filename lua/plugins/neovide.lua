return {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
        options = {
            opt = { -- configure vim.opt options
                -- configure font
                guifont = "Source Code Pro:h12:#e-subpixelantialias",
                -- line spacing
                linespace = 3,
            },
            g = { -- configure vim.g variables
                -- configure scaling
                neovide_scale_factor = 1.0,
                -- configure padding
                neovide_padding_top = 0,
                neovide_padding_bottom = 0,
                neovide_padding_right = 0,
                neovide_padding_left = 0,
                neovide_cursor_animation_length = 0.05,
            },
        },
    },
}

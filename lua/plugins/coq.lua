return {
    "AstroNvim/astrocore",
    opts = {
        options = {
            g = {
                coq_settings = {
                    auto_start = "shut-up",
                    keymap = {
                        jump_to_mark = "<c-h>"
                    },
                },
                clients = {
                    tmux = { enabled = false },
                    buffers = {
                        enabled = false,
                    },
                    treesitter = {
                        enabled = false,
                    }
                },
            },
        },
    }
}

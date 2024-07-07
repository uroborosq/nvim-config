return {
    {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
            mappings = {
                -- first key is the mode
                n = {
                    ["<Leader>lu"] = { ":LspRestart<CR>", desc = "Restart LSP" },
                },
            },
        },
    },
}

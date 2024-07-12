return {
    {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
            mappings = {
                n = {
                    ["<Leader>lu"] = { ":LspRestart<CR>", desc = "Restart LSP" },
                },
            },
        },
    },
}

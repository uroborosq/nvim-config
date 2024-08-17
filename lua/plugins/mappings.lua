return {
    {
        "AstroNvim/astrocore",
        ---@type AstroCoreOpts
        opts = {
            mappings = {
                n = {
                    ["<Leader>lu"] = { ":LspRestart<CR>", desc = "Restart LSP" },
                    ["gb"] = {
                        function() require("dropbar.api").pick() end,
                        desc = "Go to dropbar",
                    },
                },
            },
        },
    },
}

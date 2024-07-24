return {
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                go = { "golangcilint" },
            },
            linters = {
                golangcilint = {
                    args = { "--disable", "typecheck", "--config", ".golangci.yaml" },
                },
            },
        },
    },
}

return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                go = { "gofumpt", "goimports-reviser", stop_after_first = false },
                sql = { "sleek" },
            },
            formatters = {
                ["goimports-reviser"] = {
                    prepend_args = { "-rm-unused" },
                },
            },
        },
    },
}

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "gofmt", "goimports-reviser", stop_after_first = false },
        sql = { "sleek" },
      },
    },
  },
}

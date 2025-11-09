return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports-reviser", stop_after_first = false },
        sql = { "sleek" },
      },
    },
  },
}

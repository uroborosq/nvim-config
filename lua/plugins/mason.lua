return {
    {
        "nvim-treesitter/nvim-treesitter",
        optional = true,
        opts = function(_, opts)
            if opts.ensure_installed ~= "all" then
                opts.ensure_installed = require("astrocore").list_insert_unique(
                    opts.ensure_installed,
                    { "go", "gomod", "gosum", "gowork", "asm" }
                )
            end
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        optional = true,
        opts = function(_, opts)
            opts.ensure_installed = require("astrocore").list_insert_unique(
                opts.ensure_installed,
                { "gomodifytags", "gofumpt", "iferr", "impl", "goimports", "golangci-lint", "goimports-reviser" }
            )
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        optional = true,
        opts = function(_, opts)
            opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
                "gopls",
                "delve",
                "gopls",
                "gomodifytags",
                "gofumpt",
                "iferr",
                "impl",
                "goimports",
                "stylua",
                { "golangci-lint", version = "v1.64.8" },
                "goimports-reviser",
                "buf",
            })
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        optional = true,
        opts = function(_, opts)
            opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "delve" })
        end,
    },
}

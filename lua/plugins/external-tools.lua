return {
    {
        "nvim-treesitter/nvim-treesitter",
        optional = true,
        opts = function(_, opts)
            if opts.ensure_installed ~= "all" then
                opts.ensure_installed =
                    require("astrocore").list_insert_unique(opts.ensure_installed, { "go", "gomod", "gosum", "gowork" })
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
        "williamboman/mason-lspconfig.nvim",
        optional = true,
        opts = function(_, opts)
            opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "gopls" })
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        optional = true,
        opts = function(_, opts)
            opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
                "delve",
                "gopls",
                "gomodifytags",
                "gofumpt",
                "iferr",
                "impl",
                "goimports",
                "stylua",
                "golangci-lint",
                "goimports-reviser",
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

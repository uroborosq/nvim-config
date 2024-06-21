return {
    {
        "leoluz/nvim-dap-go",
        ft = "go",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("dap-go").setup {
                dap_configurations = {
                    {
                        type = "go",
                        name = "Attach remote",
                        mode = "remote",
                        request = "attach",
                        connect = {
                            host = "localhost",
                            port = "2345",
                        },
                        substitutePath = {
                            { to = "/tmp/control_path", from = "${workspaceFolder}" },
                        },
                    },
                },
                delve = {
                    port = "2345",
                },
            }
        end,
    },
}

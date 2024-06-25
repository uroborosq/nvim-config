return {
    {
        "https://git.sr.ht/~reggie/licenses.nvim",
        config = function()
            require("licenses").setup {
                license = "LICENSE",
                copyright_holder = "kek",
                use_license_header = true,
                -- fallback_to_full_text = function(id) return id == "LICENSE" end,
            }
        end,
    },
}

return {
    "mg979/vim-visual-multi",
    event = { "User AstroFile", "InsertEnter" },
    dependencies = {
        "AstroNvim/astrocore",
        ---@param opts astrocoreopts
        opts = function(_, opts)
            if not opts.options then opts.options = {} end
            if not opts.options.g then opts.options.g = {} end
            opts.options.g.VM_silent_exit = 1
            opts.options.g.VM_show_warnings = 0
            opts.options.g.VM_mouse_mappings = 1
            opts.options.g.VM_maps = require("astrocore").empty_map_table()
            opts.options.g.VM_maps["Add Cursor Down"] = "<C-S-J>"
            opts.options.g.VM_maps["Add Curson Up"] = "<C-S-K>"
            if not opts.autocmds then opts.autocmds = {} end
            opts.autocmds.visual_multi_exit = {
                {
                    event = "User",
                    pattern = "visual_multi_exit",
                    desc = "Avoid spurious 'hit-enter-prompt' when exiting vim-visual-multi",
                    callback = function()
                        vim.o.cmdheight = 1
                        vim.schedule(function() vim.o.cmdheight = opts.options.opt.cmdheight end)
                    end,
                },
            }

            if not opts.mappings then opts.mappings = require("astrocore").empty_map_table() end
            local maps = assert(opts.mappings)
            maps.n["<C-S-K>"] = { "<C-u>call vm#commands#add_cursor_up(0, v:count1)<cr>", desc = "Add cursor above" }
            maps.n["<C-S-J>"] = { "<C-u>call vm#commands#add_cursor_down(0, v:count1)<cr>", desc = "Add cursor below" }
        end,
    },
}

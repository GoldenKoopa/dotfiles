return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}, -- Add your configuration here or leave empty for defaults
    config = function()
        require("todo-comments").setup {
            signs = true,
            keywords = {
                FIX = { icon = "", color = "error", alt = { "FIXME", "BUG", "ISSUE" } },
                TODO = { icon = "", color = "info" },
                HACK = { icon = "", color = "warning" },
                WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
                NOTE = { icon = "", color = "hint", alt = { "INFO" } },
            },
        }
    end
}

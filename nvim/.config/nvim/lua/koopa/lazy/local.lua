
local local_plugins = {
    {
        "ThePrimeagen/caleb",
        config = function() end
    },
    {
        "ThePrimeagen/rfceez",
        config = function()
            local rfc = require("rfceez")
            rfc.setup()
            vim.keymap.set("n", "<leader>ra", function() rfc.add() end)
            vim.keymap.set("n", "<leader>rd", function() rfc.rm() end)
            vim.keymap.set("n", "<leader>rs", function() rfc.show_notes() end)
            vim.keymap.set("n", "[r", function() rfc.nav_next() end)
            vim.keymap.set("n", "[[r", function() rfc.show_next() end)
        end
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()

            vim.keymap.set("n", "<leader>A", function() harpoon:list():prepend() end)
            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<leader><C-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<leader><C-j>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<leader><C-k>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<leader><C-l>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<leader>r<C-h>", function() harpoon:list():replace_at(1) end)
            vim.keymap.set("n", "<leader>r<C-j>", function() harpoon:list():replace_at(2) end)
            vim.keymap.set("n", "<leader>r<C-k>", function() harpoon:list():replace_at(3) end)
            vim.keymap.set("n", "<leader>r<C-l>", function() harpoon:list():replace_at(4) end)
        end
    },
    {
        "ThePrimeagen/vim-apm",
        config = function()
            --[[
            local apm = require("vim-apm")

            apm:setup({})
            vim.keymap.set("n", "<leader>apm", function() apm:toggle_monitor() end)
            --]]
        end
    },
    {
        "ThePrimeagen/vim-with-me",
        config = function() end
    },
}

return local_plugins


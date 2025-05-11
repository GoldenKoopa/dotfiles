return {
  "christoomey/vim-tmux-navigator",
    lazy = false,
 config = function ()
    vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
    vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
    vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
    vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
    vim.keymap.set("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>")
  end,
    keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
}


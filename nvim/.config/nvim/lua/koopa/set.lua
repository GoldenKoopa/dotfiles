vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

local function custom_fold_text()
    local line = vim.fn.getline(vim.v.foldstart)
    local javadoc_pattern = "^%s*/%*%*"
    local fold_start = vim.v.foldstart

    -- Check if the fold starts with a JavaDoc comment
    while vim.fn.getline(fold_start):match(javadoc_pattern) do
        fold_start = fold_start + 1
    end

    line = vim.fn.getline(fold_start)
    local fold_end = vim.v.foldend
    local fold_length = fold_end - fold_start + 1
    return line .. " ... +" .. fold_length .. " lines"
end

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
-- vim.opt.foldtext = "v:lua.custom_fold_text()"
vim.opt.foldcolumn = "1"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- paste
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- center and unfold search result
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- join lines without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- move selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("v", "<leader>46", function()
	vim.cmd("normal! c")
	local selection = vim.fn.getreg('"')
	local decoded = vim.fn.system("base64 --decode", selection)
	vim.fn.setreg('"', decoded)
	vim.cmd('normal! "0p')
end, { noremap = true, silent = true })

vim.keymap.set("v", "<leader>64", function()
	vim.cmd("normal! c")
	local selection = vim.fn.getreg('"')
	local decoded = vim.fn.system("base64 -w 0", selection)
	vim.fn.setreg('"', decoded)
	vim.cmd('normal! "0p')
end, { noremap = true, silent = true })

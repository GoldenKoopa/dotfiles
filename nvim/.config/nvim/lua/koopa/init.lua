require("koopa.set")
require("koopa.remap")
require("koopa.lazy_init")

-- set colorscheme
vim.cmd("colorscheme kanagawa")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("koopa-lsp-attach", { clear = true }),
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.get_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.get_prev()
		end, opts)
	end,
})

vim.filetype.add({
	extension = {
		["http"] = "http",
	},
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	pattern = "*",
	group = vim.api.nvim_create_augroup("koopa-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

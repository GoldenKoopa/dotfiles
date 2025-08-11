return {
	"stevearc/conform.nvim",
	opts = {},
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				local m = vim.fn.mode() -- detect current mode
				if m == "v" or m == "V" or m == "\22" then -- <C-V>
					vim.cmd([[execute "normal! \<ESC>"]])
					local lstart2 = vim.fn.getpos("'<")
					local lend2 = vim.fn.getpos("'>")
					require("conform").format({
						async = true,
						range = { start = { lstart2[2], lstart2[3] }, ["end"] = { lend2[2], lend2[3] } },
					})
					return
				end
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
		{
			"<leader>af",
			function()
				local m = vim.fn.mode()
				if m == "v" or m == "V" or m == "\22" then -- <C-V>
					vim.cmd([[execute "normal! \<ESC>"]])
					local lstart2 = vim.fn.getpos("'<")
					local lend2 = vim.fn.getpos("'>")
					require("conform").format({
						async = true,
						range = { start = { lstart2[2], lstart2[3] }, ["end"] = { lend2[2], lend2[3] } },
						formatters = { "my_google_java_format_aosp" },
					})
					return
				end
				require("conform").format({
					async = true,
					formatters = { "my_google_java_format_aosp" },
				})
			end,
			mode = "",
			desc = "Format buffer (AOSP)",
		},
	},
	config = function()
		require("conform").setup({
			formatters = {
				my_google_java_format = {
					command = "google-java-format",
					args = function(_, ctx)
						local args = {}
						if ctx.range then
							table.insert(args, "--lines")
							table.insert(args, string.format("%d:%d", ctx.range.start[1], ctx.range["end"][1]))
						end
						table.insert(args, "-")
						return args
					end,
					stdin = true,
				},
				my_google_java_format_aosp = {
					command = "google-java-format",
					args = function(_, ctx)
						local args = { "--aosp" }
						if ctx.range then
							table.insert(args, "--lines")
							table.insert(args, string.format("%d:%d", ctx.range.start[1], ctx.range["end"][1]))
						end
						table.insert(args, "-")
						return args
					end,
					stdin = true,
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },

                cpp = { "clang-format" },

				java = { "google-java-format" },
                -- java = { "clang-format" },
                xml = { "xmlformatter" },
                html = { "htmlbeautifier" },
                json = { "clang-format" },
			},
		})
	end,
}

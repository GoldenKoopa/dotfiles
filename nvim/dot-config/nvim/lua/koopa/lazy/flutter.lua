return {
	-- for DAP support
	{ "mfussenegger/nvim-dap" },
	{
		"akinsho/flutter-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "stevearc/dressing.nvim" },
		config = function()
			require("flutter-tools").setup({
				-- (uncomment below line for windows only)
				-- flutter_path = "home/flutter/bin/flutter.bat",

				debugger = {
					-- make these two params true to enable debug mode
					enabled = false,
					run_via_dap = false,
					register_configurations = function(_)
						require("dap").adapters.dart = {
							type = "executable",
							command = vim.fn.stdpath("data") .. "/mason/bin/dart-debug-adapter",
							args = { "flutter" },
						}

						require("dap").configurations.dart = {
							{
								type = "dart",
								request = "launch",
								name = "Launch flutter",
								dartSdkPath = "home/flutter/bin/cache/dart-sdk/",
								flutterSdkPath = "home/flutter",
								program = "${workspaceFolder}/lib/main.dart",
								cwd = "${workspaceFolder}",
							},
						}
						-- uncomment below line if you've launch.json file already in your vscode setup
						-- require("dap.ext.vscode").load_launchjs()
					end,
				},
				dev_log = {
					-- toggle it when you run without DAP
					enabled = false,
					open_cmd = "tabedit",
				},
				lsp = {
					on_attach = function(client, bufnr)
						-- Enable completion triggered by <c-x><c-o>
						vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

						-- Buffer-local keymaps
						local opts = { noremap = true, silent = true, buffer = bufnr }
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
						vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
						vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
						vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
						vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
					end,
					capabilities = require("blink.cmp").get_lsp_capabilities(),
				},
			})
		end,
	},
	-- for dart syntax hightling
	{
		"dart-lang/dart-vim-plugin",
	},
}

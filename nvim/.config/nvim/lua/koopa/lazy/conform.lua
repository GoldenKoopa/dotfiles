return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                rust = { "rustfmt" },
                -- Conform will run the first available formatter
                javascript = { "prettierd", "prettier", stop_after_first = true },

                java = {
                    "google-java-format",
                    args = { "" }, -- Optional: Customize arguments if needed
                },
            },
        })
        vim.keymap.set("v", "<leader>f", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, { desc = "Format selected lines" })
        vim.keymap.set("n", "<leader>f", function()
            require("conform").format({ async = true, lsp_fallback = true })
        end, { desc = "Format lines" })
    end
}




-- ------------------------------
-- return {
--     "jose-elias-alvarez/null-ls.nvim",
--     event = "VeryLazy",
--     opts = function()
--         local null_ls = require("null-ls")
--         local helpers = require("null-ls.helpers")
--         local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--         -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
--         local opts = {
--             -- capabilities = capabilities,
--             sources = {
--                 null_ls.builtins.formatting.clang_format,
--                 null_ls.builtins.formatting.csharpier,
--                 null_ls.builtins.formatting.eslint,
--             },
--             -- on_attach = function (client, bufnr)
--             --     if client.supports_method("textDocument/formatting") then
--             --         vim.api.nvim_create_autocmd("BufWritePre", {
--             --             buffer = bufnr,
--             --             callback = function ()
--             --                 vim.lsp.buf.format({ async = true })
--             --             end,
--             --     })
--             --     end
--             -- end
--         }
--
--         return opts
--     end
-- }

--
-- return {
--     "jose-elias-alvarez/null-ls.nvim",
--     event = "VeryLazy",
--     dependencies = { "editorconfig/editorconfig-vim" },
--     opts = function()
--         local null_ls = require("null-ls")
--         local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
--         local function with_editorconfig(formatter)
--             return formatter.with({
--                 extra_args = function(params)
--                     local ec = require("editorconfig").parse(params.bufname)
--                     local args = {}
--
--                     if ec.indent_style == "space" then
--                         table.insert(args, "--indent-with-spaces")
--                         table.insert(args, "--indent-width=" .. (ec.indent_size or 4))
--                     elseif ec.indent_style == "tab" then
--                         table.insert(args, "--indent-with-tabs")
--                         table.insert(args, "--tab-width=" .. (ec.tab_width or 4))
--                     end
--
--                     return args
--                 end
--             })
--         end
--
--         return {
--             sources = {
--                 with_editorconfig(null_ls.builtins.formatting.clang_format),
--                 with_editorconfig(null_ls.builtins.formatting.csharpier),
--                 with_editorconfig(null_ls.builtins.formatting.eslint),
--             }
--         }
--     end
-- }
--
-- return {
--     "jose-elias-alvarez/null-ls.nvim",
--     event = "VeryLazy",
--     dependencies = { "editorconfig/editorconfig-vim" },
--     opts = function()
--         local null_ls = require("null-ls")
--         local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
--         local function with_editorconfig(formatter)
--             return formatter.with({
--                 extra_args = function(params)
--                     local ec = require("editorconfig").parse(params.bufname)
--                     local args = {}
--
--                     -- Common EditorConfig to formatter arguments
--                     if ec.indent_style == "space" then
--                         table.insert(args, "--indent-with-spaces")
--                         table.insert(args, "--indent-width=" .. (ec.indent_size or 4))
--                     elseif ec.indent_style == "tab" then
--                         table.insert(args, "--indent-with-tabs")
--                         table.insert(args, "--tab-width=" .. (ec.tab_width or 4))
--                     end
--
--                     -- Add file-specific arguments for range formatting
--                     if params.range then
--                         table.insert(args, string.format("--lines=%d-%d",
--                             params.range.start.line + 1,  -- LSP uses 0-based indexing
--                             params.range["end"].line + 1
--                         ))
--                     end
--
--                     return args
--                 end
--             })
--         end
--
--         return {
--             sources = {
--                 with_editorconfig(null_ls.builtins.formatting.clang_format),
--                 with_editorconfig(null_ls.builtins.formatting.csharpier),
--                 with_editorconfig(null_ls.builtins.formatting.eslint),
--             },
--             on_attach = function(client, bufnr)
--                 if client.supports_method("textDocument/rangeFormatting") then
--                     -- Visual mode range formatting
--                     vim.keymap.set("v", "<leader>f", function()
--                         vim.lsp.buf.format({
--                             bufnr = bufnr,
--                             range = {
--                                 ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
--                                 ["end"] = vim.api.nvim_buf_get_mark(0, ">")
--                             }
--                         })
--                     end, { buffer = bufnr, desc = "Format selection" })
--                 end
--             end
--         }
--     end
-- }

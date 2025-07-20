-- None-Ls serves as a way to add formatters and linters to neovim in a way that they can be handled by Mason/Lsp config in the same way as LSPs, grouping everything together in a simple framework :)

-- IMPORTANT: REMEMBER TO USE :Mason COMMAND TO INSTALL THER FORMATTERS AND LINTERS THT YOU USE OTHERWISE THIS IS USELESS :)
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- Formatter for lua
				null_ls.builtins.formatting.black, -- Formatter for python
				null_ls.builtins.diagnostics.pylint, -- Linting for python
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}

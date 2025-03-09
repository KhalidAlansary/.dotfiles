return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			svelte = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			liquid = { "prettier" },
			lua = { "stylua" },
			python = { "isort", "black" },
			cpp = { "clang-format" },
			java = { "clang-format" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout = 1000,
		},
	},
	config = function(_, opts)
		local conform = require("conform")

		conform.setup(opts)

		vim.keymap.set("n", "<leader>F", conform.format, { desc = "Format" })
	end,
}

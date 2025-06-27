return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cmake = { "cmake-format" },
			cpp = { "clang-format" },
			css = { "prettier" },
			go = { "gofmt" },
			graphql = { "prettier" },
			html = { "prettier" },
			java = { "clang-format" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			json = { "prettier" },
			liquid = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			python = { "isort", "black" },
			rust = { "rustfmt" },
			sql = { "pg_format" },
			svelte = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			yaml = { "prettier" },
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

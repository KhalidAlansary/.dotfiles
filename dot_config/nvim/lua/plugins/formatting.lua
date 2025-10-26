return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cmake = { "cmake-format" },
			cpp = { "clang-format" },
			css = { "biome-check" },
			go = { "gofmt" },
			graphql = { "biome-check" },
			html = { "biome-check" },
			java = { "clang-format" },
			javascript = { "biome-check" },
			javascriptreact = { "biome-check" },
			json = { "biome-check" },
			jsonc = { "biome-check" },
			liquid = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			python = { "isort", "black" },
			rust = { "rustfmt" },
			sql = { "pg_format" },
			svelte = { "biome-check" },
			typescript = { "biome-check" },
			typescriptreact = { "biome-check" },
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

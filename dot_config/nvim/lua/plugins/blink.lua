return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = { "lazy.nvim", { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
			},
		},
	},

	version = "*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		completion = {
			documentation = {
				auto_show = true,
			},
		},
		signature = { enabled = true },
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}

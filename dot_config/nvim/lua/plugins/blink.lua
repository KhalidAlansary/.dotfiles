return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"Kaiser-Yang/blink-cmp-avante",
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
			default = { "avante", "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				avante = {
					module = "blink-cmp-avante",
					name = "Avante",
				},
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

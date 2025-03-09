-- ashen for the late night coding sessions
-- return {
-- 	"ficcdaf/ashen.nvim",
-- 	dependencies = { "nvim-lualine/lualine.nvim" },
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("ashen").setup()
-- 		vim.cmd.colorscheme("ashen")
-- 		local lualine_opts = require("ashen.plugins.lualine")
-- 		lualine_opts.extensions = { "lazy", "fzf" }
-- 		require("lualine").setup(lualine_opts)
-- 	end,
-- }
-- tokyonight for a when feeling hippy
return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup()
		vim.cmd.colorscheme("tokyonight")
	end,
}

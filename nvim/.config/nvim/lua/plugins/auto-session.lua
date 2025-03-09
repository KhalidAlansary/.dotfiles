return {
	"rmagatti/auto-session",
	dependencies = { "nvim-telescope/telescope.nvim" },
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- log_level = "debug",
	},
	config = function(_, opts)
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		require("auto-session").setup(opts)
		vim.keymap.set("n", "<Leader>ls", require("auto-session.session-lens").search_session, {
			noremap = true,
		})
	end,
}

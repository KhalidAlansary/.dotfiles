return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	opts = {
		disable_netrw = true,
		view = {
			width = 35,
			relativenumber = true,
			side = "right",
		},
		git = {
			ignore = false,
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			show_on_open_dirs = false,
		},
	},
	config = function(_, opts)
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.opt.termguicolors = true

		require("nvim-tree").setup(opts)

		vim.keymap.set("n", "<leader>ee", vim.cmd.NvimTreeToggle, { desc = "Toggle file explorer" })
		vim.keymap.set(
			"n",
			"<leader>ef",
			vim.cmd.NvimTreeFindFileToggle,
			{ desc = "Toggle file explorer on current file" }
		)
		vim.keymap.set("n", "<leader>ec", vim.cmd.NvimTreeCollapse, { desc = "Collapse file explorer" })
		vim.keymap.set("n", "<leader>er", vim.cmd.NvimTreeRefresh, { desc = "Refresh file explorer" })
	end,
}

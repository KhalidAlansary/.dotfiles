return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-tree/nvim-web-devicons", lazy = true },
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		require("telescope.actions")
		require("todo-comments")

		telescope.load_extension("fzf")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find string in cwd" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Lists open buffers in current neovim instance" })
		vim.keymap.set(
			"n",
			"<leader>fh",
			builtin.help_tags,
			{ desc = "Lists available help tags and opens a new window with the relevant help info" }
		)
		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({ cwd = "~/.config/nvim/" })
		end, { desc = "Fuzzy find files in nvim config directory" })
		vim.keymap.set("n", "<leader>ft", vim.cmd.TodoTelescope, { desc = "List all todo comments in cwd" })
	end,
}

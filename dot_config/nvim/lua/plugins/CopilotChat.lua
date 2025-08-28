return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	dependencies = {
		"zbirenbaum/copilot.lua",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	build = "make tiktoken",
	opts = {
		mappings = {
			complete = {
				insert = "",
			},
			reset = {
				normal = "<C-x>",
				insert = "<C-x>",
			},
			accept_diff = {
				normal = "<C-a>",
				insert = "<C-a>",
			},
		},
	},
	keys = {
		{
			"<leader>cco",
			vim.cmd.CopilotChatOpen,
			desc = "Open chat window",
		},
		{
			"<leader>cct",
			vim.cmd.CopilotChatToggle,
			desc = "Toggle chat window",
		},
	},
}

return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	dependencies = {
		"github/copilot.vim",
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
		model = "claude-3.7-sonnet-thought",
	},
	keys = {
		{
			"<leader>ccq",
			function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
				end
			end,
			desc = "CopilotChat - Quick chat",
		},
		-- Show prompts actions with telescope
		{
			"<leader>ccp",
			function()
				local actions = require("CopilotChat.actions")
				require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
			end,
			desc = "CopilotChat - Prompt actions",
		},
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
	config = function(_, opts)
		require("CopilotChat").setup(opts)
	end,
}

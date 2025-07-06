return {
	"github/copilot.vim",
	event = "VeryLazy",
	keys = {
		{ "<leader>cpe", ":Copilot enable<CR>", desc = "Enable Copilot" },
		{ "<leader>cpd", ":Copilot disable<CR>", desc = "Disable Copilot" },
	},
	config = function()
		-- Start disabled by default
		vim.cmd.Copilot("disable")
	end,
}

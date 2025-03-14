return {
	"github/copilot.vim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>cpe", ":Copilot enable<CR>", desc = "Enable Copilot" },
		{ "<leader>cpd", ":Copilot disable<CR>", desc = "Disable Copilot" },
	},
}

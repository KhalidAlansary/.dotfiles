return {
	"CRAG666/code_runner.nvim",
	dependencies = {
		"preservim/vimux",
	},
	opts = {
		mode = "vimux",
	},
	keys = {
		{ "<F5>", vim.cmd.RunCode, desc = "Run Code" },
	},
}

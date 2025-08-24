return {
	"preservim/tagbar",
	keys = {
		{ "<leader>ct", vim.cmd.TagbarToggle, desc = "Toggle Tagbar" },
	},
	config = function()
		vim.g.tagbar_sort = 0
	end,
}

return {
	"zbirenbaum/copilot.lua",
	command = "Copilot",
	event = { "InsertEnter" },
	opts = {
		suggestion = {
			auto_trigger = true,
			hide_status = true,
			keymap = {
				accept = "<Tab>",
				accept_word = "<C-l>",
				accept_line = "<C-Enter>",
			},
		},
		filetypes = {
			yaml = true,
			markdown = true,
			json = true,
		},
	},
}

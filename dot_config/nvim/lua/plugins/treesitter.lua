return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		main = "nvim-treesitter",
		config = function(_, opts)
			require("nvim-treesitter").setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function()
					local disable_fts = { csv = true, tsv = true }
					if disable_fts[vim.bo.filetype] then
						return
					end
					pcall(vim.treesitter.start)
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- basic autotag setup since it is independent now
			enable = true,
		},
	},
}

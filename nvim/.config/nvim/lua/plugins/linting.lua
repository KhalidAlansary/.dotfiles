return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				local ft = vim.bo.filetype
				if
					(
						ft == "javascript"
						or ft == "typescript"
						or ft == "javascriptreact"
						or ft == "typescriptreact"
						or ft == "svelte"
					) and vim.fn.glob(".eslintrc*") ~= ""
				then
					lint.try_lint()
				elseif ft == "python" then
					lint.try_lint()
				end
			end,
		})

		vim.keymap.set("n", "<leader>L", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}

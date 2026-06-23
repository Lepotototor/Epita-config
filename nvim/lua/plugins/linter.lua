return {

	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			lua = { "selene" },

			-- c = { "clang_tidy" },
			cpp = { "cppcheck" },

			javascript = { "eslint" },
			typescript = { "eslint" },
			javascriptreact = { "eslint" },
			typescriptreact = { "eslint" },
		}

		lint.linters.eslint.cmd = "eslint"

		-- Create an automatisation for the linter
		local lint_autgroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_autgroup,
			callback = function()
				lint.try_lint()
			end,
		})

		-- test function, TODO remove it
		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger linitng for current file" }
		)
	end,
}

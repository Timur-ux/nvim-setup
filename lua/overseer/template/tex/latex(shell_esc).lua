return {
	name = "latex(shell-escape)",
	builder = function()
		local file = vim.fn.expand("%:r")
		return {
			cmd = { "latex" },
			args = { "-shell-escape", file .. ".tex" },
      components = {
        -- {"on_output_quickfix"},
        "default"}
		}
	end,
	condition = {
		filetype = { "tex" },
	},
}



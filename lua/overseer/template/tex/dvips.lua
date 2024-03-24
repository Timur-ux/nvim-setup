return {
	name = "dvips",
	builder = function()
		local file = vim.fn.expand("%:r")
		return {
			cmd = { "dvips" },
			args = { file .. ".dvi" },
			components = {
				-- "on_output_quickfix",
				"default",
			},
		}
	end,
	condition = {
		filetype = { "tex" },
	},
}

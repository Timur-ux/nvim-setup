return {
	name = "latex",
	builder = function()
		local file = vim.fn.expand("%:r")
		return {
			cmd = { "latex" },
			args = { file .. ".tex" },
		}
	end,
	condition = {
		filetype = { "tex" },
	},
}

return {
	name = "ps2pdf",
	builder = function()
		local file = vim.fn.expand("%:r")
		return {
			cmd = { "ps2pdf" },
			args = { file .. ".ps" },
			components = {
				"default",
			},
		}
	end,
	condition = {
		filetype = { "tex" },
	},
}

return {
	name = "asymptote",
	builder = function()
		local file = vim.fn.expand("%:r")
		return {
			cmd = { "asy" },
			args = { file .. ".asy" },
			components = {
				"default",
			},
		}
	end,
	condition = {
		-- filetype = { "asy" },
	},
}


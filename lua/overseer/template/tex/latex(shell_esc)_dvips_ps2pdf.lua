return {
	name = "latex(shell escape) + dvips + ps2pdf",
	builder = function()
		local file = vim.fn.expand("%:r")
		return {
			cmd = { "ps2pdf" },
			args = { file .. ".ps" },
			components = {
				{
					"dependencies",
					task_names = {
						"latex(shell-escape)",
						"dvips",
					},
					sequential = true,
				},
				-- { "on_output_quickfix" },
				"default",
			},
		}
	end,
	condition = {
		filetype = { "tex" },
	},
}

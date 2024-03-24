return {
	name = "latex + dvips + ps2pdf",
	builder = function()
		local file = vim.fn.expand("%:r")
		return {
			cmd = { "ps2pdf" },
			args = { file .. ".ps" },
			components = {
				{ "dependencies", task_names = {
          "latex",
					"dvips",
				}, sequential = true },
				"default",
			},
		}
	end,
  condition = {
    filetype = {"tex"}
  }

}

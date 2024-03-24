require("overseer").setup({
	log = {
		{
			type = "file",
			filename = "overseer.log",
			level = vim.log.levels.DEBUG, -- or TRACE for max verbosity
		},
	},
	templates = {
		"builtin",
		"tex.latex",
		"tex.latex(shell_esc)",
		"tex.dvips",
		"tex.ps2pdf",
		"tex.latex(shell_esc)_dvips_ps2pdf",
    "tex.latex_dvips_ps2pdf",
    "asymptote.asy"
	},
  strategy = {
    "toggleterm",
    on_create = function ()
      vim.cmd(":winc k")
    end,
    quit_on_exit = "success"
  }
})

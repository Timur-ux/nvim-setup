local util = require("formatter.util")

local configs = {
	lua = {
		require("formatter.filetypes.lua").stylua,
		function()
			if util.get_current_buffer_file_name() == "special.lua" then
				return nil
			end

			-- Full specification of configurations is down below and in Vim help
			-- files
			return {
				exe = "stylua",
				args = {
					"--search-parent-directories",
					"--stdin-filepath",
					util.escape_path(util.get_current_buffer_file_path()),
					"--",
					"-",
				},
				stdin = true,
			}
		end,
	},
	cpp = {
		require("formatter.filetypes.cpp").clangformat,
		function()
			local fileName = util.escape_path(util.get_current_buffer_file_path())
			local configName = vim.fn.stdpath("config") .. "/formattersSetup/.clang_format"
			return {
				exe = "clang-format",
				args = {
					fileName,
					"-style=file:" .. configName,
				},
			}
		end,
	},
	latex = {
		require("formatter.filetypes.tex").latexindent,
		function()
			local fileName = util.escape_path(util.get_current_buffer_file_path())
			local exeName = vim.fn.stdpath("data") .. "/mason/bin/latexindent"
			return {
				exe = exeName,
				args = {
					fileName,
				},
			}
		end,
	},
	-- fsharp = {
	--   require("formatter.filetypes.fs").fantomas,
	-- }
}

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {
		lua = configs["lua"],
		c = configs["cpp"],
		cpp = configs["cpp"],
    tex = configs["latex"],
		-- fs = configs["fsharp"],
		-- fsi = configs["fsharp"],
		-- fsx = configs["fsharp"],
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

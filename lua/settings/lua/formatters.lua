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
	json = {
		require("formatter.filetypes.json").prettierd,
	},
	python = {
		function ()
			return {
				exe = "autoflake",
				args = { "--remove-all-unused-imports", "--remove-unused-variables" ,"-" },
				stdin = true,
			}
		end,
		require("formatter.filetypes.python").autopep8,
		require("formatter.filetypes.python").docformat,
	},
	js = {
		require("formatter.filetypes.javascript").prettierd,
	},
	ts = {
		require("formatter.filetypes.typescript").prettierd,
	},
	jsx = {
		require("formatter.filetypes.javascriptreact").prettierd,
	},
	tsx = {
		require("formatter.filetypes.typescriptreact").prettierd,
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
}

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {
		javascript = configs["js"],
		lua = configs["lua"],
		c = configs["cpp"],
		cpp = configs["cpp"],
		tex = configs["latex"],
		json = configs["json"],
		javascriptreact = configs["jsx"],
		typescriptreact = configs["tsx"],
		typescript = configs["ts"],
		python = configs["python"],
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

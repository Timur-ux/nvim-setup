return {
	{
		"0styx0/abbreinder.nvim",
		dependencies = {
			"0styx0/abbremand.nvim",
		},
		config = function()
			-- config can be empty to stay with defaults
			-- or anything can be changed, with anything unspecified
			-- retaining the default values
			require("abbreinder").setup()
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				highlight_groups = {
					TelescopeBorder = { fg = "overlay", bg = "overlay" },
					TelescopeNormal = { fg = "subtle", bg = "overlay" },
					TelescopeSelection = { fg = "text", bg = "highlight_med" },
					TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
					TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

					TelescopeTitle = { fg = "base", bg = "love" },
					TelescopePromptTitle = { fg = "base", bg = "pine" },
					TelescopePreviewTitle = { fg = "base", bg = "iris" },

					TelescopePromptNormal = { fg = "text", bg = "surface" },
					TelescopePromptBorder = { fg = "surface", bg = "surface" },

					LspSignatureActiveParameter = { bg = "#aa0000" },
				},
			})

			vim.cmd("colorscheme rose-pine-moon")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "ColorScheme",
		config = function()
			require("lualine").setup({
				options = {
					theme = "rose-pine",
				},
			})
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end,
	},
	{
		"stevearc/dressing.nvim",
	},
}

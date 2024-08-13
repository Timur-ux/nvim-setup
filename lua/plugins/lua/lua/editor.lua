return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"MunifTanjim/exrc.nvim",
		config = function()
			vim.o.exrc = false

			require("exrc").setup({
				files = {
					".nvimrc.lua",
					".nvimrc",
					".exrc.lua",
					".exrc",
				},
			})
		end,
	},
	{
		"nvim-lua/popup.nvim",
	},
	{
		"majutsushi/tagbar",
	},
	{
		"okuuva/auto-save.nvim",
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon").setup()
		end,
	},
	{
		"powerman/vim-plugin-ruscmd",
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "ColorScheme",
		config = function()
			require("toggleterm").setup({
				highlights = require("rose-pine.plugins.toggleterm"),
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, _)
			local opts = {
				handler_opts = { border = "rounded" },
			}
			require("lsp_signature").setup(opts)
		end,
	},
}

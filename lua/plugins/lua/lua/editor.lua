return {
	{
		"windwp/nvim-autopairs",
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
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
			{
				"quangnguyen30192/cmp-nvim-ultisnips",
				config = function()
					-- optional call to setup (see customization section)
					require("cmp_nvim_ultisnips").setup({})
				end,
				-- If you want to enable filetype detection based on treesitter:
				requires = { "nvim-treesitter/nvim-treesitter" },
			},
		},
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

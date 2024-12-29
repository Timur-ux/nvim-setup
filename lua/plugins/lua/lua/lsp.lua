local masonPackages = "stylua lua-language-server clangd clang-format cpptools typescript-language-server prettier prettierd pyright autopep8 latexindent texlab cmake-language-server glsl_analyzer bash-language-server"
local masonWarning = "Make sure that npm, python3 virtualenv installed"

function MasonInstallDefaults()
  vim.cmd("MasonInstall " .. masonPackages)
end

return {
	{
		"preservim/vim-markdown",
		dependencies = {
			"godlygeek/tabular",
		},
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	    config = function(args)
	      MasonInstallDefaults()
	    end,
	},
	{
		"p00f/clangd_extensions.nvim",
	},
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_mode = 0
			vim.opt.conceallevel = 1
			vim.g.tex_conceal = "abdmg"
		end,
	},
	{
		"SirVer/ultisnips",
		init = function()
      vim.g.UltiSnipsEditSplit = "tabdo"
		end,
	},
	{
		"babaybus/DoxygenToolkit.vim",
	},
	{
		"saadparwaiz1/cmp_luasnip",
	},
	{
		"ionide/Ionide-vim",
		config = function()
			require("ionide").setup({})
		end,
	},
	{
		"regen100/cmake-language-server",
	},
	{
		"MunifTanjim/prettier.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/null-ls.nvim",
		},
	},
	{
		"glepnir/lspsaga.nvim",
	},
}

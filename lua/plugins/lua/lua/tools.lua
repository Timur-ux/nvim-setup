return {
	{
		"Civitasv/cmake-tools.nvim",
	},
	{
		"stevearc/overseer.nvim",
	},
	{ "nvim-neotest/nvim-nio" },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
  {
    "SirVer/ultisnips",
    config = function ()
      vim.g.UltiSnipsJumpForwardTrigger="<c-j>"
      vim.g.UltiSnipsJumpBackwardTrigger="<c-k>"

      vim.g.UltiSnipsEditSplit="tabdo"
    end
  },
  {
    'honza/vim-snippets'
  },
  {
    "quangnguyen30192/cmp-nvim-ultisnips"
  }
}

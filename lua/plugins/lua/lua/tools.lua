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
}

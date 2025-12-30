return {
	{
		"numToStr/Comment.nvim",
		config = true,
	},
	{
		"my-rubbish/nvim.comment-hide",
		name = "comment-hide",
		lazy = false,
		config = function()
			require("comment-hide").setup({
				gitignore = true, -- Automatically add .annotations/ to .gitignore.
			})
		end,
	},
}

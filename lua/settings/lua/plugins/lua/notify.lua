require("notify").setup({
	max_width = function ()
		local width = vim.api.nvim_win_get_width(0)
		return math.floor(width / 2)
	end,
	render = "wrapped-compact",
	stages = "fade"
})

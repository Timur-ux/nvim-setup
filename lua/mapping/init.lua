vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"

local prefix = "mapping.lua"
local settingToLoad = {
	"basicMoves",
	"buffers",
	"tabs",
	"dap",
	"tools",
	"harpoon"
}

for _, file in ipairs(settingToLoad) do
	require(prefix .. "." .. file)
end

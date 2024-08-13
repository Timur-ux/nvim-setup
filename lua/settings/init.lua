local opt = vim.opt

opt.mouse = ""
opt.showcmd = true

opt.number = true
opt.hlsearch = true
opt.relativenumber = true
opt.expandtab = true
opt.tabstop = 2
opt.autoindent = true
opt.softtabstop = 2
opt.shiftwidth = 2

opt.cursorline = true
opt.termguicolors = true

local prefix = "settings.lua"
local settingsToLoad = {
	"debuggers",
	"lsp",
	"cmp",
	"formatters",
	"plugins",
}

for _, setting in ipairs(settingsToLoad) do
	require(prefix .. "." .. setting)
end

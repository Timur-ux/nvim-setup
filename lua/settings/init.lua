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

vim.o.exrc = true

opt.cursorline = true
opt.termguicolors = true
opt.clipboard = "unnamedplus"

opt.conceallevel = 2
vim.g.vim_markdown_conceal = 1

vim.g.tex_conceal = "admsg"
vim.g.vim_markdown_math = 1

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

local opt = vim.opt

opt.mouse = ""
opt.showcmd = true

opt.number = true
opt.hlsearch = true
opt.relativenumber = true
opt.expandtab = false
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.signcolumn = "yes"
opt.autoindent = true

vim.o.exrc = true

opt.cursorline = true
opt.termguicolors = true
-- opt.clipboard = "unnamedplus"

opt.conceallevel = 2
vim.g.vim_markdown_conceal = 1

vim.g.UltiSnipsSnippetDirectories={"UltiSnips", "MyUltiSnips"}


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

vim.api.nvim_create_autocmd("BufWritePost", {
	command = "silent! ctags -R . &" })

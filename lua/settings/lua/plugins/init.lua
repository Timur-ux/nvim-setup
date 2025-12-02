local plugins = {
	"cmake_tools",
	"lualine",
	"nvim_tree",
	"LuaSnip",
	"auto_save",
	"markdown",
  "obsidian",
  "autopairs",
  "vimtex",
	"plantuml",
	"jupynium",
	"notify",
}

local prefix = "settings.lua.plugins.lua."

for _, plugin in pairs(plugins) do
	require(prefix .. plugin)
end

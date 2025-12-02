function concat(t1, t2)
  for i = 1, #t2 do
    t1[#t1+1] = t2[i]
  end
  return t1
end

local prefix = 'plugins.lua.lua'
local plugins = {}
local pluginSections = {
  'view',
  'editor',
  'search',
  'coding',
  'treesitter',
  'lsp',
  'debuggers',
  'linters',
  'formatters',
  'tools',
}

for i, section in ipairs(pluginSections) do
  local sectionPlugins = require(prefix .. '.' .. section)
  plugins = concat(plugins, sectionPlugins)
end

return plugins

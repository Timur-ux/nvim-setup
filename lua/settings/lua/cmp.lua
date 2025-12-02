vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require("cmp")
local select_opts = { behavior = cmp.SelectBehavior.Select }
function UltiSnips_IsExpandable()
  local result = vim.call("UltiSnips#CanExpandSnippet")
  return result == 1
end

local compare = cmp.config.compare
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},

	sources = {
		{ name = "jupynium", priority = 1000},
		{ name = "ultisnips", priority = 100},
		{ name = "path", priority = 90},
		{ name = "nvim_lsp", keyword_length = 1, priority=90 },
		{ name = "buffer", keyword_length = 4, priority=90 },
		{ name = "luasnip", keyword_length = 3, priority=90 },
	},
	sorting = {
		priority_weight = 1.0,
		comparators = {
			compare.score,
			compare.recently_used,
			compare.locality
		}
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "λ",
				luasnip = "",
				buffer = "Ω",
				path = "",
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = {
		["<M-k>"] = cmp.mapping.select_prev_item(select_opts),
		["<M-j>"] = cmp.mapping.select_next_item(select_opts),
		["<C-Space>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = function(fallback)
			if UltiSnips_IsExpandable() then
        vim.call("UltiSnips#ExpandSnippet")
      elseif cmp.visible() then
				cmp.mapping.confirm({select = true})()
      else
        fallback()
			end
		end,
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-e>"] = cmp.mapping.abort(),
	},
})

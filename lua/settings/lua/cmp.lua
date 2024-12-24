vim.opt.completeopt = { "menu", "menuone", "noselect" }
local cmp = require("cmp")
local select_opts = { behavior = cmp.SelectBehavior.Select }
require("cmp_nvim_ultisnips").setup({})
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},

	sources = {
		{ name = "path" },
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "buffer", keyword_length = 4 },
		{ name = "ultisnips", keyword_length = 2 },
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
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-e>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.mapping(function(fallback)
      if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
        print("ulti")
        vim.fn["UltiSnips#ExpandSnippet"]()
      elseif cmp.visible() then
        print("cmp")
        cmp.mapping.confirm({ select = true })()
      else
        print("fallback")
        fallback()
      end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
      cmp.mapping.abort()()
		end, { "i", "s" }),
	},
})

require("mason").setup()
require("mason-lspconfig").setup()

local lspCapabilities = require("cmp_nvim_lsp").default_capabilities()
local cfg = {
	capabilities = lspCapabilities,
}

vim.lsp.config("docker_compose_language_service", {
	capabilities = lspCapabilities,
	filetypes = { "yaml.docker-compose", "yml", "yaml", "docker-compose.yml", "docker-compose.yaml" },
})

vim.lsp.config("dockerls", {
	capabilities = lspCapabilities,
	filetypes = { "dockerfile", "Dockerfile" },
	settings = {
		docker = {
			languageserver = {
				formatter = {
					ignoreMultilineInstructions = true,
				},
			},
		},
	},
})

vim.lsp.config("*", cfg)
vim.lsp.enable({
	"clangd",
	"pyright",
	"lua_ls",
	"ts_ls",
	"glsl_analyzer",
	"cmake",
	"texlab",
	"bashls",
	"docker_compose_language_service",
	"dockerls",
})
vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- lsp.clangd.setup(cfg)
-- lsp.pyright.setup(cfg)
-- lsp.lua_ls.setup(cfg)
-- lsp.ts_ls.setup(cfg)
-- lsp.glsl_analyzer.setup(cfg)
-- lsp.cmake.setup(cfg)
-- lsp.texlab.setup(cfg)
-- lsp.bashls.setup(cfg)
-- lsp.docker_compose_language_service.setup({})
-- lsp.dockerls.setup({
-- 	capabilities = lspCapabilities,
-- 	filetypes = { "dockerfile", "Dockerfile" },
-- 	settings = {
-- 		docker = {
-- 			languageserver = {
-- 				formatter = {
-- 					ignoreMultilineInstructions = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- })

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = true }
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- Displays hover information about the symbol under the cursor
		bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")

		-- Jump to the definition
		bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

		-- Jump to declaration
		bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")

		-- Lists all the implementations for the symbol under the cursor
		bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")

		-- Jumps to the definition of the type symbol
		bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")

		-- Lists all the references
		bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")

		-- Displays a function's signature information
		bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

		-- Renames all references to the symbol under the cursor
		bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")

		-- Selects a code action available at the current cursor position
		bufmap("n", "<F3>", "<cmd>lua vim.lsp.buf.code_action()<cr>")

		-- Show diagnostics in a floating window
		bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

		-- Move to the previous diagnostic
		bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

		-- Move to the next diagnostic
		bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
	end,
})

local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = "",
	})
end

sign({ name = "DiagnosticSignError", text = "" })
sign({ name = "DiagnosticSignWarn", text = "" })
sign({ name = "DiagnosticSignHint", text = "" })
sign({ name = "DiagnosticSignInfo", text = "" })

vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	float = {
		border = "rounded",
	},
})
vim.lsp.buf.hover({ border = "rounded" })
vim.lsp.buf.signature_help({ border = "rounded" })

-- prettier setup
local null_ls = require("null-ls")

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

			-- format on save
			vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
		end

		if client.resolved_capabilities.document_range_formatting then
			vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
		end
	end,
})

local prettier = require("prettier")

prettier.setup({
	bin = "prettierd", -- or `'prettierd'` (v0.23.3+)
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
	["null-ls"] = {
		condition = function()
			return prettier.config_exists({
				-- if `false`, skips checking `package.json` for `"prettier"` key
				check_package_json = true,
			})
		end,
		runtime_condition = function(params)
			-- return false to skip running prettier
			return true
		end,
		timeout = 5000,
	},
})


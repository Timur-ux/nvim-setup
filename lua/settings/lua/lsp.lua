require("mason").setup()
require("mason-lspconfig").setup()

local lsp = require("lspconfig")
local lspCapabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.clangd.setup({ capabilities = lspCapabilities })
lsp.pyright.setup({ capabilities = lspCapabilities })
lsp.texlab.setup({ capabilities = lspCapabilities })
lsp.lua_ls.setup({ capabilities = lspCapabilities })
lsp.fsautocomplete.setup({
	capabilities = lspCapabilities,
	root_dir = function(fname)
		return vim.fs.dirname(vim.fs.find(function(name, path)
      return name:match(".*%.sln$")
    end, { upward = true })[1])
	end,
})
lsp.ionide.setup({
	capabilities = lspCapabilities,
	root_dir = function(fname)
		return vim.fs.dirname(vim.fs.find(function(name, path)
      return name:match(".*%.sln$")
    end, { upward = true })[1])
	end,
})
lsp.cmake.setup({ capabilities = lspCapabilities })

vim.opt.completeopt = { "menu", "menuone", "noselect" }
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
		source = "always",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

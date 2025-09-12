-- -@diagnostic disable: missing-fields
require("neodev").setup({
	library = { plugins = { "nvim-dap-ui" }, types = true },
})

local dap, dapui = require("dap"), require("dapui")
local customLayouts = {
	full = {
		{
			elements = {
				{
					id = "scopes",
					size = 0.5,
				},
				{
					id = "breakpoints",
					size = 0.25,
				},
				{
					id = "watches",
					size = 0.25
				}
			},
			position = "left",
			size = 40,
		},
		{
			elements = {
				{
					id = "stacks",
					size = 0.5,
				},
				{
					id = "console",
					size = 0.5,
				},
			},
			position = "bottom",
			size = 10,
		},
	},
	lite = {
		{
			elements = {
				{
					id = "scopes",
					size = 1,
				},
			},
			position = "bottom",
			size = 20,
		},
		{
			elements = {
				{
					id = "console",
					size = 0.5,
				},
				{
					id = "stacks",
					size = 0.5,
				},
			},
			position = "left",
			size = 40,
		},
	},
}
dapui.setup({
	layouts = customLayouts.full,
})

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
}

dap.adapters.coreclr = {
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
	args = { "--interpreter=vscode" },
}

dap.configurations.cpp = {
	{
		name="launch with argv",
		type = "cppdbg",
		request = "launch",
		program = function()
			dapui.setup({ layouts = customLayouts.full })
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		args = function()
			local argv = {}
			arg = vim.fn.input(string.format("argv: "))
			for a in string.gmatch(arg, "%S+") do
				table.insert(argv, a)
			end
			vim.cmd('echo ""')
			return argv
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
		MIMode = "gdb",
		miDebuggerPath = "/usr/bin/gdb",
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
	{
		name = "Launch(lite)",
		type = "cppdbg",
		request = "launch",
		program = function()
			dapui.setup({ layouts = customLayouts.lite })
			local message = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			return message
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
	{
		name = "attach(lite)",
		type = "cppdbg",
		request = "attach",
		program = function()
			dapui.setup({ layouts = customLayouts.lite })
			return "${command:pickProcess}"
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
}
dap.configurations.c = dap.configurations.cpp

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
		end,
	},
}
dap.configurations.fsharp = dap.configurations.cs

local dap = require('dap')
local M = {}

function M.ConditionalBreakpoint()
	local message = vim.fn.input("Input condition: ")
	dap.toggle_breakpoint(message)
end

return M

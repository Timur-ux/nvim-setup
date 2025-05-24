return {
	{
			"samharju/yeet.nvim",
			dependencies = {
					"stevearc/dressing.nvim", -- optional, provides sane UX
			},
			version = "*", -- use the latest release, remove for master
			cmd = "Yeet",
			opts = {},
			keys = {
        {
            -- Pop command cache open.
            "<leader>yl", function() require("yeet").list_cmd() end,
        },
        {
            -- Douple tap \ to yeet at something.
            "\\\\",
            function() require("yeet").execute() end,
        },
        {
            -- Run command without clearing terminal, interrupt previous command.
            "<leader>\\",
            function() require("yeet").execute(nil, { clear_before_yeet = false, interrupt_before_yeet = true, }) end,
        },
        {
            -- Yeet visual selection. Useful sending code to a repl or running multiple shell commands.
            -- Using yeet_and_run = true and clear_before_yeet = false heavily suggested, if not
            -- already set in setup.
            "\\\\",
            function() require("yeet").execute_selection({ yeet_and_run = true, clear_before_yeet = false, }) end,
            mode = { "v" },
        },
        {
            -- Open target selection.
            "<leader>yt",
            function() require("yeet").select_target() end,
        },
        {
            -- Toggle autocommand for yeeting after write.
            "<leader>yo",
            function() require("yeet").toggle_post_write() end,
        },
        {
            -- Parse last command output with current vim.o.errorformat and send them to quickfix.
            "<leader>ye",
            function() require("yeet").setqflist({ open = true }) end,
        },
    },
	},
	{
		"vim-pandoc/vim-pandoc",
		"vim-pandoc/vim-pandoc-syntax",
	},
	{
		"epwalsh/pomo.nvim",
		version = "*", -- Recommended, use latest release instead of latest commit
		lazy = true,
		cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
		dependencies = {
			-- Optional, but highly recommended if you want to use the "Default" timer
			"rcarriga/nvim-notify",
		},
		opts = {
			-- See below for full list of options 👇
		},
	},
	{
		"Civitasv/cmake-tools.nvim",
	},
	{ "nvim-neotest/nvim-nio" },
	{
		-- Install markdown preview, use npx if available.
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function(plugin)
			if vim.fn.executable("npx") then
				vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
			else
				vim.cmd([[Lazy load markdown-preview.nvim]])
				vim.fn["mkdp#util#install"]()
			end
		end,
		init = function()
			if vim.fn.executable("npx") then
				vim.g.mkdp_filetypes = { "markdown" }
			end
		end,
	},
}

local harpoon = require("harpoon")

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end
-- add current buffer to harpoon
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
-- remove current buffer from harpoon
vim.keymap.set("n", "<leader>hd", function() harpoon:list():remove() end)

-- print list of harpoon buffers
vim.keymap.set("n", "<leader>he", function() toggle_telescope(harpoon:list()) end)
-- clear harpoon list
vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end)

-- navigate first 1-4 harpoon buffers via alt + 1...4
vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<M-p>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<M-n>", function() harpoon:list():next() end)


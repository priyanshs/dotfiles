return{
  "theprimeagen/harpoon",
  config = function()
    local harpoon = require("harpoon")
    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, {desc="add current to the harpoon list"})
    vim.keymap.set("n", "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "toggle harpoon menu" })

    vim.keymap.set("n", "<leader>hh", function() harpoon:list():select(1) end, {desc="select 1st from harpoon menu"})
    vim.keymap.set("n", "<leader>hj", function() harpoon:list():select(2) end, {desc="select 2nd from the harpoon menu"})
    vim.keymap.set("n", "<leader>hk", function() harpoon:list():select(3) end, {desc="select 3rd from the harpoon menu"})
    vim.keymap.set("n", "<leader>hl", function() harpoon:list():select(4) end, {desc="select 4th from the harpoon menu"})

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

    vim.keymap.set("n", "<leader>hf", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
    end
}

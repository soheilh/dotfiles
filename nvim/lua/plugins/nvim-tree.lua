return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local glyphs = {}
        local installed, circles = pcall(require, 'circles')
        if installed then
            circles.setup({ icons = { empty = '', filled = '', lsp_prefix = '' } })
            glyphs = circles.get_nvimtree_glyphs()
        end
        glyphs.git = {
            unstaged = '',
            staged = '',
            unmerged = '',
            renamed = '',
            untracked = '',
            deleted = '',
            ignored = '',
        }
        require('nvim-tree').setup({
            diagnostics = { enable = true },
            view = {
                width = 30,
                side = 'left',
                signcolumn = 'no',
            },
            git = {
                enable = true,
                ignore = false,
                timeout = 500,
            },
            actions = {},
            renderer = {
                group_empty = true,
                highlight_opened_files = 'all',
                special_files = {},
                root_folder_modifier = ':p:~',
                icons = { glyphs = glyphs, },
            },
    })

	-- recommended settings from nvim-tree documentation
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	
	vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<cr>")
	vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
    end,
}


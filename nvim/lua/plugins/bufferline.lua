return {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
    require("bufferline").setup({
        highlights = {
            buffer_selected = {},
        },
        options = {
            separator_style = "thin",
            offsets = {
                {
                    filetype = "NvimTree",
                    highlight = "Directory",
                    text = "File Explorer",
                    separator = true, 
                },
            },
        },
    })
    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
    vim.keymap.set("n", "<leader>q", ":bp | :bd#<CR>", { noremap = true, silent = true })
    end,
}

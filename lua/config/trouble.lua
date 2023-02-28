return {
    "folke/trouble.nvim",
    requires = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("trouble").setup {}

        local default_opts = { noremap = true, silent = true }

        vim.keymap.set('n', '<leader>q', "<cmd>TroubleToggle document_diagnostics<cr>", default_opts)
    end,
}

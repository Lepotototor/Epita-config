return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.config")
            config.setup({
                auto_installed = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
    end
}

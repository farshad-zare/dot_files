require("neo-tree").setup({
    close_if_last_window = true,

    window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
        popup = { -- settings that apply to float position only
            size = {
                height = "70%",
                width = "50%"
            }
        }
    },

    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_by_name = {".DS_Store", "thumbs.db", ".directory", ".git" -- "node_modules",
            }
        }
    }
})


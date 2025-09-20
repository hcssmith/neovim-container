require("keymaps")

require("ui")
require("ui.noice")
require("ui.lualine")
require("ui.colour")
require("ui.treesitter")

require("feature.macros")
require("feature.git")

require('telescope').setup({})
require('telescope').load_extension('macros')
require('telescope').load_extension('git_worktree')

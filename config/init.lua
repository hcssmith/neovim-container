require("keymaps")

require("ui")
require("ui.noice")
require("ui.lualine")
require("ui.colour")

require("feature.macros")

require('telescope').setup({})
require('telescope').load_extension('macros')

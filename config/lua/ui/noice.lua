require('noice').setup({
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      }
    },
    cmdline = {
      view = "cmdline",
    },
    views = {
      ["mini.win_options.winblend"] = 0,
    },
    presets = {
      bottom_search = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    }
  })

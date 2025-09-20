require("neogit").setup({
    integrations = {
      telescope = true
    }
})

require('gitsigns').setup({
    numhl = true,
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 500,
      virt_text_pos = "right_align",
    },
})

vim.keymap.set('n', '<leader>ng', function () require('neogit').open() end, {})

vim.keymap.set('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        require('gitsigns').nav_hunk('next')
      end
    end, {})

vim.keymap.set('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        require('gitsigns').nav_hunk('prev')
      end
    end, {})

vim.keymap.set('n', '<leader>gb',  function()
        local gitsigns = require('gitsigns')
              -- Open popup window with commit of blamed line.
              gitsigns.blame_line(
                  { full = false },
                  function()
                      -- In order to focus opened popup window, blame_line needs to be called again.
                      gitsigns.blame_line(
                          {},
                          function()
                              -- Now that popup is focused, extract commit SHA from the start of it.
                              local blamed_commit = vim.fn.getline(1):match("^(%x+)")

                              -- Close the focused popup.
                              vim.cmd(":quit")

              				require("neogit.buffers.commit_view").new(blamed_commit):open()
                              -- Rest of the code that has to be executed synchronously after blamed commit is extracted.
                          end)
                  end)
          		end, {})

vim.keymap.set('n', '<leader>gwc', function () require('telescope').extensions.git_worktree.create_git_worktree() end, {})
vim.keymap.set('n', '<leader>gwl', function () require('telescope').extensions.git_worktree.git_worktrees() end, {})

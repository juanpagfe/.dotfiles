local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ph', function()
    builtin.find_files({ hidden=true })
end)
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files({ hidden=false })
end)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>r', function()
    builtin.lsp_references({include_declaration=true, include_current_line = true})
end)
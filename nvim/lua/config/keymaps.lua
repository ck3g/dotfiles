-- Essential vim keybindings ported to neovim

-- Terminal escape mapping
if vim.fn.exists(':tnoremap') == 2 then
  vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
end

-- Navigation mappings for wrapped lines
vim.keymap.set('n', '<Down>', 'gj')
vim.keymap.set('n', '<Up>', 'gk')
vim.keymap.set('n', '<D-j>', 'gj')
vim.keymap.set('n', '<D-k>', 'gk')
vim.keymap.set('n', '<D-4>', 'g$')
vim.keymap.set('n', '<D-6>', 'g^')
vim.keymap.set('n', '<D-0>', 'g^')
vim.keymap.set('v', '<D-j>', 'gj')
vim.keymap.set('v', '<D-k>', 'gk')
vim.keymap.set('v', '<D-4>', 'g$')
vim.keymap.set('v', '<D-6>', 'g^')
vim.keymap.set('v', '<D-0>', 'g^')

-- Clear search highlight
vim.keymap.set('n', '<C-L>', ':nohls<CR><C-L>', { noremap = true })
vim.keymap.set('i', '<C-L>', '<C-O>:nohls<CR>', { noremap = true })

-- Make Y consistent with C and D
vim.keymap.set('n', 'Y', 'y$')

-- Make Q useful (formatting)
vim.keymap.set('n', 'Q', 'gq')

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Visual search mappings
vim.keymap.set('v', '*', function()
  local temp = vim.fn.getreg('/')
  vim.cmd('normal! gvy')
  vim.fn.setreg('/', '\\V' .. vim.fn.escape(vim.fn.getreg('"'), '\\'):gsub('\n', '\\\\n'))
  vim.fn.setreg('"', temp)
  vim.cmd('normal! //')
end)

-- RSpec mappings
vim.keymap.set('n', '<Leader>t', ':call RunCurrentSpecFile()<CR>')
vim.keymap.set('n', '<Leader>s', ':call RunNearestSpec()<CR>')
vim.keymap.set('n', '<Leader>l', ':call RunLastSpec()<CR>')
vim.keymap.set('n', '<Leader>A', ':call RunAllSpecs()<CR>')

-- Comment mapping (will work with vim-commentary)
vim.keymap.set('n', '<leader><leader>', '<Plug>CommentaryLine')  -- Comment current line
vim.keymap.set('v', '<leader><leader>', '<Plug>Commentary')      -- Comment selection

-- RuboCop plugin settings
vim.g.vimrubocop_rubocop_cmd = 'bundle exec rubocop '
vim.g.vimrubocop_config = '.rubocop.yml'
vim.g.vimrubocop_keymap = 0
vim.api.nvim_set_keymap('n', '<Leader>r', ':RuboCop<CR>', { noremap = true, silent = true })

-- LSP keybindings
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ca", function()
  vim.lsp.buf.code_action({ context = { only = { "source.fixAll" } }, apply = true })
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true })

-- Python isort shortcut
vim.keymap.set("n", "<leader>i", function()
  vim.cmd("silent !isort " .. vim.fn.shellescape(vim.fn.expand("%")))
  vim.cmd("edit!")
end, { noremap = true, silent = true })

-- Telescope keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>fm", function()
  builtin.lsp_document_symbols({
    symbols = { "Function", "Method" },
  })
end, { noremap = true, silent = true })
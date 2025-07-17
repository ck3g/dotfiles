-- Essential vim functions ported to neovim

-- Promote variable to RSpec let
function PromoteToLet()
  vim.cmd("normal! dd")
  vim.cmd("normal! P")
  vim.cmd("s/\\(\\w\\+\\) = \\(.*\\)$/let(:\\1) { \\2 }/")
  vim.cmd("normal! ==")
end

-- Highlight long lines command
function HighlightLongLines(width)
  local targetWidth = width ~= "" and width or 79
  if targetWidth > 0 then
    vim.cmd("match Todo /\\%" .. (targetWidth + 1) .. "v/")
  else
    print("Usage: HighlightLongLines [natural number]")
  end
end

-- Define commands
vim.api.nvim_create_user_command('PromoteToLet', PromoteToLet, {})
vim.api.nvim_create_user_command('HighlightLongLines', function(opts)
  HighlightLongLines(opts.args)
end, { nargs = '?' })

-- Map promote to let
vim.keymap.set('n', '<leader>p', ':PromoteToLet<CR>')

-- NERDTree replacement with neo-tree
vim.keymap.set('n', '<Leader>p', '<cmd>Neotree toggle<CR>', { silent = true })

-- Buffer explorer replacement with telescope
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<CR>')

-- Notes mapping (if you still use this)
vim.keymap.set('n', '<leader>n', ':sp ~/Dropbox/babbel_notes.txt<CR>')
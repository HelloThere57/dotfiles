local opts = {
	noremap = true,
	silent = true,
}

local bind = vim.keymap.set
local telescope = function() return require("telescope.builtin") end
local nvimtree = function() return require("nvim-tree.api") end

vim.g.mapleader = ' '

-- Vim --

bind('n', '<ESC>', ":noh<cr>", opts)

bind('n', '<leader>x', ":bdelete<cr>", opts)

bind('n', '<C-Left>' ,	'<C-w><Left>',	opts)
bind('n', '<C-Right>',	'<C-w><Right>',	opts)
bind('n', '<C-Up>'   ,	'<C-w><Up>',	opts)
bind('n', '<C-Down>' ,	'<C-w><Down>',	opts)

bind('n', '<leader>r<C-Left>',	':vertical resize -6<cr>', 	opts)
bind('n', '<leader>r<C-Right>',	':vertical resize +6<cr>', 	opts)
bind('n', '<leader>r<C-Up>',	':resize -6<cr>',			opts)
bind('n', '<leader>r<C-Down>',	':resize +6<cr>',			opts)

bind('n', '<leader>r<Left>',	':vertical resize -2<cr>',	opts)
bind('n', '<leader>r<Right>',	':vertical resize +2<cr>',	opts)
bind('n', '<leader>r<Up>',		':resize -2<cr>',			opts)
bind('n', '<leader>r<Down>',	':resize +2<cr>',			opts)

bind('n', '<leader>bn', ':bnext<CR>',		opts)
bind('n', '<leader>br', ':bprevious<CR>',	opts)
bind('n', '<leader>bl', ':buffers<CR>',		opts)

bind('n', '<C-u>', '<C-u>zz0',opts)
bind('n', '<C-d>', '<C-d>zz0',opts)

bind('n', '<leader>df', function()
	vim.diagnostic.open_float()
end, opts)

bind('n', 'u', ':undo<CR>')
bind('n', 'U', ':redo<CR>')

bind('n', '<leader><tab>', function ()
	vim.cmd("set expandtab!")
	vim.cmd("set expandtab?")
end)


-- NvimTree --

bind('n', '<leader>e', function()
	nvimtree().tree.open()
end, opts)


-- Telescope --
bind('n', '<leader>ff', function()
	telescope().find_files()
end, opts)

bind('n', '<leader>fb', function()
	telescope().buffers()
end, opts)

bind('n', '<leader>fw', function()
	telescope().live_grep()
end, opts)

bind('n', '<leader>fh', function()
	telescope().help_tags()
end, opts)

-- NvTerm

bind('n', '<leader>t', function()
	require('nvterm.terminal').toggle("float")
end, opts)

bind('t', '<C-x>', function()
	vim.cmd("stopinsert")
end, opts)



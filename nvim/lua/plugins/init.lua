local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('plugins.config.telescope')
		end,
	},
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('plugins.config.nvim-tree')
		end,
	},
	{
		'rmehri01/onenord.nvim',
		config = function()
			vim.cmd.colorscheme('onenord')
			vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' } )
			vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' } )
		end
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('plugins.config.indent-blankline')
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('plugins.config.treesitter')
		end
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-nvim-lsp',
			'saadparwaiz1/cmp_luasnip',
			'L3MON4D3/LuaSnip',
			'Saecki/crates.nvim',
			'rafamadriz/friendly-snippets',
		},
		config = function()
			require('plugins.config.cmp')
		end,
	},
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		},
		config = function()
			require('plugins.config.lsp')
		end
	},
	{
		'rust-lang/rust.vim',
		config = function()
			vim.g.rustfmt_autosave = true
		end
	},
	{
		'andweeb/presence.nvim',
		config = function()
			require('plugins.config.discord')
		end
	}
})

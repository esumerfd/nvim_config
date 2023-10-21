local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'bogado/file-line'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

-- Sensible default 
Plug 'tpope/vim-sensible'

-- Color schemes
Plug 'sainnhe/edge'

-- LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

-- Code snippets
--Plug 'SirVer/ultisnips'
--Plug 'honza/vim-snippets'

Plug 'mg979/vim-visual-multi'

-- Fuzzy finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- Syntax -- , { do = 'TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

-- Fonts
--Plug 'nvim-tree/nvim-web-devicons'
Plug 'kyazdani42/nvim-web-devicons'

-- File explorer
--Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'glepnir/galaxyline.nvim'

-- Debugging
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'

-- Github integration
--Plug 'pwntester/octo.nvim'

Plug 'mbbill/undotree'

Plug 'nvim-lualine/lualine.nvim'

Plug 'jaredgorski/spacecamp'

Plug 'folke/which-key.nvim'

Plug 'AndrewRadev/sideways.vim'

Plug 'arthurxavierx/vim-caser'

Plug 'matze/vim-move'

-- https://github.com/stevearc/oil.nvim
Plug 'stevearc/oil.nvim'

-- https://github.com/godlygeek/tabular
Plug 'godlygeek/tabular'

-- https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

-- https://github.com/kylechui/nvim-surround
Plug 'kylechui/nvim-surround'

-- https://github.com/m4xshen/autoclose.nvim
Plug 'm4xshen/autoclose.nvim'

vim.call('plug#end')


vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- use 'gruvbox-community/gruvbox'
    use 'ellisonleao/gruvbox.nvim'
    use 'neovim/nvim-lspconfig'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}
    use 'nvim-lua/plenary.nvim'
    use 'psf/black'
    use {
    "danymat/neogen",
    config = function()
        require('neogen').setup {}
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    }
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use 'nvim-telescope/telescope-dap.nvim'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'mfussenegger/nvim-dap-python'
    use {"folke/todo-comments.nvim",requires = "nvim-lua/plenary.nvim"}
    -- Lua
    use 'kyazdani42/nvim-web-devicons'
    use {"folke/trouble.nvim",requires = "kyazdani42/nvim-web-devicons"}
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
end)


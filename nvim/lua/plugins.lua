local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use ('wbthomason/packer.nvim')
  
    
  -- use {
	  -- 'rose-pine/neovim',
	  -- as = 'rose-pine',
      -- config = function()
        -- vim.cmd('colorscheme rose-pine')
      -- end
  -- }

  -- Status line
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- LSP
  use {
      "williamboman/nvim-lsp-installer",
      "neovim/nvim-lspconfig",
  }

  -- Tree-sitter
  use {
      'nvim-treesitter/nvim-treesitter',
      -- run = ':TSUpdate'
  }

  -- fzf native for telescope
  use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make' 
  }

  -- Telescope
  use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  -- Cscope_maps
  use 'dhananjaylatkar/cscope_maps.nvim'

  -- Autocompletion
  use {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip'
    -- 'hrsh7th/cmp-vsnip',
    -- 'hrsh7th/vim-vsnip'
  }
  -- Colorscheme section
  -- use("gruvbox-community/gruvbox")
  use("sainnhe/gruvbox-material")
  use("lewis6991/gitsigns.nvim")
  
  -- Surrounding
  use("echasnovski/mini.surround")

  if packer_bootstrap then
    require('packer').sync()
  end
end)

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use ('wbthomason/packer.nvim')

  -- LSP
  use {
      "williamboman/nvim-lsp-installer",
      "neovim/nvim-lspconfig",
  }

  -- Tree-sitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  -- fzf native for telescope
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Telescope
  use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Autocompletion
  -- Colorscheme section
  -- use("gruvbox-community/gruvbox")
end)

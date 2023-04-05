return require('packer').startup(function(use)
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'wbthomason/packer.nvim'
  use 'w0rp/ale'
end)

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'jmcantrell/vim-virtualenv'
  use 'tpope/vim-surround'
  use 'janko-m/vim-test'
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'tpope/vim-repeat'
  use 'jakobwesthoff/argumentrewrap'
  use 'keith/rspec.vim'
  use 'ekalinin/Dockerfile.vim'
  use 'djoshea/vim-autoread'
  use 'craigemery/vim-autotag'
  use 'mhinz/vim-signify'
  use 'ethanholz/nvim-lastplace'
  use 'cohama/lexima.vim'
  use 'tpope/vim-rhubarb'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'neovim/nvim-lspconfig'
  use 'hoob3rt/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'
  use 'willothy/nvim-cokeline'
  use 'ibhagwan/fzf-lua'
  use 'vijaymarupudi/nvim-fzf'
  use 'RRethy/nvim-treesitter-endwise'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'
  -- use({
  --     "kdheepak/lazygit.nvim",
  --     -- optional for floating window border decoration
  --     requires = {
  --         "nvim-lua/plenary.nvim",
  --     },
  -- })
  use 'sindrets/diffview.nvim'
  use 'almo7aya/openingh.nvim'
  -- use 'yorickpeterse/nvim-pqf'
  use 'rbgrouleff/bclose.vim'
  use 'iberianpig/tig-explorer.vim'
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }
  use({
    "stevearc/quicker.nvim",
    config = function()
      require("quicker").setup()
    end,
  })
 use({
  'SuperBo/fugit2.nvim',
  requires = { { 'MunifTanjim/nui.nvim' }
  },
  })
  -- use {
  --   "Al0den/notion.nvim",
  --   requires = { { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" } }
  -- }
end)

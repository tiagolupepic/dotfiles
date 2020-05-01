" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'
Plugin 'mgee/lightline-bufferline'
Plugin 'NovaDev94/lightline-onedark'
Plugin 'tpope/vim-rails'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'vim-ruby/vim-ruby'
Plugin 'jiangmiao/auto-pairs'
Plugin 'git://github.com/tpope/vim-surround.git'
Plugin 'janko-m/vim-test'
Plugin 'pangloss/vim-javascript'
Plugin 'elixir-editors/vim-elixir'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plugin 'junegunn/fzf.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-repeat'
Plugin 'jakobwesthoff/argumentrewrap'
Plugin 'keith/rspec.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'djoshea/vim-autoread'
Plugin 'craigemery/vim-autotag'
Plugin 'jparise/vim-graphql'
Plugin 'mhinz/vim-signify'
Plugin 'farmergreg/vim-lastplace'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tpope/vim-haml'
Plugin 'rust-lang/rust.vim'
call vundle#end()            " required
filetype plugin indent on    " required
"

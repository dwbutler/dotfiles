" Vundle
" Use vundle for plugin management
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugins
" Tmux
" Disabled this plugin because it broke the C-l mapping to refresh Vim
" Plugin 'christoomey/vim-tmux-navigator'

" For writing
Plugin 'junegunn/goyo.vim'
Plugin 'reedes/vim-pencil'
Plugin 'christoomey/vim-titlecase'

" Session Management
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'

" Status bar
"Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'tpope/vim-endwise'
Plugin 'gabesoft/vim-ags'
Plugin 'tpope/vim-dispatch'

" Language
" JavaScript
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'mxw/vim-jsx'
" CoffeeScript
Plugin 'kchmck/vim-coffee-script'

" Markdown
Plugin 'plasticboy/vim-markdown'
" SASS/SCSS/Less/CSS
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'ap/vim-css-color'
" Haml
Plugin 'tpope/vim-haml'
" Go
Plugin 'fatih/vim-go'
" Mustache
Plugin 'mustache/vim-mustache-handlebars'

" Html
" url based hyperlinks for text files
Plugin 'utl.vim'
" hi-speed html coding
Plugin 'mattn/emmet-vim'

" Ruby/Rails
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-sleuth'
Plugin 'janko-m/vim-test'
" rake integration
Plugin 'tpope/vim-rake'
" A custom text object for selecting ruby blocks (ar/ir)
Plugin 'nelstrom/vim-textobj-rubyblock'
" ruby refactoring
Plugin 'ecomba/vim-ruby-refactoring'
" apidock.com docs integration
Plugin 'apidock.vim'
" toggle ruby blocks style
Plugin 'vim-scripts/blockle.vim'
" i18n extraction plugin
Plugin 'stefanoverna/vim-i18n'

" ale for syntax checking
Plugin 'w0rp/ale'
" editorconfig.org support
Plugin 'editorconfig/editorconfig-vim'

" For productivity
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'greplace.vim'
" visual undo tree
Plugin 'mbbill/undotree'
" switch segments of text with predefined replacements. e.g. '' -> ""
Plugin 'AndrewRadev/switch.vim'

" Fuzzy Search
Plugin 'kien/ctrlp.vim'
Plugin 'junegunn/fzf'

" In-editor file browser
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Maybe try https://github.com/tpope/vim-commentary instead?
Plugin 'scrooloose/nerdcommenter'

Plugin 'altercation/vim-colors-solarized'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Support for user-defined text objects
Plugin 'kana/vim-textobj-user'
" replacement for the repeat mapping (.) to support plugins
Plugin 'tpope/vim-repeat'
" hide .gitignore-d files from vim
Plugin 'vitaly/vim-gitignore'
" repeat motion with <Space>
Plugin 'scrooloose/vim-space'
" Github's gist support
Plugin 'mattn/gist-vim'

" I want to use it but it was buggy, need to figure out what is going on.
"Plugin 'nathanaelkane/vim-indent-guides'

" Not using tagbar because I didn't feel like the tag info was helpful.
"Plugin 'majutsushi/tagbar'

" Sublime like minimap
" Decided against this as it doesn't really help me keep track of my location
" in the file
" Plugin 'severin-lemaignan/vim-minimap'

" Easier movements
Plugin 'easymotion/vim-easymotion'

" Silver Searcher search integration
Plugin 'rking/ag.vim'

call vundle#end()

filetype plugin indent on

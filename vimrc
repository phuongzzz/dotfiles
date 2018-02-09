set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'slim-template/vim-slim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'
Plugin 'mattn/webapi-vim'
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()

"material theme configuration
let g:enable_bold_font = 1
let g:enable_italic_font = 1
set background=dark
colorscheme hybrid_material
"end

"vim airline configuration"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'
"end

"nerdtree settings
map <C-n> :NERDTreeToggle<CR>
"end

"emmet settings"
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.phuong_snip.json')), "\n"))
"end

"jsx settings
let g:jsx_ext_required=0
"end

"displaying
set t_Co=256
set relativenumber
set number
set hlsearch
"end

"tab settings
set expandtab
set tabstop=2
set shiftwidth=2
"end

"indentLine
let g:indentLine_char = '⋮'
map <C-i> :IndentLinesToggle<CR>
"end

if bufwinnr(1)
      map + <C-W>+
      map - <C-W>-
      map < <C-W><
      map > <C-W>>
endif

set omnifunc=syntaxcomplete#Complete
set foldmethod=syntax
filetype plugin indent on 
syntax on

"misc
autocmd VimEnter * echo '>^.^<'
"end


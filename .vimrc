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
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/webapi-vim'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'mhinz/vim-startify'
Plugin 'gregsexton/matchtag'
Plugin 'ayu-theme/ayu-vim'

" All of your Plugins must be added before the following line
call vundle#end()

"material theme configuration
"let g:enable_bold_font=1
"let g:enable_italic_font=1
"set background=dark
"colorscheme hybrid_material
"end

"ayu theme
set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
"end

"Palenight theme
"colorscheme palenight
"let g:palenight_terminal_italics=1
"if (has("nvim"))
"  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"endif
"
""For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
""Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"if (has("termguicolors"))
"  set termguicolors
"endif
"end

"vim airline configuration"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='zenburn'
"end

"nerdtree settings
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '⇢'
let g:NERDTreeDirArrowCollapsible = '⇣'
let g:NERDTreeMouseMode = 3
"end

"ctrlp
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
"end

"emmet settings"
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
autocmd FileType html,css,jsx EmmetInstall
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.phuong_custom.json')), "\n"))
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

if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
  map < <C-W><
  map > <C-W>>
endif

set omnifunc=syntaxcomplete#Complete
set foldmethod=manual
filetype plugin indent on
syntax on
set cursorline
set nobackup
set nowritebackup
set noswapfile
"set mouse=a
set linebreak

"misc
autocmd VimEnter * echo '>^.^<'

" trim trailing whitespaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
"end

"Silver Searcher
"install Silver Searcher first!
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
"end

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <C-f> :Ag<SPACE>
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

"startify
let g:startify_list_order = [
  \ ['   Most recently used files in the current directory:'],
  \ 'dir',
  \ ['   Most recently used files'],
  \ 'files',
  \ ['   Sessions:'],
  \ 'sessions',
  \ ['   Bookmarks:'],
  \ 'bookmarks',
  \ ['   Commands:'],
  \ 'commands',
  \ ]
"end

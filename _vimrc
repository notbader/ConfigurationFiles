" Plug {{{
call plug#begin('$HOME/vim/vimfiles/plugged')
 
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'vim-syntastic/syntastic'
Plug 'fatih/vim-go'

call plug#end()

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" }}}
" Powershell {{{

set shell=powershell
set shellcmdflag=-command

" }}}
" Colors {{{

set t_Co=256   " Sets terminal colors 
colorscheme zenburn 
syntax enable  
set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
set anti enc=utf-8
set guifont=Consolas:h9
" }}}
" Speaces & Tabs {{{

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4
set expandtab       " tabs are spaces
set smartindent

" }}}
" UI Layout {{{

filetype off
filetype indent on
filetype plugin on
set nocompatible              " be iMproved, required
set colorcolumn=110            " Add a colored column to avoid going to far to the right 
set lines=60 columns=240       " To get vim to open with a given size 
set number                     " Add line numbering
set cursorline                 " highlight current line
set wrap linebreak nolist
set lazyredraw                 " redraw only when we need to
set wildmenu                   " visual autocomplete for command menu
set showcmd	  	               " Show (partial) command in status line
set showmatch		           " Show matching brackets
set guioptions-=m              " Menu bar
set guioptions-=T              " Toolbar
set guioptions-=r              " Scrollbar
set tw=80

" }}}
" Searching {{{

set smartcase		       " Do smart case matching
set incsearch		       " Incremental search
set hlsearch                   " Better search
set ignorecase	                " Do case insensitive matching
" Cancel search with escape
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR> 

" }}}
" Folding {{{

set foldenable          " enable folding
set foldmethod=indent   " Fold based on indentation
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldlevel=99

" }}}
" Movement {{{

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Highlight last inserted text
nnoremap gV `[v`]

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" }}}
" Leader Shortcuts {{{

let mapleader=" "     " Set leader key

" Map jk to esc in insert mode
inoremap jk <esc>
nnoremap <leader>u :GundoToggle<CR>

" }}}
" Misc {{{

set autowrite		            " Automatically save before commands like :next and :make
set hidden		                " Hide buffers when they are abandoned
set history=100                 " Keep more info in memory to speed things up 
set encoding=utf-8
set clipboard=unnamed           " Access system clipboard
set modelines=1

" }}}
" Python {{{
au BufNewFile,BufRead *.py
    \ set fileformat=unix
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
let python_highlight_all=1

" }}} 
" NERDTree {{{

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" }}}
" Lightline {{{

set laststatus=2

" }}}
" vim:foldmethod=marker:foldlevel=0

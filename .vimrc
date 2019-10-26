"" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'conradirwin/vim-bracketed-paste'
Plug 'tomasiser/vim-code-dark'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tell-k/vim-autopep8'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'hashivim/vim-terraform'

call plug#end()


" NERDTree
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>


" lightline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
set laststatus=2

" fzf
nnoremap <C-p> :FZF<cr>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" coc
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" vim-code-dark
colorscheme codedark

" vim-go
set autowrite
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
au FileType go nmap <silent> <C-g>r <Plug>(go-run)
au FileType go nmap <silent> <C-g>s <Plug>(go-def-split)
au FileType go nmap <silent> <C-g>v <Plug>(go-def-vertical)
au FileType go nmap <silent> <C-g>t <Plug>(go-test)
au FileType go nmap <silent> <C-g>i <Plug>(go-imports)

" vim-autopep8
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff = 1

" vim-instant-markdown
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 1

" vim-terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1


"" Key Mappings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-c> <Esc>


"" Encoding
" the character encoding used inside Vim
set encoding=utf-8
" the character encoding used in the script
scriptencoding utf-8
" the character encoding for the file of this buffer
set fileencoding=utf-8


"" Backup
" do not make a backup before overwriting a file
set nobackup
" do not make a backup before overwriting a file
set nowritebackup
" do not make a swap file
set noswapfile
" create the undo directory if not exist
if !isdirectory($HOME."/.vim/undo")
  call mkdir($HOME."/.vim/undo")
endif
" directory names for undo files
set undodir=~/.vim/undo
" save undo history
set undofile


"" Whitespace
" copy indent from current line when starting a new line
set autoindent
" do smart autoindenting when starting a new line
set smartindent
" use the appropriate number of spaces to insert a
set expandtab
" number of spaces that a <Tab> in the file counts for
set tabstop=4
" number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>
set softtabstop=4
" the effective value of 'shiftwidth'
set shiftwidth=4


"" Searching
" the case of normal letters is ignored
set ignorecase
" override the 'ignorecase' option if the search pattern contains upper case
" characters
set smartcase
" while typing a search command, show where the pattern, as it was typed so
" far, matches
set incsearch
" searches wrap around the end of the file
set wrapscan
" when there is a previous search pattern, highlight all its matches
set hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR>


"" Appearance
" enable syntax highlighting
syntax enable
" show line number
set number
" set the color of line number
hi LineNr ctermfg=gray
set title
" show the line and column number of the cursor position, separated by a comma
set ruler
" when a bracket is inserted, briefly jump to the matching one
set showmatch
" tenths of a second to show the matching paren, when 'showmatch' is set
set matchtime=1
" show (partial) command in the last line of the screen
set showcmd
hi Normal guibg=NONE ctermbg=NONE
" the maximum number of items to show in the popup menu for Insert mode
" completion
set pumheight=10
set colorcolumn=80


"" Movement
nnoremap j gj
nnoremap k gk


"" Editing
" allow virtual editing in Visual block mode
set virtualedit=block
" the number of screen lines above which a fold can be displayed closed
set foldmethod=indent
set foldlevel=99
nnoremap <space> za


"" Command line
" enable enhanced command-line completion
set wildmenu

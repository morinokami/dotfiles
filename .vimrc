"" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'conradirwin/vim-bracketed-paste'
Plug 'tomasiser/vim-code-dark'
Plug 'psf/black'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-goimports'
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'hashivim/vim-terraform'
Plug 'ryanolsonx/vim-lsp-typescript'

call plug#end()


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

" vim-code-dark
colorscheme codedark

" black
let g:black_linelength = 80
autocmd BufWritePre *.py execute ':Black'

" vim-lsp
" Installing python server:
" $ pip install python-language-server
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
" Installing go server:
" $ go get -u golang.org/x/tools/gopls
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
endfunction

let g:lsp_signs_enabled = 1           " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

" asyncomplete.vim
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" vim-instant-markdown
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

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

autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2
autocmd FileType less setlocal ts=2 sts=2 sw=2
autocmd FileType scss setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2


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
" influence the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert
set backspace=indent,eol,start


"" Command line
" enable enhanced command-line completion
set wildmenu

set nocompatible
set history=1000
set modelines=0
set noexpandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
" set relativenumber
set undofile
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" latex-vim no three letter expansion
let g:Tex_SectionMaps = "0"
let g:Tex_ViewRule_pdf = "evince 2>/dev/null"
syntax on
set mouse=a
set background=dark
if has("gui_running")
colorscheme torte
endif
noremap ö l
noremap l k
noremap k j
noremap j h

" disable folding
let g:Tex_AutoFolding = 0

filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
let g:Tex_CompileRule_pdf = 'latexmk -interaction=nonstopmode -pdf $*'
let g:Tex_DefaultTargetFormat = 'pdf'
set iskeyword+=:

set paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
" already set at the top but doesn't seem to work, maybe works at this position?
set ruler

" show tsv in columns
autocmd BufEnter *.tsv setlocal ts=20 sts=20 sw=20
"  number noexpandtab

" detect .md as markdown syntax in vim
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
let g:vim_markdown_folding_disabled = 1

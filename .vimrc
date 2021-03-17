call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'plasticboy/vim-markdown'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
Plug 'aklt/plantuml-syntax'
Plug 'arcticicestudio/nord-vim'
Plug 'hashivim/vim-terraform'
Plug 'wsdjeg/vim-http'
Plug 'junegunn/gv.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
au BufRead /tmp/mutt-* set tw=72 " for mutt

" autocmd FileType qf nnoremap <buffer><silent> <esc> :quit<cr>
autocmd Filetype html setlocal ts=2 sw=2 sts=0
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0
autocmd! bufwritepost .vimrc source % " autosource the vimrc when it changes

" cnoreabbrev Ack Ack!

" set termguicolors
" syntax on
syntax enable
set t_Co=256 " enable colours
colorscheme nord

let g:lightline = {
    \ 'colorscheme': 'nord',
\ }
" let g:airline_powerline_fonts = 1

command! Maketags !ctags -R

filetype plugin indent on

hi Normal ctermbg=none
" hi StatusLine ctermbg=darkgrey ctermfg=black
highlight ColorColumn ctermbg=0
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterChangeDelete ctermfg=4
highlight GitGutterDelete ctermfg=1
highlight NonText ctermbg=none " Fix wrapline colour
highlight clear SignColumn


let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:ack_use_cword_for_empty_search = 1
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case --ignore-file ~/.gitignore_global'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_working_path_mode = 'rw'
let g:gitgutter_override_sign_column_highlight = 0
let g:vim_markdown_folding_disabled = 1
let mapleader=","

map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <leader>S z=
map <leader>c <c-_><c-_> " T-Comment Shortcut
map <leader>d :r!date<cr>
map <leader>e :UltiSnipsEdit<cr>
map <leader>h :split<cr>
map <leader>n :NERDTreeToggle<cr>
map <leader>t :TlistToggle<cr>
map <leader>v :vsplit<cr>
map <leader>y "+y
nmap <C-m> <Plug>MarkdownPreviewToggle
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nnoremap  :set nonumber!:set foldcolumn=0

nnoremap <C-f> :Rg<cr>
nnoremap <leader>b :Buffers<cr>

nnoremap <leader>1 :b1<cr>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>s :setlocal spell! spelllang=en_us<cr>
nnoremap <leader>w <C-w>v<C-w>l
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" set cursorline
set ai
set autoread
" set background=dark
set bs=2
set backspace=indent,eol,start
set cmdheight=1 " Give more space for displaying messages.
set colorcolumn=80
set completeopt=longest,menuone
set encoding=utf-8
set expandtab
set go-=L
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2 " Always show the status line
set lazyredraw
set mouse=
set nobackup
set noerrorbells
set noswapfile
set nowrap
set nowritebackup
set number
set pastetoggle=<leader>p " toggle paste mode  (turns off auto indent)
set ruler
set runtimepath^=~/.vim/bundle/ctrlp.vim
set shiftround
set shiftwidth=4
set shortmess+=c " Don't pass messages to |ins-completion-menu|.
set showmode
set smartcase
set softtabstop=4
set splitright
set ts=4
set tw=80
set undodir=$HOME/.vim/undo " where to save undo histories
set undofile                " Save undos after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set updatetime=100
set visualbell
set wildignore+=*/vendor/**,*/node_modules/**,*.pyc,*venv/**


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=no
endif

" figure out the color group under the cursor
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set laststatus=2 
" set statusline=
"
" set statusline+=%n\ 
" set statusline+=%f
" set statusline+=%m 
" set statusline+=%r
"
" set statusline+=%=
" set statusline+=%-14.(%l,%c%V%)\ %P
" set statusline+=%l,%c%V
" set statusline+=%P

" set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P " default 

let g:conflict_marker_enable_highlight = 1

set grepprg=rg\ --vimgrep\ --smart-case\ --follow
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = []

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


let g:vim_http_split_vertically = 1
let g:conceallevel=0
" set noshowmode
"
"
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --follow --fixed-strings --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

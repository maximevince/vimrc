set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"
" VUNDLE PLUGINS "
"

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'            " Lean & mean status/tabline for vim that's light as air
Plugin 'majutsushi/tagbar'                  " Vim plugin that displays tags in a window, ordered by scope
Plugin 'ctrlpvim/ctrlp.vim'                 " Fuzzy file, buffer, mru, tag, etc finder. 
Plugin 'ludovicchabant/vim-gutentags'       " A Vim plugin that manages your tag files
Plugin 'Valloric/YouCompleteMe'             " A code-completion engine for Vim
Plugin 'JamshedVesuna/vim-markdown-preview' " A light Vim plugin for previewing markdown files in a browser - without having to leave Vim.
Plugin 'w0rp/ale'                           " Asynchronous Lint Engine
Plugin 'brookhong/cscope.vim'               " A vim plugin to help you to create/update cscope database and connect to existing proper database automatically.
"Plugin 'tpope/vim-fugitive'                " a Git wrapper so awesome, it should be illegal

" All of your Plugins must be added before the following line
call vundle#end()            " required

"
" OTHER VIM OPTIONS "
"

set hidden " Hide buffers, instead of closing, so that we do not have to save all the time
set tabstop=4
set smartindent
set shiftwidth=4
set expandtab
syntax on
color mustang
set background=dark
set showcmd
set ignorecase
set smartcase
set autoindent
set ruler
set laststatus=2
set visualbell
set number
set nocompatible
set t_Co=256
set mouse=a
set hlsearch
set incsearch
set expandtab
set cscopetag

filetype plugin indent on     " required
filetype plugin on

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=80 columns=100
endif

map <C-e> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
map <C-p> :CtrlP<CR>

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
nnoremap <C-F1> 1gt
nnoremap <C-F2> 2gt
nnoremap <C-F3> 3gt
nnoremap <C-F4> 4gt
nnoremap <C-F5> 5gt
nnoremap <C-F6> 6gt
nnoremap <C-F7> 7gt
nnoremap <C-F8> 8gt
nnoremap <C-F9> 9gt
nnoremap <C-F0> 10gt

" CScope bindings
" a: Find Interfactive
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>

" F2/F3 for previous/next compiler error/warning
map	<F2>	:cprev<CR> 
map	<F3>	:cnext<CR> 

" F9 toggles wrapping
nnoremap <F9> :set wrap!<CR>

set tags=./tags;/

" For vim-markdown-preview
let vim_markdown_preview_use_xdg_open=1

" Fix for weird background redraw issues when scrolling
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

"
" YouCompleteMe options
"

let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
"let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

let g:ycm_complete_in_strings = 1 "default 1
"let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '/usr/bin/python3' "default ''

let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info

"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 0

let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

nnoremap <F7> :YcmForceCompileAndDiagnostics <CR>


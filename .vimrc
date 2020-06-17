set nocompatible
filetype off

" set the runtime path to include vim-plug and initialize
call plug#begin('~/.vim/plugged')

"
" VIM-PLUG PLUGINS "
"
Plug 'vim-airline/vim-airline'            " Lean & mean status/tabline for vim that's light as air
Plug 'majutsushi/tagbar'                  " Vim plugin that displays tags in a window, ordered by scope
Plug 'ctrlpvim/ctrlp.vim'                 " Fuzzy file, buffer, mru, tag, etc finder. 
Plug 'ludovicchabant/vim-gutentags'       " A Vim plugin that manages your tag files
Plug 'JamshedVesuna/vim-markdown-preview' " A light Vim plugin for previewing markdown files in a browser - without having to leave Vim.
Plug 'brookhong/cscope.vim'               " A vim plugin to help you to create/update cscope database and connect to existing proper database automatically.
Plug 'tpope/vim-fugitive'                 " a Git wrapper so awesome, it should be illegal
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine for vim8 & neovim, full language server protocol support as VSCode 
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
"Plug 'chriskempson/base16-vim'            " Base16 for Vim https://github.com/chriskempson/base16
"Plug 'Valloric/YouCompleteMe'             " A code-completion engine for Vim
"Plug 'w0rp/ale'                           " Asynchronous Lint Engine

if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" All of your Plugins must be added before the following line
call plug#end()            " required

"
" OTHER VIM OPTIONS "
"

set hidden " Hide buffers, instead of closing, so that we do not have to save all the time
set tabstop=4
set smartindent
set shiftwidth=4
set expandtab
syntax on
"color mustang
colorscheme PaperColor
"set termguicolors
let ayucolor="light"  " for light version of theme
let g:airline_theme='ayu'
let g:airline_powerline_fonts = 1
set background=light
set showcmd
set ignorecase
set smartcase
set autoindent
set ruler
set laststatus=2
set novisualbell
set number
set nocompatible
set t_Co=256
set mouse=a
set hlsearch
set incsearch
set cscopetag
set cst
set csto=1

filetype plugin indent on     " required
filetype plugin on

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=80 columns=100
endif

" F2/F3 for previous/next compiler error/warning
map	<F2>	  :cprev<CR> 
map	<F3>	  :cnext<CR> 
nnoremap <F7> :YcmForceCompileAndDiagnostics <CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <F9> :set wrap!<CR>
map <C-p> :CtrlP<CR>

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

set tags=./tags;/

" For vim-markdown-preview
let vim_markdown_preview_use_xdg_open=1
let vim_markdown_preview_github=1

" Fix for weird background redraw issues when scrolling
if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif

" for SNT2 builds
let $FORCE_COLOR = 0

" show whitespace errors for C files
" set filetype?
let c_space_errors = 1
let g:cscope_silent = 1


"To make <cr> select the first completion item and confirm completion when no item have selected:
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" if you want to disable auto detect, comment out those two lines
"let g:airline#extensions#disable_rtp_load = 1
"let g:airline_extensions = ['branch', 'hunks', 'coc']

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" make tmux and vim speak the same language
if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
else
    if $TERM == 'xterm'
        set term=xterm-256color
    endif
endif

" CtrlP option such that .git submodules are also parsed
"let g:ctrlp_root_markers=['.ctrlp_root']
"let g:ctrlp_user_command='git ls-files --recurse-submodules'
" smarter ctrlp_user_command that will also index submodules
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard && git submodule foreach "git ls-files -co --exclude-standard | while read i; do echo \"\$path/\$i\"; done"']


" Have Vimdiff ignore whitespace changes
if &diff
    " diff mode
    set diffopt+=iwhite
endif





"
" COC VIM OPTIONS "

"" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>




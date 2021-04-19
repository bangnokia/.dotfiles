call plug#begin()

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'wakatime/vim-wakatime'
"Plug 'scrooloose/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'vim-test/vim-test'
Plug '907th/vim-auto-save'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'simeji/winresizer'
Plug 'jwalton512/vim-blade'
Plug 'alvan/vim-closetag'
"Plug 'camspiers/animate.vim'
"Plug 'camspiers/lens.vim'

call plug#end()

"---- Color scheme
autocmd vimenter * ++nested colorscheme gruvbox
autocmd ColorScheme * highlight! link SignColumn LineNr

"---- UI
filetype plugin indent on
set ic
set noswapfile
set tabstop=4 shiftwidth=4 expandtab
set splitright
set cursorline
set ignorecase
set mouse=a
set noswapfile
"set nu
set backupcopy=yes
set splitright
set splitbelow
set nofoldenable
set foldmethod=indent
"set wrap linebreak nolist
set nowrap

nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

autocmd TermOpen * startinsert
autocmd BufWritePre *.php %s/\s\+$//e

"---- Shortcut
let mapleader = ','
nmap <Leader>env :tabedit ~/.config/nvim/init.vim<cr>
nmap <Leader>s /function 
nmap <Leader>q :q<cr>
nmap <Leader>w :w<cr>
nmap <silent> gn :tabnext<cr>
nmap <silent> gp :tabprevious<cr>

" open terminal in vsplit
nmap <Leader>av :vsplit term://zsh<cr>
" open terminal in split
nmap <Leader>ah :split term://zsh<cr>

" Auto save
let g:auto_save = 1
let g:auto_save_events = ['BufLeave', 'FocusLost', 'InsertLeave']

" Easy resize window
let g:winresizer_start_key = '<C-L>'

"---- Laravel shortcut
nmap <Leader>lr :e routes/web.php<cr>
nmap <Leader>lra :e routes/api.php<cr>
nmap <Leader>lck :e app/Console/Kernel.php<cr>

"---- Test shortcut
nmap <C-Shift-n> :TestNearest<cr>
nmap <Leader>t :TestLast<cr>

let test#strategy = "basic"
let test#neovim#term_position = "topleft"
let test#neovim#term_position = "vert"
let test#neovim#term_position = "vert botright 30"

"---- Rust shortcuts
nmap <Leader>rr :w<cr> :!cargo run<cr>
nmap <Leader>rb :w<cr> :!cargo build<cr>
nmap <Leader>rt :w<cr> :!cargo test<cr>


"---- NERDTree
map <C-n> :NERDTreeToggle<CR>
map <C-r> :NERDTreeFind<cr>
let NERDTreeShowHidden = 1

"---- coc.vim
set hidden
set nobackup
set updatetime=100
set signcolumn=yes

inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
vmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

"---- NERDCommenter
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
map <Leader>c <plug>NERDCommenterToggle<CR>

"---- FZF
map <C-p> :Files<cr>
map <C-e> :Buffers<cr>
map <C-i> :BLines<cr>
nmap <Leader>f :Rg
let g:fzf_preview_window = ['right:50%:hidden', 'ctrl-/']
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = {
    \ 'window': {
        \'width': 0.5,
        \'height': 0.6,
        \'highlight': 'Keyword'
    \ }
\ }
command! -bang -nargs=? -complete=dir BLines
    \ call fzf#vim#buffer_lines(<q-args>, {'options': ['--layout=reverse']}, <bang>0)

"---- close tag
let g:closetag_filenames = '*.html,*.blade.php'
let g:closetag_filetypes = 'html,php'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'

" len.vim
let g:lens#width_resize_max = 120
let g:lens#disabled_filetypes = ['nerdtree', 'fzf']
let g:lens#animate = 1

"---- Auto source init.vim
autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim


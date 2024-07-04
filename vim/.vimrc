autocmd VimResized * wincmd =

set relativenumber
set number
set colorcolumn=80
set wildmenu
set ts=4 sw=4
set shiftwidth=4
set softtabstop=4
set ignorecase
set nowrap
set encoding=UTF-8
set cursorline
highlight CursorLine ctermbg=132

let mapleader = " " " map leader to Space

nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>to :tabnew<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tx :tabn<CR>
nnoremap <leader>tc :tabc<CR>
nnoremap <leader>nh :nohl<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fs :Rg<CR>
nnoremap <leader>sh :sv<CR>:wincmd j<CR>
nnoremap <leader>sv :vs<CR>:wincmd l<CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gg :Git<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gc :Git commit<CR>

" Clipboard
set clipboard+=unnamed  " use the clipboards of vim and win
"set paste               " Paste from a windows or from vim
set go+=a               " Visual selection automatically copied to the clipboard

call plug#begin()
" UI
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntax Highlight
Plug 'TysonAndre/php-vim-syntax'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'StanAngeloff/php.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" File Handling
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Theme
Plug 'liuchengxu/space-vim-dark'
Plug 'sainnhe/everforest'
Plug 'SWilson4/valerie'
Plug 'Melon-Bread/10grans-vim'
Plug 'vim-airline/vim-airline'
Plug 'romainl/Disciple'
Plug 'safv12/andromeda.vim'
Plug 'vim-scripts/ashen.vim'
Plug 'rayes0/blossom.vim'
Plug 'sonjapeterson/1989.vim'
call plug#end()

" Theme Selection
colorscheme space-vim-dark
colorscheme everforest


let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

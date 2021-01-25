filetype plugin indent on

call plug#begin('~/.config/nvim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

syntax on

set number
set wrap
set linebreak
set backspace=2
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab
set smartindent
set scrolloff=5
set laststatus=2
set noswapfile
set nobackup
set nowritebackup
set ignorecase
set smartcase
set hlsearch
set incsearch

colorscheme gruvbox
set background=dark

let mapleader = ' '

" Run macros easier
" I usually record them in the q register
:nnoremap , @q
" Sometimes I record more but the @ is far away
:nnoremap ' @

" Unhighlight previous search
nnoremap <ESC> :noh<RETURN><ESC>

" Deoplete movement within 'ins-completion-menu'
imap <expr><C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Move lines up and down
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Intuitive movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Make a 3-way toggle between no line numbers, absolute, and relative:
 function! NumberToggle()
   if(&rnu == 0 && &nu == 0)
     set nu
   elseif(&nu == 1)
     set nonu
     set rnu
   else
     set nornu
   endif
endfunc
nnoremap <C-n> :call NumberToggle()<CR>

" window navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>p :wincmd p<CR>

" Tab between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>

" Switch tabs
nmap <leader>t :tabnew<CR>
nmap <S-l> :tabnext<CR>
nmap <S-h> :tabprevious<CR>

"Move tabs around
noremap <leader><Left> :tabmove -1<CR>
noremap <leader><Right> :tabmove +1<CR>

nnoremap <leader>ff :Neoformat<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1

" CtrlP
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
set wildignore+=node_modules

" NERDTree
let g:NERDTreeWinSize = 40
let g:NERDTreeShowHidden = 1
map <C-t> :NERDTreeToggle<CR>
map <leader>o :NERDTreeFocus<CR>

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Open NERDTree if vim opened with no arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Close Vim if NERDTree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" ALE
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'jsx': ['prettier', 'eslint'], 'markdown': ['prettier']}
let g:ale_fix_on_save = 1

" Open and source Neovim config from inside Neovim
command! Config :e ~/.config/nvim/init.vim
command! Source :source ~/.config/nvim/init.vim

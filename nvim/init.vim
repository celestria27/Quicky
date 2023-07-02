call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
call plug#end()

let g:fzf_layout = { 'down':  '40%'}
lua require('init')

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-n> :set rnu!<CR>
nnoremap <C-p> :Files<CR>

let NERDTreeShowHidden=1

set nu
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

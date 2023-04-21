let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'Mofiqul/dracula.nvim'
Plug 'Pocco81/auto-save.nvim'

call plug#end()

lua << EOF
require("auto-save").setup {}

-- Alt+[hjkl] to navigate through splits in terminal mode

EOF

tnoremap ([[<M-'>]], [[<C-\><C-n>:tabn<Cr>]], silent, "Tabs: goto next")
tnoremap ([[<M-;>]], [[<C-\><C-n>:tabp<Cr>]], silent, "Tabs: goto prev")

tnoremap ([[<M-h>]], [[<C-\><C-n><C-w>h]])
tnoremap ([[<M-j>]], [[<C-\><C-n><C-w>j]])
tnoremap ([[<M-k>]], [[<C-\><C-n><C-w>k]])
tnoremap ([[<M-l>]], [[<C-\><C-n><C-w>l]])

" https://stackoverflow.com/questions/51995128/setting-autoindentation-to-spaces-in-neovim
set tabstop=4
set softtabstop=-1
set shiftwidth=0
set shiftround
set expandtab

set nowrap
NERDTreeToggle
NERDTreeFocus
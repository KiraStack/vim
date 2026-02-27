" Copyright (c) 2026, Kira
" Licensed under the MIT License

" Install vim-plug (if missing)
" Run this in your shell before opening Vim:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Plugin Manager (vim-plug)
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'       " File tree explorer
Plug 'junegunn/fzf'             " Fuzzy finder engine
Plug 'junegunn/fzf.vim'         " Vim integration for fzf
Plug 'tpope/vim-fugitive'       " Git commands
Plug 'airblade/vim-gitgutter'   " Show git changes in the gutter
Plug 'SirVer/ultisnips'         " Snippet engine
Plug 'honza/vim-snippets'       " Predefined snippets for multiple languages
Plug 'ervandew/supertab'        " Tab-based completion
Plug 'sheerun/vim-polyglot'     " Syntax and indentation for many languages
Plug 'tpope/vim-surround'       " Easily modify surrounding characters
Plug 'tpope/vim-commentary'     " Quickly comment/uncomment code
Plug 'ghifarit53/tokyonight-vim' " Color scheme
Plug 'Stoozy/vimcord'            " Discord Rich Presence (deprecated)

call plug#end()

" Globals
let mapleader = " "                " Space as leader
let maplocalleader = " "           " Space as local leader

" Tokyo night
let g:tokyonight_style = 'night'    " options: night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 1
let g:tokyonight_disable_italic_comment = 0
let g:tokyonight_menu_selection_background = 'green'

" Options
set termguicolors               " Enable true color support
set background=dark             " Dark background
set clipboard=unnamedplus       " Use system clipboard
colorscheme tokyonight          " Apply the colorscheme
set cursorline                  " Highlight current line
set list                        " Show special characters for tabs, trailing spaces, and non-breaking spaces
set listchars=tab:>\ ,trail:·,nbsp:␣
set fillchars=eob:\             " Hide characters at the end of buffer
set mouse=a                     " Enable mouse support
set number                      " Show line numbers
" set relativenumber            " Show relative line numbers
set ruler                       " Show cursor position
set scrolloff=8                 " Vertical offset from screen edge
set sidescrolloff=8             " Horizontal offset from screen edge
set showmatch                   " Highlight matching brackets

" Disable arrow keys in normal mode
nnoremap <Up> :echo "Use `k` instead of ↑"<CR>
nnoremap <Down> :echo "Use `j` instead of ↓"<CR>
nnoremap <Left> :echo "Use `h` instead of ←"<CR>
nnoremap <Right> :echo "Use `l` instead of →"<CR>

" Move between splits
" <C-w>h   Move to the split on the left
" <C-w>l   Move to the split on the right
" <C-w>j   Move to the split below
" <C-w>k   Move to the split above

" Toggle file tree
nnoremap <leader>n :NERDTreeToggle<CR>

" Search files, buffers, git files
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>g :GFiles<CR>

" Git commands
nnoremap <leader>gs :Git<CR>   " Deprecated, use :Gstatus in fugitive
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log<CR>

" Comments (`vim-commentary`)
" Functions by default with `gc`, so no need to remap

" Snippets
" Use <Tab> to expand snippets in insert mode via UltiSnips
imap <expr> <Tab> pumvisible() ? "\<C-n>" : "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>"
smap <expr> <Tab> UltiSnips#JumpForwards()
smap <expr> <S-Tab> UltiSnips#JumpBackwards()

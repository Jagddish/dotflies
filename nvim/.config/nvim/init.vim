imap jj <esc>
set path+=**
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set smarttab
set nocompatible
set expandtab
set autoindent
set encoding=UTF-8
set mouse=a
set hidden "for teminal
set termguicolors
set t_Co=256
set noswapfile
set scrolloff=8
set background=dark
set updatetime=300
set backspace=indent,eol,start
set nobackup     "no auto backup
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
set fillchars+=vert:\    " this removes line between splits
" Better search
set hlsearch
set incsearch

" Ingore case in search
set ignorecase
set smartcase

" Automatically :write before running commands
" set autowrite

" Don't wrap lines
set wrap

" Wrap lines at convenient points
set linebreak

" Show line breaks
" set showbreak=↳
let &showbreak='↳ '


syntax enable
set splitbelow "splitright    "open new splits below if horizontal and right if vertical

" Exit vim close vim
map Q  <C-W>q
nnoremap <C-q> :q <CR>



let g:ale_disable_lsp = 1
call plug#begin('~/.config/nvim/plugged')
" Plug 'preservim/tagbar'  			"Tagbar for code navigation
" Plug 'SirVer/ultisnips' 			"Snippets
" Plug 'honza/vim-snippets'
Plug 'L3MON4D3/LuaSnip'
Plug 'tpope/vim-surround' 			"Use ysw [,
" Plug 'psf/black', { 'branch': 'stable' } "Black formatter
Plug 'preservim/nerdtree' 			" NerdTree
Plug 'tpope/vim-commentary' 		" For Commenting gcc & gc
Plug 'vim-airline/vim-airline' 		" Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons' 		" Developer Icons
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto Completion
Plug 'akinsho/toggleterm.nvim' 		"Terminal
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-fugitive' 			"Git
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'                           " Distraction-free viewing
Plug 'ayu-theme/ayu-vim'
" Telescope
Plug 'nvim-lua/plenary.nvim' 		"Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'BurntSushi/ripgrep'       "Telescope
Plug 'sharkdp/fd'               "Telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'dense-analysis/ale'           "Ale
Plug 'EdenEast/nightfox.nvim' 		"Colorscheme
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'patstockwell/vim-monokai-tasty' "Colorscheme
Plug 'morhetz/gruvbox'
call plug#end()
"----------------------------------------------------------------------
lua << EOF
require('telescope').setup{defaults = { file_ignore_patterns = {".npm",".local",".oh-my-zsh",".tmux",".viminfo",".yarn","Public","Pictures","Library","Applications","Books","Obsidian"}},extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
  }
-- require('telescope').load_extension('fzy_native')
require('telescope').load_extension('fzf')

---terminal
require"toggleterm".setup {
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = false,
  shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
      \ }

require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

EOF



"--------Colorschemes

let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"
colorscheme ayu

"----------******--------
" colorscheme duskfox
" colorscheme nightfox
" colorscheme vim-monokai-tasty
" let g:airline_theme='monokai_tasty'
"
"hard , medium , soft
" let g:gruvbox_contrast_dark = 'medium'
" colorscheme gruvbox

" below line code makes vim transparent
" hi Normal guibg=NONE ctermbg=NONE

" If u want to use toggle for transparent use below code
" let t:is_transparent = 0
" function! Toggle_transparent()
"     if t:is_transparent == 0
"         hi Normal guibg=NONE ctermbg=NONE
"         let t:is_transparent = 1
"     else
"         set background=dark
"         let t:is_transparent = 0
"     endif
" endfunction
" nnoremap <C-t> : call Toggle_transparent()<CR>

"--------------------------------***********-------------

" Mapping or remaps

let mapleader = " " "space

"Keyboard shortcuts
" nmap <leader>mi :vsplit ~/.config/nvim/hotkeys<cr>
nmap <leader>k :vsplit ~/.config/nvim/init.vim<cr>

nnoremap ; :
vnoremap ; :
nmap <leader>[ ysiw

"So I can move around in insert
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

" Quick jumping between splits
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K
" C-w + = to resize all splits

" vv - Makes vertical split
map vv <C-W>v
" ss - Makes horizontal split
map ss <C-W>s
"

nnoremap <leader><leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader><CR> :up <CR>
nnoremap <C-o> :Goyo <CR>
" let g:goyo_width = 90
let g:goyo_height = 90


"Automagically resize splits when the host is resized
autocmd VimResized * wincmd =

"Make backspace delete in normal
nnoremap <BS>    <BS>x
xnoremap <BS>    x


"Make visual selection more visible
hi visual term=reverse cterm=reverse guibg=darkGray

" Telescope
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').find_files({hidden = true})<cr>
" nnoremap <leader>fs <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

" map <Leader>th <C-w>t<C-w>H
" map <Leader>tk <C-w>t<C-w>K




"Tagbar
" nnoremap <C-[> :TagbarToggle<CR>


"NerdTree maps

"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
let NerdTreeQuitOnOpen=1
let g:NERDTreeShowHidden = 1
let NERDTreeStatusLine='NERDTree'
let g:NerdTreeMinimalUI=1


"nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p


"Snippets
"The b is the option for when to trigger completion:
" b only triggers if the keyword is at the start of the line.
" i trigers it inline
" A triggers automatically
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="<c-i>"
let g:UltiSnipsExpandTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-u>"
nnoremap <leader>mk :UltiSnipsEdit<CR>



let g:python3_host_prog = expand('/Library/Frameworks/Python.framework/Versions/3.10/bin/python3')
let g:python_highlight_all = 1

"airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#fnamemode=':t'

" Buffers
nnoremap <leader>1 :bp<CR>
nnoremap <leader>2 :bn<CR>
nnoremap <leader>e :bd<CR>

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

  " powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ':'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '|'
let g:airline_symbols.maxlinenr = '|'
let g:airline_theme='lucius'

let g:ale_sign_error = '>>'
let g:ale_linters = {'python':['flake8']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'],'python': ['black','isort']}
let g:ale_fix_on_save = 1

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" --------------coc.vim------------------------
 " inoremap <silent><expr> <TAB>
 "       \ pumvisible() ? "\<C-n>" :
 "       \ <SID>check_back_space() ? "\<TAB>" :
 "       \ coc#refresh()
 " inoremap <expr><C-S> pumvisible() ? "\<C-p>" : "\<C-h>"

 " function! s:check_back_space() abort
 "   let col = col('.') - 1
 "   return !col || getline('.')[col - 1]  =~# '\s'
 " endfunction
" --------------coc.vim----------------------------

" VIM and Python – A Match Made in Heaven
" https://realpython.com/vim-and-python-a-match-made-in-heaven/
" https://github.com/yangyangwithgnu/use_vim_as_ide
" https://github.com/jarolrod/vim-python-ide

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Add all your plugins here
"-------------------=== Code/Project navigation ===-------------
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'          " NerdTree git functionality
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'                    " Class/module browser
Plug 'vim-scripts/taglist.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'          " Tabs/Buffers/Fuzzy/Workspaces/Bookmarks
Plug 'vim-airline/vim-airline'              " Lean & mean status/tabline for vim
Plug 'vim-airline/vim-airline-themes'       " Themes for airline
"Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plug 'fholgado/minibufexpl.vim'             " Buffer tab management
"Plug 'MattesGroeger/vim-bookmarks'          " Bookmarks
Plug 'thaerkh/vim-indentguides'             " Visual representation of indents
Plug 'tmhedberg/SimpylFold'
Plug 'dense-analysis/ale'                   " Asynchronous Lint Engine
"Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
"-------------------=== Other ===-------------------------------
Plug 'flazz/vim-colorschemes'               " Colorschemes
Plug 'tpope/vim-surround'                   " Parentheses, brackets, quotes, XML tags, and more
Plug 'vimwiki/vimwiki'                      " Personal Wiki
Plug 'luochen1990/rainbow'
Plug 'ryanoasis/vim-devicons'               " Dev Icons
Plug 'mhinz/vim-startify'                   " Vim Start Page
Plug 'tpope/vim-fugitive'                   " Git integration
Plug 'dhruvasagar/vim-table-mode'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'                    " Text filtering and alignment
"Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-plug'                    " Vim plugin manager
Plug 'jceb/vim-orgmode'
Plug 'mbbill/undotree'
Plug 'tpope/vim-speeddating'
Plug 'mattn/calendar-vim'
Plug 'vim-scripts/VimIM'
"-------------------=== Snippets support ===--------------------
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"-------------------=== Languages support ===-------------------
Plug 'preservim/nerdcommenter'
Plug 'vim-syntastic/syntastic'              " Syntax Checking/Highlighting
"-------------------=== Python  ===-----------------------------
Plug 'davidhalter/jedi-vim'                 " Python autocompletion
Plug 'vim-scripts/indentpython.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'nvie/vim-flake8'                      " PEP 8 checking

" All of your Plugins must be added before the following line
call plug#end()

"=====================================================
"" General settings
"=====================================================
set nocompatible
set encoding=utf-8
set t_Co=256                                " 256 colors
syntax enable                               " enable syntax highlighting
filetype on
filetype indent on
filetype plugin on

set shell=/bin/zsh
set number                                  " show line numbers
set ttyfast                                 " terminal acceleration
set ruler
set cursorline
"set cursorcolumn
set showmatch                               " shows matching part of bracket pairs (), [], {}
"set noswapfile                              " no swap files
"set nobackup                                " no backup files
"set scrolloff=10                            " let 10 lines before/after cursor during scroll
nnoremap <F4> :set relativenumber!<CR>
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
"set textwidth=80
set ignorecase
set smartcase
"set autochdir                               " change dir to current open file

" built-in cool features
set wildmenu                                " visual autocomplete for command menu
set path+=**                                " search through all the sub-dirs

" use System Clipboard
set clipboard=unnamed
vnoremap <Leader>y "+y
nmap <Leader>p "+p

" change leader
"let mapleader = ","
"let mapleader = "\<Space>"

" split setup
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
autocmd FileType c setlocal foldmethod=syntax
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
nnoremap @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')
" see the docstrings for folded code
let g:SimpylFold_docstring_preview=1

" Flagging unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
set undofile
set showcmd
set relativenumber

set tags=tags;
"=====================================================
"" testing Settings
"=====================================================
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"=====================================================
"" Tabs / Buffers settings
"=====================================================
"tab sball
set showtabline=0
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

" Required by CtrlSpace
set hidden

"=====================================================
"" Search settings
"=====================================================
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

"=====================================================
"" GUI Settings
"=====================================================
"set guifont=Monospace\ 11
"set guifont=mononoki\ Nerd\ Font\ 11
set guifont=DejaVuSansMono\ Nerd\ Font\ Mono\ 11
"set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 11
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has('gui_running')
  set background=dark
  "colo desert256v2
  "colorscheme badwolf
  "colorscheme wombat256mod
  "colorscheme molokai
  "colorscheme eclipse   " bright mode
  colorscheme lizard256
else
  colorscheme desert
endif

" by default, hide gui menus
set guioptions=i

" start gvim in max size
augroup maximizewindow
    autocmd!
    autocmd VimEnter * call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)
augroup END

function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction

map <F11> <Esc>:call ToggleGUICruft()<cr>

"=====================================================
"" save&restore session Settings
"=====================================================
" 设置环境保存项
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存快捷键
map <leader>ss :mksession! ~/.vim/.my.vim<cr> :wviminfo! ~/.vim/.my.viminfo<cr>
" 恢复快捷键
map <leader>rs :source ~/.vim/.my.vim<cr> :rviminfo ~/.vim/.my.viminfo<cr>

"=====================================================
"" Python Settings
"=====================================================
" PEP 8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4     |
    \ set softtabstop=4 |
    \ set shiftwidth=4  |
    \ set textwidth=79  |
    \ set expandtab     |
    \ set autoindent    |
    \ set fileformat=unix

" indent for other languages
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2     |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF

let g:loaded_python_provider = 1
let python_highlight_all=1

" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    autocmd FileType python,rst,c,cpp set colorcolumn=80
augroup END

imap <F5> <Esc>:w<CR>:!clear;python %<CR>

"=====================================================
"" misc plugin Settings
"=====================================================
" Tlist setup
"let Tlist_Use_Right_Window = 1
let g:Tlist_WinWidth = 40

" Rainbow setup
let g:rainbow_active = 1

" vim-indentguides
let g:indentguides_ignorelist = ['text']
let g:indentguides_toggleListMode = 0       " disable list mode

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"=====================================================
"" YouCompleteMe Settings
"=====================================================
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"=====================================================
"" UltiSnips Settings
"=====================================================
" Trigger configuration. Do not use <tab> if you use YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"=====================================================
"" NERDTree Settings
"=====================================================
nmap ,n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '\.pyo$', '__pycache__$', '\.o$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
"let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

"=====================================================
"" NERDComment Settings
"=====================================================
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 0

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"=====================================================
"" Ale Settings (Linting)
"=====================================================
" Use Ale.
" Show Ale in Airline
let g:airline#extensions#ale#enabled = 1

" Ale Gutter
"let g:ale_sign_column_always = 1

"=====================================================
"" fzf Settings
"=====================================================
" fzf, ref: https://jesseleite.com/posts/2/its-dangerous-to-vim-alone-take-fzf
nmap <leader>f :Files<CR>
nmap <leader>F :GFiles<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>T :BTags<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>/ :Ag<Space>
"nmap <Leader>/ :Rg<Space>
nmap <Leader>H :Helptags!<CR>
nmap <Leader>C :Commands<CR>
nmap <Leader>: :History:<CR>
nmap <Leader>M :Maps<CR>
nmap <Leader>s :Filetypes<CR>

"=====================================================
"" TagBar settings
"=====================================================
nmap <F8> :TagbarToggle<CR>
let tagbar_left=1
let g:tagbar_compact=1
let g:tagbar_autofocus=0
let g:tagbar_width=40

" following coomands cause weird color in vimdiff
"autocmd BufEnter *.py,*.c,*.h,*.cpp :call tagbar#autoopen(0)
"autocmd BufWinLeave *.py,*.c,*.h,*.cpp :TagbarClose

"=====================================================
"" AirLine settings
"=====================================================
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1
let g:airline_theme='wombat'                " set airline theme

"=====================================================
"" DevIcon Settings
"=====================================================
" loading the plugin
let g:webdevicons_enable = 1

" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1

" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 0

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'

" set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
" disabled by default with no value
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''

" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1

" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching = 1

" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching = 0

"=====================================================
"" UndoTree settings
"=====================================================
let g:undotree_WindowLayout = 2
nnoremap <F5> :UndotreeToggle<CR>

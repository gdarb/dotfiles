" ~~ Vim Settings ~~ "

" set location of vim files 
set viminfo+=n~/.vim/.viminfo
set backupdir=~/.vim/tmp//
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//

" syntax highlighting
syntax on

" line numbers
set number

" show matching brackets
set showmatch

" blink for X tenths of a second on matching brackets
set mat=2


" ~~ Searching ~~ "

" highlight search results
set hlsearch

" search updates as you type
set incsearch

" ignore case while searching
set ignorecase

" uppercase letter makes it case sensitive, other not case sensitive
set smartcase


" ~~ Text / Tab / Indent ~~ "

" use spaces instead of tabs
set expandtab

" smart tab
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" auto indent
set ai

" smart indent
set si

" wrap text
set wrap


" ~~ Colourscheme ~~ "

colorscheme gruvbox

set background=dark

hi Normal guibg=NONE ctermbg=NONE

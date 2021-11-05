" Backup files
if !isdirectory($HOME."/.vim/backup")
  call mkdir($HOME."/.vim/backup", "p")
endif
set undodir=~/.vim/backup//
set backupdir=~/.vim/backup//
set directory=~/.vim/backup//

" Indentation
set expandtab
set autoindent
set shiftwidth=2
set tabstop=2

" Rendering
colorscheme slate
set encoding=utf-8
set linebreak
set wrap

" Interface
set number
set cursorline
set title
set mouse=a

" Netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25

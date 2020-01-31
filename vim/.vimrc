" tag
" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

:set number

let g:ycm_add_preview_to_completeopt = 0
set completeopt-=preview

" autocmd VimEnter * NERDTree " always show NERDTree

" let NERDTreeWinSize = 1

set expandtab ts=2 sw=2 ai

call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'            " Project and file navigation
  Plug 'jistr/vim-nerdtree-tabs'        " NERDTree tabs

  Plug 'pangloss/vim-javascript'        " Better syntax for JS
  Plug 'prettier/vim-prettier'          " Prettier
  Plug 'othree/yajs.vim'                " Yet Another JavaScript Syntax for Vim
  Plug 'mxw/vim-jsx'                    " React JSX syntax highlighting and indenting
  Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --tern-completer' }
  Plug 'tomtom/tcomment_vim'            " Comments via <C-/>
  Plug 'alvan/vim-closetag'             " Easy close-tag
  Plug 'jiangmiao/auto-pairs'           " Close Brackets
call plug#end()

" Prettier FORMATTERS
au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType scss setlocal formatprg=prettier\ --parser\ css
au FileType css setlocal formatprg=prettier\ --parser\ css

" vim-closetag - These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" NERDTree closes if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Maps ctrl+n as NERDTree open
" map <C-n> :NERDTreeToggle<CR>
map <C-n> :NERDTreeTabsToggle<CR>




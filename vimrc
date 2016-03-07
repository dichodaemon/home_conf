set nocompatible

"-------------------------------------------------------------------------------
" Vundle
"-------------------------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/wincent/command-t.git'
Plugin 'https://github.com/sjbach/lusty.git'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'https://github.com/Shougo/vimproc.vim.git'
Plugin 'https://github.com/Shougo/unite.vim.git'
Plugin 'https://github.com/Shougo/unite-outline.git'
Plugin 'https://github.com/sgur/unite-qf.git'
Plugin 'https://github.com/vim-airline/vim-airline.git'
Plugin 'https://github.com/asenac/vim-airline-loclist.git'
Plugin 'https://github.com/vim-airline/vim-airline-themes.git'
Plugin 'https://github.com/funorpain/vim-cpplint.git'
Plugin 'https://github.com/justincampbell/vim-eighties.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'https://github.com/tpope/vim-unimpaired.git'
Plugin 'https://github.com/kmnk/vim-unite-giti.git'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
call vundle#end()
filetype plugin indent on

"-------------------------------------------------------------------------------
" Colors and appearance
"-------------------------------------------------------------------------------
colorscheme default
set number
highlight LineNr term=bold cterm=NONE ctermfg=White  ctermbg=LightGray gui=NONE
               \ guifg=White guibg=LightGray
highlight OverLength ctermbg=gray ctermfg=black guibg=#EEEEEE
match OverLength /\%101v.\+/
set laststatus=2

"-------------------------------------------------------------------------------
" Formatting
"-------------------------------------------------------------------------------
set autoindent
set tabstop=2
set shiftwidth=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
set tw=100
set expandtab
set nowrap

"-------------------------------------------------------------------------------
" Behavior
"-------------------------------------------------------------------------------
filetype plugin on
set autoread
set incsearch
set hlsearch
let mapleader = ","
set dir=~/.vim/swp
" Display trailing spaces
set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.
" Show options when pressing Tab in command window
set wildmenu
set wildmode=list:longest,full
set ignorecase
set smartcase

"-------------------------------------------------------------------------------
" For Latex
"-------------------------------------------------------------------------------
let g:tex_indent_items = 0

"-------------------------------------------------------------------------------
" For LustyJuggler
"-------------------------------------------------------------------------------
set hidden

"-------------------------------------------------------------------------------
" Command-T Configuration
"-------------------------------------------------------------------------------
let g:CommandTFileScanner="find"
let g:CommandTWildIgnore="**/build/*"
let g:CommandTMaxFiles=10000

"-------------------------------------------------------------------------------
" CTags Configuration
"-------------------------------------------------------------------------------
set tags=./GTAGS;~/
noremap <Leader>u : !ctags-update.sh<CR>
set wildignore+=build,.git

"-------------------------------------------------------------------------------
" CPPLint Configuration
"-------------------------------------------------------------------------------
"autocmd BufWritePost *.h,*.cpp call Cpplint()

"-------------------------------------------------------------------------------
" YouCompleteMe Configuration
"-------------------------------------------------------------------------------
let g:ycm_filetype_whitelist = {'cpp': 1, 'c': 1, 'python':1}
let g:ycm_global_ycm_extra_conf = '~/.vim/other_files/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

"-------------------------------------------------------------------------------
" Unite Configuration
"-------------------------------------------------------------------------------

let g:unite_data_directory = '~/.vim/cache/unite'
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
\ '-i --vimgrep --hidden --ignore ' .
\ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' ' .
\ '--ignore ''build'''
let g:unite_source_grep_recursive_opt = ''
nnoremap <space>r :UniteResume<cr>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>? :Unite -no-quit -keep-focus grep:.<cr>
nnoremap <space>o :Unite outline<cr>
nnoremap <Space>gb :Unite giti/branch<cr>
nnoremap <Space>gs :Unite -no-quit -keep-focus giti/status<cr>
nnoremap <Space>qf :Unite qf<cr>
nnoremap <Space>ll :Unite locationlist<cr>

"-------------------------------------------------------------------------------
" Vim-airline Configuration
"-------------------------------------------------------------------------------
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file' ]
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#loclist#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
let g:ycm_always_populate_loc_list = 1
let g:syntastic_always_populate_loc_list = 1

"-------------------------------------------------------------------------------
" Configure vimrc auto reload
"-------------------------------------------------------------------------------
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


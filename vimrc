set nocompatible

"-------------------------------------------------------------------------------
" Vundle
"-------------------------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/wincent/command-t.git'
Plugin 'https://github.com/scrooloose/nerdcommenter.git'
Plugin 'https://github.com/Shougo/vimproc.vim.git'
Plugin 'https://github.com/Shougo/unite.vim.git'
Plugin 'https://github.com/Shougo/unite-outline.git'
Plugin 'https://github.com/sgur/unite-qf.git'
Plugin 'https://github.com/vim-airline/vim-airline.git'
Plugin 'https://github.com/asenac/vim-airline-loclist.git'
Plugin 'https://github.com/vim-airline/vim-airline-themes.git'
Plugin 'https://github.com/funorpain/vim-cpplint.git'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'https://github.com/tpope/vim-unimpaired.git'
Plugin 'https://github.com/kmnk/vim-unite-giti.git'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'https://github.com/nvie/vim-flake8.git'
call vundle#end()
filetype plugin indent on

"-------------------------------------------------------------------------------
" Colors and appearance
"-------------------------------------------------------------------------------
syntax on
colorscheme default
set number
highlight LineNr term=bold cterm=bold ctermfg=White  ctermbg=LightGray gui=bold
               \ guifg=White guibg=LightGray

highlight OverLength ctermbg=gray ctermfg=black guibg=gray guifg=black
augroup Longlines
  autocmd!
  autocmd! FileType * match OverLength /\%81v.\+/
  autocmd! FileType c,cpp match OverLength /\%101v.\+/
  autocmd! BufEnter * match OverLength /\%81v.\+/
  autocmd! BufEnter *.c,*.cpp,*.h match OverLength /\%101v.\+/
augroup END
set laststatus=2


"-------------------------------------------------------------------------------
" Formatting
"-------------------------------------------------------------------------------
set autoindent
set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
filetype plugin on

"-------------------------------------------------------------------------------
" Behavior
"-------------------------------------------------------------------------------

" MacOS fixes
set backspace=indent,eol,start
fixdel

set autoread
set incsearch
set hlsearch
let mapleader = ","
set dir=~/.vim/swp
" Display trailing spaces
set list
set listchars=tab:··,trail:~,extends:#,nbsp:~
" Show options when pressing Tab in command window
set wildmenu
set wildmode=list:longest,full
set ignorecase
set smartcase
set scrolloff=2

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
let g:CommandTWildIgnore="*/build/*"
let g:CommandTMaxFiles=100000

"-------------------------------------------------------------------------------
" CTags Configuration
"-------------------------------------------------------------------------------
set tags=./GTAGS;~/
noremap <Leader>u : !ctags-update.sh<CR>
set wildignore+=*/build,.git
"-------------------------------------------------------------------------------
" CPPLint & clang-format Configuration
"-------------------------------------------------------------------------------
autocmd FileType cpp map <buffer> <leader>cl :call Cpplint()<cr>
noremap <leader>cf : %!clang-format<cr>


"-------------------------------------------------------------------------------
" YouCompleteMe Configuration
"-------------------------------------------------------------------------------
let g:ycm_filetype_whitelist = {'cpp': 1, 'c': 1, 'python':1}
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
let g:syntastic_always_populate_loc_list = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
nnoremap <leader>gt :YcmCompleter GoTo<cr>

"-------------------------------------------------------------------------------
" Unite Configuration
"-------------------------------------------------------------------------------

let g:unite_data_directory = '~/.vim/cache/unite'
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
\ '-S -t --vimgrep --hidden --ignore ' .
\ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' ' .
\ '--ignore ''build'''
let g:unite_source_grep_recursive_opt = ''
nnoremap <space><space> :UniteResume<cr>
nnoremap <space>/ :Unite -auto-preview -no-split grep:.<cr>
nnoremap <space>o :Unite outline<cr>
nnoremap <Space>gb :Unite giti/branch<cr>
nnoremap <Space>gs :Unite giti/status<cr>
nnoremap <Space>gl :Unite -no-split giti/log<cr>
nnoremap <Space>qf :Unite qf<cr>
nnoremap <Space>ll :Unite -auto-preview -no-split locationlist<cr>

call unite#custom#source('buffer', 'converters', 'converter_file_directory')
nnoremap <leader>lj :Unite -quick-match -no-split buffer<cr>

"-------------------------------------------------------------------------------
" Vim-airline Configuration
"-------------------------------------------------------------------------------
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 
                                            \  'mixed-indent-file' ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#loclist#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
autocmd! BufEnter * :AirlineRefresh

"-------------------------------------------------------------------------------
" Configure vimrc auto reload
"-------------------------------------------------------------------------------
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd BufWritePost ~/home_conf/vimrc source $MYVIMRC
augroup END " }

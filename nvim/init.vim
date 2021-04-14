call plug#begin('~/.vim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" ----- For deoplete autocomplete -----
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-zsh'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } "https://github.com/carlitux/deoplete-ternjs
Plug 'davidhalter/jedi-vim'
" ----- end -----

Plug 'tpope/vim-fugitive'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nanotech/jellybeans.vim'
"Plug 'iCyMind/NeoSolarized'

Plug 'ctrlpvim/ctrlp.vim'               "Ctrl + P for search file
Plug '~/.fzf'                           "https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'               "fancy start page for empty vim
call plug#end()            " required

"NERDTree ON 단축키를 "\nt"로 설정
nmap <F2> :NERDTree<CR>
let NERDTreeShowHidden=0
let NERDTreeQuitOnOpen=1
let NERDTreeGitStatusWithFlags=1
let g:NERDTreeIgnore=['^node_modules$']

inoremap jk <ESC>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|vendor$',
  \ 'file': '\v\.(exe|so|dll)$'
\ }

color jellybeans

" Tag List 환경설정
filetype on                                 "vim filetype on
filetype plugin on

nmap <F2> :NERDTreeToggle<CR>

" 세부 정보 출력
set number
set title
set showmatch
set ruler

" 검색결과 강조
set hlsearch

" 검색시 대소문자 무시
set ignorecase

" 구문 강조 사용
if has("syntax")
 syntax on
endif

" 색깔 설정
set t_Co=256

" 들여쓰기 설정
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set cindent

" 붙여넣기 설정
set paste
set mouse=a

" 한글 입력 설정
set encoding=utf-8
set termencoding=utf-8

" 커서가 있는 줄을 강조함
set cursorline

" 상태바 표시를 항상한다
set laststatus=2 
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

" 줄바꿈안함
set nowrap

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" Markdown 문법 설정 (Git 에서 사용)
augroup markdown
    " remove previous autocmds
    autocmd!
    " set every new or read *.md buffer to use the markdown filetype
    autocmd BufRead,BufNew *.md setf markdown
augroup END

hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE

" Deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#syntax#min_keyword_length = 2 
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
" For deoplete-ternjs
let g:deoplete#sources#ternjs#filetypes = [
                \ 'vue',
                \ ]

" clang_complete
set completeopt-=preview

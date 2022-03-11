if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'tamago324/nlsp-settings.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'
Plug 'MunifTanjim/prettier.nvim'

" auto-complete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'

" git
Plug 'lewis6991/gitsigns.nvim'

" treesitter
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" find files
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" syntax highlight
Plug 'lukas-reineke/indent-blankline.nvim'
"Plug 'akinsho/bufferline.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'chrisbra/csv.vim'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'mxw/vim-jsx'

" Theme
" Plug 'morhetz/gruvbox'
" Plug 'shaunsingh/nord.nvim'
" Plug 'shaunsingh/solarized.nvim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'altercation/vim-colors-solarized'
" Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'lifepillar/vim-solarized8'
Plug 'soft-aesthetic/soft-era-vim'
Plug 'rafamadriz/neon'
Plug 'EdenEast/nightfox.nvim'

call plug#end()

set backspace=indent,eol,start
set cmdheight=1
set completeopt=menuone,noselect
set cursorline
set expandtab
set fileencoding=utf-8
set hlsearch
set ignorecase
set laststatus=2
set mouse=a
set number
set numberwidth=4
set pumheight=10
set shiftwidth=2
set showtabline=2
set signcolumn=yes
set smartcase
set smartindent
set splitbelow
set splitright
set softtabstop=2
set t_Co=256
set tabstop=2
set termguicolors
set undofile
set updatetime=300
set wrap


lua << EOF
require 'user.autocommands'
require 'user.autopairs'
require 'user.cmp'
require 'user.comment'
require 'user.gitsigns'
require 'user.indentline'
require 'user.lsp'
require 'user.prettier'
require 'user.telescope'
--require 'user.treesitter'

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end
require("lspconfig").tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
    end,
})

require("trouble").setup {
}

local nightfox = require("nightfox")
nightfox.setup({
  fox = 'dawnfox',
  transparent = true,
  styles = {
    comments = "italic",
    keywords = "bold",
    functions = "italic,bold"
  }
})
nightfox.load()

EOF

autocmd BufWritePost * :Prettier
autocmd InsertLeave * :Prettier
nmap <silent> <Leader>f :Prettier<CR>

command! -nargs=? Format :Prettier

nmap <silent> <C-Up> <ESC>:bprevious<CR>
imap <silent> <C-Up> <ESC>:bprevious<CR>
nmap <silent> <C-Down> <ESC>:bnext<CR>
imap <silent> <C-Down> <ESC>:bnext<CR>
nmap <silent> <C-Delete> <ESC>:bdelete<CR>
imap <silent> <C-Delete> <ESC>:bdelete<CR>

nmap <Leader>tt <ESC>:TroubleToggle<CR>

map <Leader>nt <ESC>:NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeDirArrows = 1

let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
"let g:airline_theme = 'softera'
let g:airline_solarized_bg = 'light'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

let g:solarized_termtrans = 1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:neon_style = 'light'
let g:neon_italic_keyword = 1
let g:neon_italic_function = 1
let g:neon_transparent = 1

syntax enable
set background=light
" colorscheme solarized8
" colorscheme soft-era
" colorscheme neon

hi DiagnosticError ctermfg=Red guifg=Red
hi DiagnosticHint ctermfg=Green guifg=Green
hi DiagnosticInfo ctermfg=Blue guifg=Blue
hi DiagnosticWarn ctermfg=DarkYellow guifg=DarkYellow
hi DiagnosticSignError ctermfg=Red guifg=Red
hi DiagnosticSignHint ctermfg=Green guifg=Green
hi DiagnosticSignInfo ctermfg=Blue guifg=Blue
hi DiagnosticSignWarn ctermfg=DarkYellow guifg=DarkYellow
hi DiagnosticUnderlineError ctermfg=Red guifg=Red
"hi DiagnosticUnderlineHint ctermfg=Green guifg=Green
"hi DiagnosticUnderlineInfo ctermfg=Blue guifg=Blue
hi DiagnosticUnderlineWarn ctermfg=DarkYellow guifg=DarkYellow
hi DiagnosticVirtualTextError ctermfg=White ctermbg=Red guifg=White guibg=Red
hi DiagnosticVirtualTextHint ctermfg=Green guifg=Green
hi DiagnosticVirtualTextInfo ctermfg=Blue guifg=Blue
hi DiagnosticVirtualTextWarn ctermfg=DarkYellow guifg=DarkYellow cterm=underline gui=underline

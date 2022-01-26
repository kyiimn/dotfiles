if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd!
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'ntpeters/vim-better-whitespace'

" Denite - Fuzzy finding, buffer management
Plug 'Shougo/denite.nvim'

" CtrlSF
Plug 'dyng/ctrlsf.vim'

" cxx highlight features are attractive, but make vim slow
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'chrisbra/csv.vim'

" typescript plugin
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
" Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/yajs'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Theme
" Plug 'morhetz/gruvbox'
" Plug 'shaunsingh/nord.nvim'
" Plug 'shaunsingh/solarized.nvim'
" Plug 'arcticicestudio/nord-vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

call plug#end()

"====================================================================================================
" coc.nvim
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Settings for neovim: nevoim does not support signcolumn+number column yet
set signcolumn=no
hi coc_err_hi ctermfg=1 ctermbg=15
sign define coc_err numhl=coc_err_hi
sign place 1 line=2 name=coc_err
hi CocErrorSign ctermfg=gray
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
"" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" integrate vim-airline  (:h airline-coc) -> Does not work as I expected!
" let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#coc#error_symbol = 'E:'
" let g:airline#extensions#coc#warning_symbol = 'W:'
" let g:airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
" let g:airline#extensions#coc#stl_format_warn = '%W{[%e(#%fw)]}'
" Add (Neo)Vim's native statusline support. -> Does not work as I expected!
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Custom vim-airline integration
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'E' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, 'W' . info['warning'])
    endif
    return join(msgs, ' '). ' ' . get(g:, 'coc_status', '') . ' ' . get(b:, 'coc_current_function', '')
endfunction
le/t airline_section_c = '%{StatusDiagnostic()}'
"airline_section_b is empty now, because corresponding plugins (e.g. coc-git) are not installed
" but maybe not required
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <Leader>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <Leader>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <Leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <Leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <Leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <Leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <Leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <Leader>cp  :<C-u>CocListResume<CR>
"====================================================================================================
" nerdtree
map <Leader>nt <ESC>:NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeDirArrows = 1

" ctrlsf
let g:ctrlsf_default_root = 'project'
" Auto close the results panel when opening a file
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }
" Immediately switch focus to the search window
let g:ctrlsf_auto_focus = { "at":"start" }
" Don't open the preview window automatically
let g:ctrlsf_auto_preview = 1
" Use the smart case sensitivity search scheme
let g:ctrlsf_case_sensitive = 'smart'
" Compact mode
let g:ctrlsf_default_view_mode = 'compact'
" Use absoulte search by default
let g:ctrlsf_regex_pattern = 0
" Width or height of search window
let g:ctrlsf_winsize = '46'

" (Ctrl+F) Open search prompt (Normal Mode)
nmap <C-F>f <Plug>CtrlSFPrompt
" (Ctrl-F + f) Open search prompt with selection (Visual Mode)
xmap <C-F>f <Plug>CtrlSFVwordPath
" (Ctrl-F + F) Perform search with selection (Visual Mode)
xmap <C-F>F <Plug>CtrlSFVwordExec
" (Ctrl-F + n) Open search prompt with current word (Normal Mode)
nmap <C-F>n <Plug>CtrlSFCwordPath
" (Ctrl-F + o )Open CtrlSF window (Normal Mode)
nnoremap <C-F>o :CtrlSFOpen<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Normal Mode)
nnoremap <C-F>t :CtrlSFToggle<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Insert Mode)
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" vim-airline
" Powerline-font 활성화
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
" let g:airline_theme='solarized'
" let g:airline_solarized_bg = 'dark'
let g:airline_theme='onehalfdark'

" Tab line 에 파일명만 출력되도록 설정
let g:airline#extensions#tabline#formatter = 'unique_tail'
set laststatus=2 " turn on bottom bar
"====================================================================================================
nmap <silent> <C-Up> :bprevious<CR>
xmap <silent> <C-Up> :bprevious<CR>
nmap <silent> <C-Down> :bnext<CR>
xmap <silent> <C-Down> :bnext<CR>
"====================================================================================================
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

"let g:nord_disable_background = 1
"let g:nord_cursor_line_number_background = 1
"let g:nord_bold = 1
"let g:nord_italic = 1
"let g:nord_italic_comments = 1
"let g:nord_underline = 1
"colorscheme nord

set t_Co=256
set cursorline
colorscheme onehalflight

"colo desert
highlight Normal     ctermbg=NONE
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
" Floating window background=white, foreground=black
" CocFloating - Pmenu의 옆에 나오는 box & error시 나오는 box
highlight CocFloating ctermbg=white ctermfg=black
"syntax
syntax on

"tap size
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"line number
set number
set smartindent
"hilight search
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> 
"backspace
set backspace=indent,eol,start
set t_kb=
"mouse wheel
set mouse=a
"set nowrap
set wrap
" reduce empty space at bottom
set cmdheight=1
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"====================================================================================================
"avoid overriding variables py Vim filetype
autocmd FileType python setlocal tabstop=4

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']

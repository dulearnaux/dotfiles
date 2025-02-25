
" " Vimspector pre configs
" let g:vimspector_enable_mappings = 'VISUAL_STUDIO'


" Plugin config
"
" 
set nocompatible              " required
" filetype off                  " required


call plug#begin('~/.vim/plugged')
" Plugins go here
Plug 'tpope/vim-fugitive'  " Git integration
Plug 'tmhedberg/SimpylFold'  " Improve python folding
Plug 'Konfekt/FastFold'  " Improve speed of folding
Plug 'vim-scripts/indentpython.vim'  " Better continuation line indentation for python
Plug 'jpalardy/vim-slime'  " Enable slinging to python or R REPL in tmux
Plug 'christoomey/vim-tmux-navigator'  " Enables vim <--> tmux navigations using vim keys.
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }  " Docstring autocreater for python
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Fuzzy search of files.
Plug 'junegunn/fzf.vim'  " Need both fzf and fzf.vim.
Plug 'scrooloose/nerdtree'  " Opens nice file tree browser
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }  " Colour theme
Plug 'sainnhe/everforest'  " Colour theme
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'} " preview markdown files in realtime.
Plug 'ycm-core/YouCompleteMe'
" 'Plug 'jmcantrell/vim-virtualenv'

" Plug 'powerline/powerline'
" Plug 'psf/black', { 'branch': 'stable' }
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion. Reuires latest Nodejs
" Plug 'vim-syntastic/syntastic'  # some timpfh i do like to type.
" Plug 'nvie/vim-flake8'  " PEP 8 autoformatter
" Plug 'puremourning/vimspector'  " Debugging
" Plug 'dense-analysis/ale'
" Plug 'kien/ctrlp.vim'  " Fuzzy searching for files. Slower than FZF.
" Plug 'VundleVim/Vundle.vim'

call plug#end()


" Show line numbers
set number
" Show the matching part of the pari [] () {}
set showmatch
" Enable copying to system clipboard (for linux). This requires the correct
" compilation settings when installing vim.
set clipboard=unnamedplus

" Splits config
set splitbelow
set splitright
" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" make your code look pretty
let python_highlight_all=1
syntax on

" UTF-8 Support (useful with Python 3)
set encoding=utf-8
" Show trailing whitespace as a dot.
set listchars=trail:·
set list

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif



" 'tmhedberg/SimpylFold'
" 'Konfekt/FastFold'
set foldmethod=indent
set foldlevel=99 " open files unfolded
nnoremap <space> za " Enable folding with the spacebar



" 'vim-scripts/indentpython.vim' 
filetype plugin indent on
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4 autoindent textwidth=80 smartindent
autocmd FileType css setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab



" jpalardy/vim-slime
let g:slime_target = "tmux"
let g:slime_python_ipython=1  " Enables better handling of pasting with indents.
" let g:slime_bracketed_paste = 1  " This might work better in Tmux for indents.
nnoremap <C-CR> <C-c><C-c> " Ctrl+Enter to sling paragraph to REPL
vnoremap <C-CR> <C-c><C-c> " Ctrl+Enter to sling selection to REPL in Visual mode.



" heavenshell/vim-pydocstring'
let g:pydocstring_formatter = 'google'  " :Pydocstring
let g:pydocstring_enable_mapping = 0  " Overrides C-L otherwise.



" junegunn/fzf.vim
" Map ctrl-p to FZP default search.
nnoremap <C-p> :FZF<CR>



" scrooloose/nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif



" 'catppuccin/vim'  - airline theme
" 'vim-airline/vim-airline'
" 'vim-airline/vim-airline-themes'
let g:airline_theme = 'catppuccin_frappe' 
let g:airline#extensions#tabline#enabled = 1 " show open buffers in statusline


" 'catppuccin/vim'  - colorscheme 
" 'sainnhe/everforest'  - colorscheme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark " For dark version.
" Set contrast.
" This configuration option should be placed before `colorscheme everforest`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:everforest_background = 'hard'

" Set everforest colorscheme.
colorscheme everforest
" Alternatively, set catppuccin theme
"colorscheme catppuccin_frappe


" Custom colour theme changes. These must go after setting the colouscheme
" above. Because termiguicolors is set above, only the gui components below
" are active. But term components are included incast termguicolors are
" unavailable.

" Create indicator for the 81st column.
highlight ColorColumn term=reverse ctermbg=226 guibg=Grey27
set colorcolumn=81
" Underline current line under cursor and make slightly lighter background
highlight CursorLine cterm=underline  gui=underline
"highlight CursorLine ctermbg=238 cterm=underline  guibg=Grey27 gui=underline
set cursorline
" Remove highlighting from comments.
highlight clear Comment 
highlight Comment ctermfg=245 guifg=Grey42 


" "python with virtualenv support
" python3 << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF


" "puremourning/vimspector
" let g:vimspector_install_gadgets = [ 'debugpy' ]



" " neoclide/coc.nvim
" " TextEdit might fail if hidden is not set.
" set hidden
"
" " Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup
" 
" " Give more space for displaying messages.
" set cmdheight=2
" 
" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
" set updatetime=300
" 
" " Don't pass messages to |ins-completion-menu|.
" set shortmess+=c
" 
" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif
" 
" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" 
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
" 
" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" 
" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
" 
" " GoTo code navigation.
" " Modified to always open in vsplit
" nmap <silent> gd :vsplit<CR><Plug>(coc-definition)
" nmap <silent> gy :vsplit<CR><Plug>(coc-type-definition)
" nmap <silent> gi :vsplit<CR><Plug>(coc-implementation)
" nmap <silent> gr :vsplit<CR><Plug>(coc-references)
" 
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" 
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction
" 
" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
" 
" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
" 
" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" 
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
" 
" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" 
" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)
" 
" " Run the Code Lens action on the current line.
" nmap <leader>cl  <Plug>(coc-codelens-action)
" 
" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
" 
" " Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif
" 
" " Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)
" 
" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocActionAsync('format')
" 
" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" 
" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" 
" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" 
" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



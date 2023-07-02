" Hints:
" :verbose imap <tab>           What is tab key bound to.
"
" KeysIforget:
" ,rn - coc rename
" zR - open all folders
" zi - invert fold option.
" :vs filename - open file on right
" :sp filename - open file above
" gs_ to snake case
" gsc to camel
" MuliSelect:
" mg979/vim-visual-multi
" - select words with Ctrl-N (like Ctrl-d in Sublime Text/VS Code)
" - create cursors vertically with Ctrl-Down/Ctrl-Up
" - select one character at a time with Shift-Arrows
" - press n/N to get next/previous occurrence
" - press [/] to select next/previous cursor
" - press q to skip current and get next occurrence
" - press Q to remove current cursor/selection
" Open:
" - sp filename
" - vsp filename
" Window:
" - reverse: ctrl-w R
" - to horizontal: ctrl-w K
" - to vertical: ctrl-w H
" Camel Case: 
" - next ,w
" - previous ,b
" - end ,e
" Hex Edit: 
" - %!xxd
" - set ft=xxd
" - %!xxd -r"
" Open Split:
" - :sp 
" - :vs
"
" Refs:
" Merge - https://gist.github.com/karenyyng/f19ff75c60f18b4b8149
"   :[%]diffg RE  # get from REMOTE
"   :[%]diffg BA  # get from BASE
"   :[%]diffg LO  # get from LOCAL
"   ]c next diff
"   [c previous diff]
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:lua << EOF

  local load_config = function()
    for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config')..'/lua/config', [[v:val =~ '\.lua$']])) do
      require('config/'..file:gsub('%.lua$', ''))
    end
  end

  require("plugins")
  load_config()

  vim.cmd [[colorscheme spacecamp]]
EOF

let leader=' '
let mapleader=' '

" Standard VI settings
set nocompatible
set clipboard+=unnamed
set noswapfile
set ignorecase
set smartcase
set number
set relativenumber
set noeol
set pastetoggle=<F2>
set backspace=indent,eol,start
set history=1000
set incsearch            "find the next match as we type the search
set hlsearch             "hilight searches by default
set showbreak=...
set wrap linebreak nolist
set visualbell t_vb=
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default
set scrolloff=3
set sidescrolloff=7
set sidescroll=1
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif
"set splitright          " load files into right split - but breaks open test
"
" The window keeps getting shorter.
set noequalalways

set laststatus=2

set wildmode=list:longest   "make cmdline tab completion like bash
set wildignore=*.o,*.obj,*~ 
set wildignore+=*/gen/*,*/tmp/*,*.so,*.swp,*.zip,*/_build/*,.git/*,*.dll,*.exe,*.dat

au BufRead,BufNewFile *.repo set filetype=dosini
"au BufRead,BufNewFile *.test set filetype=groovy
"au BufRead,BufNewFile *.fn set filetype=groovy
au BufRead,BufNewFile *.cshtml set filetype=html

" Clear selected search
nnoremap <CR> :noh<CR><CR>
nnoremap <F1> :noh<CR><CR>

map <C-s> :wa<CR>
imap <C-s> <ESC><ESC>:wa<CR>

" Open Project Files
nnoremap <silent> <leader>d yw:vsplit ../stackdb/db/baseline_10.0.500/create_schema.sql<CR>/<c-r>"<CR>

" Syntax
syntax on
" Use new regex syntax hilighting engine.
" https://jameschambers.co.uk/vim-typescript-slow
set re=0

filetype plugin indent on

" Pickle
nnoremap <silent> ,{ i{{  }}<ESC>hhi

" Custom commands
command! -nargs=1 File :e `find . -type f -iname <args>`
command! CopyPath let @+ = expand('%:p')
command! CopyRel let @+ = expand('%')
command! CopyFile let @+ = expand('%:t')
command! CopyDir let @+ = expand('%:p:h')
command! Ev :tabe ~/.config/nvim/init.vim

" Sessions
let g:session_dir = '~/vim-sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:session_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>so :so ' . g:session_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

" Launch Vs Code for file in buffer.
command! -nargs=0 Code !vs_code '%:p'
nnoremap <silent> ,v :Code<CR>

" Work out what the syntax under the cursor is
command! LineSyntax echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")

" Search for visual selection
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" Language specific configuration
autocmd FileType cs setlocal shiftwidth=4 tabstop=4

" vm-plug
"call plug#begin('~/.config/nvim/plugged')

"Plug 'reconquest/vim-pythonx'
"Plug 'AndrewRadev/sideways.vim'
"Plug 'preservim/nerdtree'
"Plug 'preservim/nerdcommenter'
"Plug 'bogado/file-line'
"Plug 'godlygeek/tabular'
"Plug 'kevinoid/vim-jsonc'
"Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-fugitive'
"Plug 'arthurxavierx/vim-caser'       " https://vimawesome.com/plugin/vim-caser
"Plug 'bkad/camelcasemotion'
"Plug 'RRethy/vim-illuminate'         " coc may do this
"Plug 'matze/vim-move'
"Plug 'sotte/presenting.vim'
"Plug 'fadein/vim-FIGlet'
"Plug 'chrisbra/csv.vim'
"Plug 'mechatroner/rainbow_csv'
"Plug 'rosenfeld/rgrep.vim'           " https://github.com/rosenfeld/rgrep.vim
"Plug 'vim-scripts/YankRing.vim'
"Plug 'kien/ctrlp.vim'
"Plug 'mg979/vim-visual-multi'
"Plug 'mattn/emmet-vim'
"Plug 'jaredgorski/spacecamp'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'
"Plug 'mustache/vim-mustache-handlebars' 
"Plug 'joshglendenning/vim-caddyfile'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'udalov/kotlin-vim'
"Plug 'puremourning/vimspector'
" Stopped using.
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'PhilRunninger/nerdtree-visual-selection'
"Plug 'PhilRunninger/nerdtree-buffer-ops'
"Plug 'OmniSharp/omnisharp-vim'

" New neovim plugins
" Sensible default 
"Plug 'tpope/vim-sensible'

" Color schemes
"Plug 'sainnhe/edge'

" LSP
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/completion-nvim'

" Code snippets
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" Fuzzy finder
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'

" Syntax
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/playground'

" Fonts
"Plug 'nvim-tree/nvim-web-devicons'
"Plug 'kyazdani42/nvim-web-devicons' " for file icons


" File explorer
"Plug 'kyazdani42/nvim-tree.lua'
"Plug 'nvim-tree/nvim-tree.lua'

" Status line
"Plug 'glepnir/galaxyline.nvim'

" Debugging
"Plug 'nvim-telescope/telescope-dap.nvim'
"Plug 'mfussenegger/nvim-dap'
"Plug 'mfussenegger/nvim-dap-python'

" Github integration
"Plug 'pwntester/octo.nvim'

"Plug 'mbbill/undotree'

"Plug 'nvim-lualine/lualine.nvim'

"Plug 'jaredgorski/spacecamp'

"Plug 'folke/which-key.nvim'

"call plug#end()

" Plugin: Sideways
"nnoremap <silent> ,ah :SidewaysLeft<cr>
"nnoremap <silent> ,al :SidewaysRight<cr>

" Plugin: NERDTree
"let NERDTreeAutoDeleteBuffer = 1
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1

"nnoremap <silent> <C-f> :NERDTreeToggle<CR>
"nnoremap <silent> ƒ :NERDTreeFind<CR> 

" Plugin: CtrlP
"let g:ctrlp_working_path_mode = ''
"let g:ctrlp_switch_buffer = 'et'
"let g:ctrlp_user_command = ['.git', 'vim_ctrlp_files.sh %s']
"let g:ctrlp_cmd='CtrlP :pwd'

" Plugin: Move
"let g:move_key_modifier = 'A'
"nnoremap ∆ :m .+1<CR>==
"nnoremap ˚ :m .-2<CR>==
"inoremap ∆ <Esc>:m .+1<CR>==gi
"inoremap ˚ <Esc>:m .-2<CR>==gi
"vnoremap ∆ :m '>+1<CR>gv=gv
"vnoremap ˚ :m '<-2<CR>gv=gv

" Plugin: vim-illuminate
"let g:Illuminate_delay = 500

" Plugin: coc-nvim
" let g:coc_global_extensions = [
"    \ 'coc-json',
"    \ 'coc-git',
"    \ 'coc-snippets',
"    \ 'coc-tsserver',
"    \ 'coc-css',
"    \ 'coc-eslint',
"    \ 'coc-html',
"    \ 'coc-prettier',
"    \ 'coc-groovy',
"    \ 'coc-sql',
"    \ 'coc-docker',
"    \ 'coc-kotlin',
"    \ ]

"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"inoremap <silent><expr> <c-@> coc#refresh() " <c-space> for code completion

" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"autocmd CursorHold * silent call CocActionAsync('highlight')

"colorscheme default
"colorscheme spacecamp
"colorscheme koehler

"hi! CocWarningSign guifg=#d1cd66
"hi! CocInfoSign guibg=#353b45

"nnoremap <silent> K :call <SID>show_documentation()<CR>
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  elseif (coc#rpc#ready())
"    call CocActionAsync('doHover')
"  else
"    execute '!' . &keywordprg . " " . expand('<cword>')
"  endif
"endfunction

" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder.
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Plugin: auto-pairs
"let g:AutoPairsFlyMode = 0
"let g:AutoPairsShortcutBackInsert = '<M-b>'

" Plugin: coc-snippets
" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
"let g:coc_snippet_next = '<c-j>'

" Plugin: YankRing
"nnoremap <silent> <leader>yr :YRGetElem<CR>
"nnoremap <silent> <leader>ys :YRSearch<CR>
"nnoremap <silent> π :YRReplace -1, p<CR> " alt-p
"nnoremap <silent> ˜ :echo h " alt-n"


"let g:yankring_replace_n_pkey = '<leader>p'
"let g:yankring_replace_n_pkey = 'π'

" Plugin: camelcasemotion
" Causes problems with easy selection.
"let g:camelcasemotion_key = '<leader>'

"map <silent> <leader>w <Plug>CamelCaseMotion_w
"map <silent> <leader>b <Plug>CamelCaseMotion_b
"map <silent> <leader>e <Plug>CamelCaseMotion_e
"map <silent> <leader>ge <Plug>CamelCaseMotion_ge
"sunmap w
"sunmap b
"sunmap e
"sunmap ge

"omap <silent> iw <Plug>CamelCaseMotion_iw
"xmap <silent> iw <Plug>CamelCaseMotion_iw
"omap <silent> ib <Plug>CamelCaseMotion_ib
"xmap <silent> ib <Plug>CamelCaseMotion_ib
"omap <silent> ie <Plug>CamelCaseMotion_ie
"xmap <silent> ie <Plug>CamelCaseMotion_ie

"imap <silent> <S-Left> <C-o><Plug>CamelCaseMotion_b
"imap <silent> <S-Right> <C-o><Plug>CamelCaseMotion_w

" RGrep Plugin
"set grepprg=grep\ -nrI\ --exclude-dir=bin\ --exclude-dir=obj\ --exclude-dir=.git\ --exclude="tags"\ --exclude=".min.js"\ --exclude=".log"\ $*\ /dev/null

" Plugin: vim-session
" Do not ask about loading sesssions when vi is started
let g:session_autoload = 'no'
" Always save to protect against accidental :q
let g:session_autosave = 'yes'
" Don't save hidden and unloaded buffers in sessions.
set sessionoptions-=buffers
" If you don't want help windows to be restored:
"set sessionoptions-=help
"set ssop-=options    " do not store global and local values in a session
"set ssop-=folds      " do not store folds

" Vimspector Debugger
"let g:vimspector_enable_mappings='VISUAL_STUDIO'

" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

" for normal mode - the word under the cursor
"nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
"xmap <Leader>di <Plug>VimspectorBalloonEval

"nmap <S-F5> call vimspector#Stop( { 'interactive': v:true } )
"nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
"nmap <LocalLeader><F12> <Plug>VimspectorDownFrame
"nmap <LocalLeader>B     <Plug>VimspectorBreakpoints
"nmap <LocalLeader>D     <Plug>VimspectorDisassemble

" file_ignore_patterns = '{".git/", ".cache", "%.o", "%.a", "%.out", "%.class", %.pdf", "%.mkv", "%.mp4", "%.zip"}'


" Plug Nvim-Tree
"nnoremap <leader>e :NvimTreeToggle<cr>
"nnoremap <leader>fe :NvimTreeFindFile<cr>


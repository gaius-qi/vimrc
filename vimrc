" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker nospell:

" Plugins {{
set nocompatible
set shell=/bin/zsh
set background=dark
filetype off
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree',
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-dispatch', { 'for': ['go']  }
Plug 'mbbill/undotree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'jistr/vim-nerdtree-tabs' " nerdtree 打开标签时保持目录
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'w0rp/ale', { 'for': ['javascript', 'css', 'less', 'json', 'vue', 'markdown']  }
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'ap/vim-css-color', { 'for': ['css', 'less'] }
Plug 'jeetsukumaran/vim-buffergator'
Plug 'wsdjeg/FlyGrep.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'aklt/plantuml-syntax', { 'for': ['plantuml', 'puml', 'uml'] }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug '$HOME/.fzf'
Plug 'junegunn/fzf.vim'
call plug#end()
filetype plugin indent on   " Automatically detect file types.
" }}

" Basics {{
syntax on                   " Syntax highlighting
set synmaxcol=200
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8
set fileencodings=ucs-bom,utf-8,euc-cn,cp936,default,latin1
set clipboard=unnamed
colorscheme dracula
set autowrite
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
" Restore cursor
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END
set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode
" nocursorline is faster
" set cursorline                  " Highlight current line
highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode
highlight clear CursorLineNr    " Remove highlight color from current line number
set ruler                   " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd                 " Show partial commands in status line and
set laststatus=2
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set nospell
" set backup
set undofile                    " So is persistent undo ...
set undolevels=1000             " Maximum number of changes that can be undone
set undoreload=10000            " Maximum number lines to save for undo on a buffer reload
set foldlevel=4
" set foldmethod=syntax
set foldmethod=marker "faster
set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=2                " Use indents of 2 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=2                   " An indentation every two columns
set softtabstop=2               " Let backspace delete indent
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set pastetoggle=<F4>            " pastetoggle (sane indentation on pastes)
autocmd FileType c,cpp,java,javascript,python,rust,xml,yml,perl,sql,json,css,html autocmd BufWritePre <buffer> call StripTrailingWhitespace()
" }}

" Key (re)Mappings {{
let mapleader = ','
let maplocalleader = '_'
map <S-H> gT
map <S-L> gt
map <left> gT
map <right> gt
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
noremap <F2> <C-w>T
noremap j gj
noremap k gk
nnoremap Y y$
" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" Allow using the repeat operator with a visual selection (!)
vnoremap . :normal .<CR>
cmap w!! w !sudo tee % >/dev/null
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <Leader>= <C-w>=
map zl zL
map zh zH
function! WrapRelativeMotion(key, ...)
  let vis_sel=""
  if a:0
    let vis_sel="gv"
  endif
  if &wrap
    execute "normal!" vis_sel . "g" . a:key
  else
    execute "normal!" vis_sel . a:key
  endif
endfunction
noremap $ :call WrapRelativeMotion("$")<CR>
noremap <End> :call WrapRelativeMotion("$")<CR>
noremap 0 :call WrapRelativeMotion("0")<CR>
noremap <Home> :call WrapRelativeMotion("0")<CR>
noremap ^ :call WrapRelativeMotion("^")<CR>
onoremap $ v:call WrapRelativeMotion("$")<CR>
onoremap <End> v:call WrapRelativeMotion("$")<CR>
vnoremap $ :<C-U>call WrapRelativeMotion("$", 1)<CR>
vnoremap <End> :<C-U>call WrapRelativeMotion("$", 1)<CR>
vnoremap 0 :<C-U>call WrapRelativeMotion("0", 1)<CR>
vnoremap <Home> :<C-U>call WrapRelativeMotion("0", 1)<CR>
vnoremap ^ :<C-U>call WrapRelativeMotion("^", 1)<CR>
" Stupid shift key fixes
if has("user_commands")
  command! -bang -nargs=* -complete=file E e<bang> <args>
  command! -bang -nargs=* -complete=file W w<bang> <args>
  command! -bang -nargs=* -complete=file Wq wq<bang> <args>
  command! -bang -nargs=* -complete=file WQ wq<bang> <args>
  command! -bang Wa wa<bang>
  command! -bang WA wa<bang>
  command! -bang Q q<bang>
  command! -bang QA qa<bang>
  command! -bang Qa qa<bang>
endif
cmap Tabe tabe
" }}

" Plugins configs {{
"
" vim-javascript
set conceallevel=1
" Nerdcommenter
let g:NERDSpaceDelims = 1
vmap gc <Plug>NERDCommenterToggle
" NerdTree
let g:NERDShutUp=1
map <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " The-NERD-tree
let NERDTreeShowFiles=1 " The-NERD-tree
let NERDTreeWinPos=1 " The-NERD-tree
let NERDTreeWinPos="left" " The-NERD-tree
let NERDTreeShowLineNumbers=1 " The-NERD-tree
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$'
      \, '\.idea$', 'node_modules$', 'coverage$', 'assembly$', '\.react_entries$', '\.chair-react$'
      \, '\.nyc_output$', 'logs$', 'render_cache$']
let NERDTreeShowBookmarks=1 " The-NERD-tree
let g:nerdtree_tabs_smart_startup_focus=2
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let NERDSpaceDelims=1 " nerdcommenter 注释添加空格
" JSON
nmap <leader>jt <Esc>:%!xargs -0 node -e "console.log(JSON.stringify(JSON.parse(process.argv[1]), null, 2));"<CR><Esc>:set filetype=json<CR>
" UndoTree
nnoremap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1
" Fugitive
nnoremap <silent> <leader>gg :SignifyToggle<CR>
" YouCompleteMe
let g:acp_enableAtStartup = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_stop_completion = ['<C-k>']
let g:ycm_key_list_select_completion = [] " leave tab for ultisnips
set completeopt-=preview
" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" Indent_guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
" Vim-airline
" let g:airline_left_sep='›'
" let g:airline_right_sep='‹'
" Signify
let g:signify_vcs_list=['git']
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
" Buffergator
let g:buffergator_viewport_split_policy="B"
let g:buffergator_split_size=10
let g:buffergator_suppress_keymaps=1
nnoremap <C-B> :BuffergatorToggle<CR>
" Ale
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'javascript': ['prettier', 'eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'less': ['prettier'],
\   'markdown': ['prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
nmap <F8> <Plug>(ale_fix)
nmap <leader>jj <Plug>(ale_next_wrap)
nmap <leader>kk <Plug>(ale_previous_wrap)
" fzf
let g:fzf_layout = { 'down': '50%' }
" nnoremap <C-P> :GFiles<CR>
nnoremap <C-F> :FlyGrep<cr>
nnoremap <C-P> :FZF<CR>
" }}

" Functions {{
function! InitializeDirectories()
  let parent = $HOME
  let prefix = 'vim'
  let dir_list = {
    \ 'swap': 'directory',
    \ 'undo': 'undodir' }
  let common_dir = parent . '/.' . prefix
  for [dirname, settingname] in items(dir_list)
    let directory = common_dir . dirname . '/'
    if exists("*mkdir")
      if !isdirectory(directory)
        call mkdir(directory)
      endif
    endif
    if !isdirectory(directory)
      echo "Warning: Unable to create backup directory: " . directory
      echo "Try: mkdir -p " . directory
    else
      let directory = substitute(directory, " ", "\\\\ ", "g")
      exec "set " . settingname . "=" . directory
    endif
  endfor
endfunction
call InitializeDirectories()
function! StripTrailingWhitespace()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " do the business:
  %s/\s\+$//e
  " clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
" Cycle metasyntactic variables
function! s:CycleMetasyntacticVariables(num)
  if type(a:num) != type(0)
    return
  endif

  let vars = ['foo', 'bar', 'baz', 'qux', 'quux', 'corge', 'grault', 'garply', 'waldo', 'fred', 'plugh', 'xyzzy', 'thud']
  let cvar = expand('<cword>')
  let i = index(vars, cvar)

  if (i == -1)
    if (a:num > 0)
      execute "normal! \<C-a>"
    else
      execute "normal! \<C-x>"
    endif

    return
  endif

  let i += a:num

  if (i == -1)
    let i = len(vars) - 1
  elseif (i == len(vars))
    let i = 0
  endif

  call setreg('w', vars[i])
  normal! "_viw"wp
endfunction

nnoremap <C-a> :call <SID>CycleMetasyntacticVariables(1)<Enter>
nnoremap <C-x> :call <SID>CycleMetasyntacticVariables(-1)<Enter>

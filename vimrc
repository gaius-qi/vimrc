call plug#begin('~/.vim/plugged')

" 操作型插件
Plug 'terryma/vim-multiple-cursors' " 多行操作 <c-n>
Plug 'scrooloose/nerdcommenter' " ,ci ：切换选中行的注释状态
Plug 'scrooloose/nerdtree' " 树状显示文件目录 ,w切换 ,oxcst, 切换窗口 <c-w>
Plug 'tpope/vim-fugitive' " 集成 Git 命令 :Gblame, :Gstatus :Gcommit

" 展示型插件
Plug 'dracula/vim', { 'as': 'dracula' } " dracula 主题
Plug 'mhinz/vim-signify' " 显示文件变动
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescriptreact'] }
Plug 'vim-airline/vim-airline' " 状态栏
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] } " 语法高亮
Plug 'jistr/vim-nerdtree-tabs' " nerdtree 打开标签时保持目录
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale', { 'for': ['html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'less', 'go', 'json', 'rust']  }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-xmark', { 'do': 'make' }

" golang
Plug 'fatih/vim-go', { 'for': ['go']  }
call plug#end()

"==============================================================================
" Vim
"==============================================================================
filetype off
set shell=/usr/local/bin/fish
set encoding=utf-8
colorscheme dracula
filetype plugin indent on " 为特定文件类型载入相关缩进文件
filetype on " 载入文件类型插件
syntax on " 语法高亮
set ttyfast
set lazyredraw
set clipboard=unnamed " Mac 下共享剪切板
set undofile " vim退出并在下次打开后仍然保留上次的undo历史
set undodir=$HOME/.vim/undo " 需要提前创建该目录，否则不会生效
set undolevels=1000 " max number of undos
set undoreload=10000 " max lines to to save for undo
set hidden " vim切换buffer(文件/tab)后仍然保留undo
set autochdir "自动切换到文件所在文件夹
set rtp+=~/.fzf
set autoread "文件自动重载
set autowrite " 文件自动保存
set foldmethod=indent "启用缩进折叠
set foldcolumn=0
set foldlevel=99
set noautoindent
set fenc=utf-8 " 设定默认解码
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set nocompatible " 不要使用vi的键盘模式，而是vim自己的
set history=1000 " history文件中需要记录的行数
set confirm " 在处理未保存或只读文件的时候，弹出确认
set viminfo+=! " 保存全局变量
set iskeyword+=_,$,@,%,#,- " 带有如下符号的单词不要被换行分割
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h18 "设置字体
set magic
set nobackup " 不要备份文件
set noswapfile " 关闭交换文件
set nowb
set bufhidden=hide
set linespace=0 " 字符间插入的像素行数目
set wildmenu " 增强模式中的命令行自动完成操作
set showcmd  " 输入的命令显示出来，看的清楚些
set cmdheight=1 " 命令行（在状态行下）的高度，默认为1，这里是2
set backspace=2 " 使回格键（backspace）正常处理indent, eol, start等
set whichwrap+=<,>,h,l " 允许backspace和光标键跨越行边界
set mouse=a " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set shortmess=atI " 启动的时候不显示那个援助索马里儿童的提示
set report=0 " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set noerrorbells " 不让vim发出的滴滴声
set showmatch " 高亮显示匹配的括号
set matchtime=2 " 匹配括号高亮的时间（单位是十分之一秒）
set ignorecase " 在搜索的时候忽略大小写
set ru "标尺信息
set ai " 自动缩进
set hlsearch  "搜索逐字符高亮
set incsearch " 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set scrolloff=3 " 光标移动到buffer的顶部和底部时保持3行距离
set novisualbell " 不要闪烁
set laststatus=2 " 总是显示状态行
set number " 显示行号
set list listchars=trail:๏, " 方便显示tab 和 空格
set autoindent " 继承前一行的缩进方式
set smartindent " 智能自动缩进
set cindent shiftwidth=2 " 自动缩进2空格
set tabstop=2 " 制表符为2
set softtabstop=2 " 统一缩进为2
set shiftwidth=2 " 统一缩进为2
set expandtab " 用空格代替制表符
set wrap " 换行
set smarttab " 在行和段开始处使用制表符
set background=dark
set splitright
set splitbelow
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set fillchars+=stl:\ ,stlnc:\
set t_Co=256
set fo+=mB "对亚洲语言断行支持
set listchars=tab:--

" Turn off annoying beeps
set vb
set noeb
set vb t_vb=

lang en_US.UTF-8
let mapleader = ","  " map leader键设置
let loaded_matchparen = 0 "关闭自动高亮显示匹配的括号
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

"==============================================================================
" NerdTree
"==============================================================================
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * if !argc()|NERDTree|endif
let NERDTreeShowHidden=1
let NERDTreeShowFiles=1
let NERDTreeIgnore=['\.pyc$', '\~$', '.DS_Store', '\.swp' ]
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"

"==============================================================================
" vim-nerdtree-tabs
"==============================================================================
map <C-e> :NERDTreeToggle<CR>

"==============================================================================
" NERD Commenter
"==============================================================================
let NERDSpaceDelims=1 " nerdcommenter 注释添加空格
let g:NERDShutUp=1

"==============================================================================
" vim-javascript
"==============================================================================
let b:javascript_fold=1 " 打开javascript折叠
let javascript_enable_domhtmlcss=1 " 打开javascript对dom、html和css的支持

"==============================================================================
" COC
"==============================================================================
set updatetime=300
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-html', 'coc-go', 'coc-css', 'coc-yaml', 'coc-snippets', 'coc-rust-analyzer']
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)

" GoTo code navigation.
" 'gd' go to definition and 'ctrl + o go' back previous file
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use shift + k to show documentation in preview window.
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

" Disable the neosnippet preview candidate window
set completeopt-=preview

"==============================================================================
" vim-go
"==============================================================================
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1 " 不弹出 quickfix 窗口
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_gopls_enabled = 0

"==============================================================================
" fzf
"==============================================================================
let g:fzf_layout = { 'down': '50%' }
nnoremap <C-P> :GFiles<CR>

"==============================================================================
" Airline
"==============================================================================
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

"==============================================================================
" ALE default
"==============================================================================
" ale default configuration
" https://github.com/dense-analysis/ale/blob/master/doc/ale.txt
" ale lint configuration
" https://github.com/dense-analysis/ale/blob/master/doc/ale-json.txt	
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_max_signs = 10
nmap <F8> <Plug>(ale_fix)
nmap <leader>jj <Plug>(ale_next_wrap)
nmap <leader>kk <Plug>(ale_previous_wrap)

"==============================================================================
" ALE tslint
"==============================================================================
" ale with typescript
" https://github.com/dense-analysis/ale/blob/master/doc/ale-typescript.txt
let g:ale_typescript_tslint_use_global = 1
let g:ale_typescript_tslint_config_path = $HOME . '/.tslint.json'
let g:ale_typescript_tslint_executable = 'tslint'

"==============================================================================	
" ALE fixjson	
"==============================================================================	
let g:ale_json_fixjson_use_global = 1	

"==============================================================================
" ALE golangci-lint
"==============================================================================
" configuration: golangci-lint run -h
" ALE 运行 golangci-lint run --no-config --enable-all main.go 
" 不使用项目内 .golangci.yaml 配置文件 lint，--enable-all 开启所有 linters
" let g:ale_go_golangci_lint_options ='--no-config --enable-all'
"
" ALE 运行 golangci-lint run main.go
" 使用项目内 .golangci.yaml 配置文件 lint
" 项目内必须要有 .golangci.yaml 文件否则没有 lint
let g:ale_go_golangci_lint_options =''

"==============================================================================
" ALE linters
"==============================================================================
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'go': ['golangci-lint', 'govet'],
\   'rust': ['analyzer'],
\}

"==============================================================================
" ALE fixers
"==============================================================================
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'css': ['prettier'],
\   'less': ['prettier'],
\   'scss': ['prettier'],
\   'sass': ['prettier'],
\   'html': ['prettier'],
\   'markdown': ['prettier'],
\   'yaml': ['prettier'],
\   'json': ['prettier', 'fixjson'],
\   'rust': ['rustfmt']
\}

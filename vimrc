set nocompatible
set shell=/bin/zsh
set background=dark
filetype off
call plug#begin('~/.vim/plugged')
set encoding=utf-8

" 操作型插件
Plug 'mbriggs/mark.vim' " ,m高亮 ,n去除高亮 ,/下一个标签
Plug 'terryma/vim-multiple-cursors' " 多行操作 <c-n>
Plug 'scrooloose/nerdcommenter' " ,ci ：切换选中行的注释状态
Plug 'scrooloose/nerdtree' " 树状显示文件目录 ,w切换 ,oxcst, 切换窗口 <c-w>
Plug 'mattn/emmet-vim' " HTML生成<c-y>, 选中标签<c-y>d，跳转<c-y>n，注释：<c-y>/，合并标签：<c-y>j，移除标签对：<c-y>k
Plug 'tpope/vim-surround' " 换 cs"' 删 ds" 增 ysiw) 多空格 ysiw( 整行 yss
Plug 'tpope/vim-fugitive' " 集成 Git 命令 :Gblame, :Gstatus :Gcommit
Plug 'junegunn/vim-xmark', {'do': 'make', 'for': 'markdown'}
Plug 'buoto/gotests-vim', { 'for': ['go']  } " 生成 golang 测试代码

" 展示型插件
Plug 'dracula/vim', { 'as': 'dracula' } " dracula 主题
Plug 'mhinz/vim-signify' " 显示文件变动
Plug 'vim-airline/vim-airline' " 状态栏
Plug 'nathanaelkane/vim-indent-guides' " 可视化缩进插件
Plug 'pangloss/vim-javascript', { 'for': ['html', 'vue', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'] } " 语法高亮
Plug 'groenewege/vim-less', { 'for': ['html', 'vue', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'less', 'sass']  } " 语法高亮
Plug 'posva/vim-vue', { 'for': ['vue'] } " 语法高亮
Plug 'mxw/vim-jsx', { 'for': ['javascriptreact', 'typescriptreact'] } " react jsx插件
Plug 'jistr/vim-nerdtree-tabs' " nerdtree 打开标签时保持目录
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact'] } " TypeScript 支持
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript', 'typescriptreact'] } " tsx 支持
Plug 'wsdjeg/FlyGrep.vim'

Plug 'fatih/vim-go', { 'for': ['go']  }
Plug 'tpope/vim-dispatch', { 'for': ['go']  }
Plug 'dgryski/vim-godef', { 'for': ['go']  }

Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale', { 'for': ['html', 'vue', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'less', 'json', 'go']  }
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

Plug '$HOME/.fzf'
Plug 'junegunn/fzf.vim'
call plug#end()
filetype plugin indent on

syntax on " 语法高亮
colorscheme dracula
filetype plugin indent on " 为特定文件类型载入相关缩进文件
filetype on " 载入文件类型插件

set ttyfast
set lazyredraw
set clipboard=unnamed " Mac 下共享剪切板
set undofile " vim退出并在下次打开后仍然保留上次的undo历史
set undodir=$HOME/.vim/undo " 需要提前创建该目录，否则不会生效
set undolevels=1000 " max number of undos
set undoreload=10000 " max lines to to save for undo
set hidden " vim切换buffer(文件/tab)后仍然保留undo
set autochdir "自动切换到文件所在文件夹
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
set magic " 设置魔术
set nobackup " 不要备份文件
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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set fillchars+=stl:\ ,stlnc:\
set t_Co=256
set fo+=mB "对亚洲语言断行支持
set listchars=tab:--

let b:javascript_fold=1  "打开javascript折叠
let javascript_enable_domhtmlcss=1 "打开javascript对dom、html和css的支持
let mapleader = ","  " map leader键设置
let g:mapleader = ","
let b:javascript_fold=1 " 打开javascript折叠
let javascript_enable_domhtmlcss=1 " 打开javascript对dom、html和css的支持
let loaded_matchparen = 0 "关闭自动高亮显示匹配的括号
let g:indent_guides_enable_on_vim_startup=1 " vim-indent-guides 随 vim 自启动
let g:indent_guides_guide_size=1 " vim-indent-guides 色块宽度
let g:indent_guides_start_level=2 " vim-indent-guides
let g:indent_guides_auto_colors = 0 " 手动配色
let g:jsx_ext_required = 0 " vim-jsx插件 让js文件也支持jsx插件
let NERDTreeShowHidden=1 " The-NERD-tree
let NERDTreeShowFiles=1 " The-NERD-tree
let NERDTreeWinPos=1 " The-NERD-tree
let NERDTreeWinPos="left" " The-NERD-tree
let NERDTreeShowLineNumbers=1 " The-NERD-tree
let NERDTreeIgnore=['\.pyc$', '\~$', '.DS_Store', '\.swp' ] "ignore files in NERDTree " The-NERD-tree
let NERDTreeShowBookmarks=1 " The-NERD-tree
let g:nerdtree_tabs_smart_startup_focus=2
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let NERDSpaceDelims=1 " nerdcommenter 注释添加空格

"==============================================================================
" vim-go 插件
"==============================================================================
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1 " 不弹出 quickfix 窗口
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:godef_split=3
let g:godef_same_file_in_same_window=1

autocmd! bufwritepost .vimrc source %
autocmd InsertLeave * se nocul  " 用浅色高亮当前行
autocmd InsertEnter * se cul
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css " vim-vue插件
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript " TypeScript 插件
" autocmd VimEnter * NERDTree | wincmd p " The-NERD-tree 默认启动，打开后光标在编辑文件中
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " 自动关闭

map <Leader>w :NERDTreeToggle<CR>
nmap <Leader>u :UndotreeToggle<CR>
nmap <leader>h :Toc<cr>
nmap <Leader>c :<C-u>call gitblame#echo()<CR>
nmap <leader>a :Ag! -w "<cword>"<cr> "用 ,a 搜索当前 cursor 下单词
nmap <C-A> :<c-C>ggVG
nmap <S-l> gt
nmap <S-h> gT
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" NerdTree
let g:NERDShutUp=1
map <C-e> :NERDTreeToggle<CR>

" store swap files in a single directory instead of the current directory with the 'dir' setting
set dir=$HOME/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" fzf
let g:fzf_layout = { 'down': '50%' }
nnoremap <C-O> :FZF<CR>
nnoremap <C-P> :GFiles<CR>
nnoremap <C-F> :FlyGrep<CR>

" OmniComplete
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Disable the neosnippet preview candidate window
set completeopt-=preview

"==============================================================================
" ALE tslint
"==============================================================================
" ale with typescript
" https://github.com/dense-analysis/ale/blob/master/doc/ale-typescript.txt
let g:ale_typescript_tslint_use_global = 1
let g:ale_typescript_tslint_config_path = $HOME . '/.tslint.json'
let g:ale_typescript_tslint_executable = 'tslint'

"==============================================================================
" ALE linter
"==============================================================================
" Run linters only when I save files
" https://github.com/dense-analysis/ale#5xii-how-can-i-run-linters-only-when-i-save-files
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

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
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
\   'javascript': ['tsserver', 'eslint'],
\   'javascriptreact': ['tslint', 'tsserver', 'eslint'],
\   'typescript': ['tslint', 'tsserver', 'eslint'],
\   'typescriptreact': ['tslint', 'tsserver', 'eslint'],
\   'go': ['golangci-lint'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'tslint', 'eslint'],
\   'typescript': ['prettier', 'tslint', 'eslint'],
\   'typescriptreact': ['prettier', 'tslint', 'eslint'],
\   'vue': ['prettier', 'eslint'],
\   'json': ['prettier'],
\   'css': ['prettier'],
\   'less': ['prettier'],
\   'scss': ['prettier'],
\   'sass': ['prettier'],
\   'html': ['prettier'],
\   'yaml': ['prettier'],
\   'markdown': ['prettier'],
\}

nmap <F8> <Plug>(ale_fix)
nmap <leader>jj <Plug>(ale_next_wrap)
nmap <leader>kk <Plug>(ale_previous_wrap)

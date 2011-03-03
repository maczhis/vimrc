set nocompatible "不使用兼容模式
autocmd! bufwritepost _vimrc source %

" map 我的常用按键
let mapleader=","
nmap <leader>u :BufExplorer<cr>
nmap <leader>p :NERDTreeToggle<cr>
" 我使用 Dvorak 键盘布局，因此以上设置对我来说很方便
" 相当于 Qwerty 键盘上按 wf 和 wr

map <C-S> <ESC>:w<CR>
imap <C-S> <ESC>:w<CR>
map <C-g> <ESC>
imap <C-g> <ESC>
map <F2> <ESC>:w<CR>
imap <F2> <ESC>:w<CR>
"map <f3> :w\|!python %<cr>
"map <f4> :w\|!python -i %<cr>
"map <f3> :w\|!gcc-3 -ggdb3 % && cat %.input \| a.exe<cr>
"map <f4> :w\|!gcc-3 -ggdb3 % && a.exe<cr>
"map <f5> :w\|!g++-3 -ggdb3 % && cat %.input \| a.exe<cr>
"map <f6> :w\|!g++-3 -ggdb3 % && a.exe<cr>
map <F5> :VimwikiAll2HTML<CR><CR>
nmap <C-o> :e 

" 以下抄自 Leeiio 或受其启发
nmap <C-Tab> <C-w><C-w>
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

nmap <C-t> :tabnew<cr>
nmap <C-p> :tabprevious<cr>
nmap <C-n> :tabnext<cr>
nmap <C-q> ZZ



"set rnu "使用相对行号 (7.3)
set number "显示行号
set ruler "在右下角显示当前行列等信息
syntax enable "语法高亮提示
filetype indent on "根据文件类型自动缩进
filetype plugin on "根据文件类型加载插件

" 使用 4 个空格缩进而不用 Tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

set wrap "自动折行
"set linebreak "折行不断词，让英文阅读更舒服些
set nolinebreak "这是为了适应中文换行
set backspace=start,indent,eol "让 Backspace 键可以删除换行
set encoding=utf-8
"language message zh_CN.UTF-8
set langmenu=en_US.GBK
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set fileencodings=ucs-bom,utf-8,cp936,gbk "中文支持
set hidden "让切换 buffer 保持 undo 记录
"set undofile "开启持久化撤销 (7.3)
set viminfo='1000,f1,<500,%,h "持久保存文件光标位置等信息
set autochdir "自动更换工作目录到当前编辑文件的目录

"高亮搜索、渐进式搜索、忽略大小写
set hlsearch
set incsearch
set ignorecase

set mouse=nv "在 Normal 和 Visual 模式下使用鼠标

"高亮所在行、列
set cursorline
set cursorcolumn

set foldmethod=indent "以缩自动折叠显示文档
set scrolloff=5 "光标碰到第五行、倒数第五行时就上下卷屏
set autoread "如果正在编辑的文件在打开后又有其他程序更新，则自动加载

"Emacs 式快捷键
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-B> <Left>

" Leeiio 童鞋对以下设置亦有贡献
" https://github.com/Leeiio/Vim/blob/master/vimrc

" 获取当前目录
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

" 标签页
set tabpagemax=15 " 最多15个标签
set showtabline=2 " 总是显示标签栏

" 关闭遇到错误时的声音提示
set noerrorbells

" 命令行与状态行
set cmdheight=1 " 设置命令行的高度
set laststatus=2 " 始终显示状态行
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P] "设置状态栏的信息


"设置配色方案
"http://www.h3rald.com/articles/herald-vim-color-scheme/
colo herald

" 安装的插件及其设置

" JavaScript syntax
" http://www.vim.org/scripts/script.php?script_id=1491

" javaScriptLint.vim
" http://www.vim.org/scripts/script.php?script_id=2578

" VimBall 安装插件必备
" http://www.vim.org/scripts/script.php?script_id=1502

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
" http://www.vim.org/scripts/script.php?script_id=2332
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" delimitMate 自动补完括号等配对
" http://www.vim.org/scripts/script.php?script_id=2754
let delimitMate_expand_space = 1 "配对内按空格键在光标左右均插入空格
let delimitMate_expand_cr = 1 "配对内按回车键把光标放在中间空行
" 在 html,yohtml 文件内百分号也作为配对自动插入，方便 jinja2 模板开发
au FileType html,yohtml let b:delimitMate_quotes = "\" ' %"
" 修复 Emacs 式编辑快捷键
imap <C-A> <Plug>delimitMateHome
imap <C-E> <Plug>delimitMateEnd
imap <C-F> <Plug>delimitMateRight
imap <C-B> <Plug>delimitMateLeft

" VimWiki 记笔记
" http://www.vim.org/scripts/script.php?script_id=2226
let g:vimwiki_menu = ''
let g:vimwiki_badsyms = ' '
let g:vimwiki_browsers = ['firefox']
let wiki1 = {}
let wiki1.path = 'C:/Users/Yuest/My Dropbox/vimwiki/think'
let wiki2 = {}
let wiki2.path = 'C:/Users/Yuest/My Dropbox/vimwiki/note'
let wiki2.netest_syntaxes = {'py': 'python', 'js': 'javascript', 'html': 'html', 'css': 'css'}
let wiki2.auto_export = 1
let wiki2.html_header = 'C:/Users/Yuest/My Dropbox/vimwiki/note/header.tpl'
let wiki2.html_footer = 'C:/Users/Yuest/My Dropbox/vimwiki/note/footer.tpl'
let g:vimwiki_list = [wiki1, wiki2]

" BufExplorer 方便切换 Buffer
" http://www.vim.org/scripts/script.php?script_id=42
map <F9> :BufExplorer<CR>

" ZenCoding 方便写HTML
" http://www.vim.org/scripts/script.php?script_id=2981
imap <C-A-E> <Plug>ZenCodingExpandNormal
vmap <C-A-E> <Plug>ZenCodingExpandVisual

" The NERD Tree 方便打开文件
" http://www.vim.org/scripts/script.php?script_id=1658
map <F8> :NERDTreeToggle<CR>


" $Id: .vimrc,v 1.1.0 2008/09/18 16:47:59 Cnangel Exp $
"
" Multi-encoding setting, MUST BE IN THE BEGINNING OF .vimrc!
"
if has("multi_byte")
  " When 'fileencodings' starts with 'ucs-bom', don't do this manually
  "set bomb
  set fileencodings=ucs-bom,utf-8,chinese,taiwan,japan,korea,latin1
  " CJK environment detection and corresponding setting
  if v:lang =~ "^zh_CN"
    " Simplified Chinese, on Unix euc-cn, on MS-Windows cp936
    set encoding=chinese
    set termencoding=chinese
    if &fileencoding == ''
      set fileencoding=chinese
    endif
  elseif v:lang =~ "^zh_TW"
    " Traditional Chinese, on Unix euc-tw, on MS-Windows cp950
    set encoding=taiwan
    set termencoding=taiwan
    if &fileencoding == ''
      set fileencoding=taiwan
    endif
  elseif v:lang =~ "^ja_JP"
    " Japanese, on Unix euc-jp, on MS-Windows cp932
    set encoding=japan
    set termencoding=japan
    if &fileencoding == ''
      set fileencoding=japan
    endif
  elseif v:lang =~ "^ko"
    " Korean on Unix euc-kr, on MS-Windows cp949
    set encoding=korea
    set termencoding=korea
    if &fileencoding == ''
      set fileencoding=korea
    endif
  endif
   " Detect UTF-8 locale, and override CJK setting if needed
  if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set encoding=utf-8
  endif
else
  echoerr 'Sorry, this version of (g)Vim was not compiled with "multi_byte"'
endif

"环境变量 LANG（使用的语言）
"环境变量 LC_CTYPE（使用的内部编码）
"Vim 选项 encoding（Vim 的内部编码）
"Vim 选项 termencoding（Vim 在与屏幕/键盘交互时使用的编码）
"Vim 选项 fileencoding（Vim 当前编辑的文件在存储时的编码）
"Vim 选项 fileencodings（Vim 打开文件时的尝试使用的编码）
"Vim 选项 ambiwidth（对“不明宽度”字符的处理方式；Vim 6.1.455 后引入）

"语法高亮 
syntax on
"根据文件类型高亮
filetype plugin on
source $VIMRUNTIME/menu.vim

"set fenc enc fencs
set fileencodings=ucs-bom,utf-8,gbk,big5,latin1
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

"指定菜单语言
" set langmenu=zh_CN.UTF-8
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim

"缩进
set backspace=2
set autoindent
"set expandtab

"空格代替tab
"set shiftwidth=4
set softtabstop=4
set tabstop=4
set cindent shiftwidth=4
"set autoindent shiftwidth=2

"行号
set number

"标尺
set ruler

set incsearch
set showmode
"打开文件时自动回到上次编辑位置
"if has("autocmd")
"	autocmd BufRead *.txt set tw=78
"	autocmd BufReadPost *
"		\ if line("'\"") > 0 && line ("'\"") <= line("$") |
"		\ exe "normal g'\"" |
"		\ endif
"endif

set showcmd

"置粘贴模式，这样粘贴过来的程序代码就不会错位了。
"set paste

"设置帮助信息
set helplang=cn

"界面字体
"set gfn=Courier\ New:h10:cANSI
"set guifont=Courier\ New
"set guifont=simsun\ 13
"if has("gui")
"   if has("win32")
"       set guifont=新宋体:h12
"   else
"       set guifont=新宋体\ 10
"   endif 
"   set columns=128 lines=36
"endif 

"搜索关键字高亮
set hls

"搜索是对不全区分大小写
"set ic

"但现在要区分
"set noic

"设置备份
set backup
set backupext=.bak
"set nobackup
"set nowritebackup

"默认备份文件目录
"set backupdir=/usr/local/backup

"设置配色方案，colorscheme可以设置，但我总提示找不到
"source $VIMRUNTIME/colors/slate.vim
"colorscheme nightflight
"colorscheme desert
"highlight Comment ctermfg=Lightred
"hi Normal ctermfg=252 ctermbg=237 term=standout
"colorscheme greens " http://elephant.linux.net.cn/files/greens.vim
highlight Comment ctermfg=Lightred

"默认是插入模式，退出插入模式 Ctrl+o
"set insertmode

"设置vim控制鼠标滚动
"set mouse=a

"设置 Ctrl+x + Ctrl+f 选择路径时，去除不是文件名的特殊字符
set isf=@,48-57,/,.,-,_,+,#,$,%,~

"设置Crontab为可用状态 
set backupcopy=yes

"设置使用screen vim时，因为错误的按键使屏幕不再闪烁
set vb t_vb=
    
"设置折叠模式
"set foldcolumn=4
"光标遇到折叠，折叠就打开
"set foldopen=all
"移开折叠时自动关闭折叠
"set foldclose=all
"zf zo zc zd zr zm zR zM zn zi zN 
"依缩进折叠
"set foldmethod=indent
"依标记折叠
"set foldmethod=marker

"菜单
set wildmenu
set wildcharm=<C-Z>

"set whichwrap=b,s,h,l,<,>,[,]
"autocmd BufReadPost ~/MLPlatform/* set tags+=~/.vim/tags.MLPlatform
set tag+=~/.vim/tags.gcc

"设定文件浏览器目录为当前目录
"set bsdir=buffer
"set autochdir

" C/C++注释
"set comments=://
" 修正自动C式样注释功能
"set comments=s1:/*,mb:*,ex0:/

" 命令行高度
"set cmdheight=1

map <F6> a<C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR><ESC>
map <F7> :w<CR>:!/bin/sh -x %<CR>
map <F8> :w<CR>:!perl -c %<CR>
map <F9> :w<CR>:!perl %<CR>
map <F4> :emenu <C-Z>
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map ,1 a# $Id: <C-R>=expand("%:t")<CR>,v 1.0.0 <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR> Cnangel Exp $<CR><ESC>
map ,2 a/**<ESC>o * <ESC>o* <ESC>o*/<ESC>2ka
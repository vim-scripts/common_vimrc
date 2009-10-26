" $Id: .vimrc,v 1.1.0 2009/10/26 18:01:32 Cnangel Exp $
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
set smartindent

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

set nrformats=hex

set showmode
set showmatch
set hidden

"打开文件时自动回到上次编辑位置
"if has("autocmd")
"	autocmd BufRead *.txt set tw=78
"	autocmd BufReadPost *
"		\ if line("'\"") > 0 && line ("'\"") <= line("$") |
"		\ exe "normal g'\"" |
"		\ endif
"endif

if has("win32")
	set path=.,C:\Program\\\ Files\Microsoft\\\ Visual\\\ Studio\\\ .NET\\\ 2003\Vc7\include,,
else
	set path=.,/usr/include,/usr/lib/gcc/i586-redhat-linux/4.4.0/include,/usr/lib/gcc/i586-redhat-linux/3.4.6/include,,
endif


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
"set hlsearch
set incsearch

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
"set directory=~/tmp

"设置配色方案，colorscheme可以设置，但我总提示找不到
"source $VIMRUNTIME/colors/slate.vim
"colorscheme nightflight
"colorscheme desert
"highlight Comment ctermfg=Lightred
"hi Normal ctermfg=252 ctermbg=237 term=standout
"colorscheme greens " http://elephant.linux.net.cn/files/greens.vim
highlight Comment ctermfg=Lightred
"colorscheme evening 
"hi Normal ctermfg=grey ctermbg=black
"hi Visual ctermfg=green ctermbg=black
"hi Search term=reverse cterm=standout ctermfg=green  ctermbg=yellow
"hi IncSearch term=reverse cterm=standout ctermfg=green ctermbg=yellow


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

set whichwrap=b,s,h,l,<,>,[,]
"set wildmenu
"set wildcharm=<C-Z>
"set wrap
"autocmd BufReadPost ~/MLPlatform/* set tags+=~/.vim/tags.MLPlatform
set tag+=~/.vim/tags.include,~/.vim/tags.gcc,~/.vim/tags.local,~/.vim/tags.kernel,~/.vim/moretags.gcc

"设定文件浏览器目录为当前目录
"set bsdir=buffer
"set autochdir

" C/C++注释
"set comments=://
" 修正自动C式样注释功能
"set comments=s1:/*,mb:*,ex0:/

" 命令行高度
"set cmdheight=1

" 最近文件储存的地点
"set MRU_File=~/.vim/.vim_mru_files

"set nocompatible
"set backspace=indent,eol,start

map <F6> a<C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR><ESC>
map <F7> :w<CR>:!/bin/sh -x %<CR>
map <F8> :w<CR>:!perl -c %<CR>
map <C-F8> :w<CR>:!perl %<CR>
map <F4> :emenu <C-Z>
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map ,1 a# $Id: <C-R>=expand("%:t")<CR>,v 1.0.0-0 <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR> Cnangel Exp $<CR><ESC>
map ,2 gg\|i<CR><ESC>ka/**<CR><ESC>\|Di * Copyright(c) <C-R>=strftime("%Y")<CR> Alibaba Company, All Rights Reserved.<CR><ESC>\|Di * <CR><ESC>\|Di * @Filename: <C-R>=expand("%:t")<CR><CR><ESC>\|Di * @Description:<CR><ESC>\|Di * @Author: cnangel<CR><ESC>\|Di * @Version: 1.0.0<CR><ESC>\|Di * @Time: <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR><CR><ESC>\|Di */<CR><ESC>\|D:w<CR>5k$a
map ,3 a/**<CR><ESC>\|Di * @param <ESC>yyppppo<ESC>\|Di */<ESC>5k$a
map ,4 o<ESC>\|Da* <ESC>:language time C<CR>a<C-R>=strftime("%a %b %d %Y")<CR> Cnangel <junliang.li@alibaba-inc.com> 1.0.0-1<ESC>o<ESC>\|Da- 
map ,5 gg\|i<CR><ESC>ka/**<CR><ESC>\|Di * Copyright(c) <C-R>=strftime("%Y")<CR> Alibaba Company, All Rights Reserved.<CR><ESC>\|Di * <CR><ESC>\|Di * @file <C-R>=expand("%:t")<CR><CR><ESC>\|Di * @details <CR><ESC>\|Di * @author cnangel<CR><ESC>\|Di * @version 1.0.0<CR><ESC>\|Di * @date <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR><CR><ESC>\|Di */<CR><ESC>\|D:w<CR>5k$a

map ,u gg/\d\{4\}\/\(\d\{2\}[\/[:space:]\:]\)\{4\}\d\{2\}<CR>19xh<F6><C-o>
map ,v Go<ESC>\|Do<ESC>\|a/*<CR><ESC>\|Di * Local variables:<CR><ESC>\|Di * tab-width: 4<CR><ESC>\|Di * c-basic-offset: 4<CR><ESC>\|Di * End:<CR><ESC>\|Di * vim600: noet sw=4 ts=4 fdm=marker<CR><ESC>\|Di * vim<600: noet sw=4 ts=4<CR><ESC>\|Di */<CR><ESC><C-o>

nmap <C-N> :tnext<cr>
nmap <C-P> :tprev<cr>
map ,m :emenu <C-Z>
map! ,n <C-O>:emenu <C-Z>

map ,, :A<CR>
map ,- :AS<CR>
map ,\| :AV<CR>

" javabrowser
" 说明 ctags 程序的路径
let JavaBrowser_Ctags_Cmd = '/usr/bin/ctags'
" 假如 vim 不是 gui 版的, 那么可以做如下设置, 它将不改变窗口
let JavaBrowser_Inc_Winwidth = 0 
let JavaBrowser_Use_Icon = 1
nmap ,j :JavaBrowser<CR>
imap ,j <ESC>,j

nmap <C-N> :tnext<CR>
nmap <C-P> :tprev<CR>

" jcommenter
"autocmd FileType java let b:jcommenter_class_author='cnangel (junliang.li@alibaba-inc.com)'
"autocmd FileType java let b:jcommenter_file_author='cnangel (junliang.li@alibaba-inc.com)'
"autocmd FileType java source ~/.vim/macros/jcommenter.vim
"autocmd FileType java map 'c :call JCommentWriter()<CR> 

" vim jde
"autocmd FileType java :call VjdeJavaNewProject()
"let g:vjde_completion_key='<c-space>'

"function JavaSetting()
"	iab <buffer> sysout System.out.println
"	iab <buffer> main public static void main(String argv[]){<CR>}
"	iab <buffer> sync synchronized
"	iab <buffer> r return;<Esc>hi
"	iab <buffer> w while(){<CR><CR>}<Esc>kk6li
"	iab <buffer> s String
"	iab <buffer> ifi if(){<CR><CR>}<Esc>kk3li
"	iab <buffer> el else{<CR><CR>}<Esc>kk3li
"	iab <buffer> ife if(){<CR><CR>} else{<CR><CR>}<Esc>5k3li
"	iab <buffer> fori for(int i=0;i< ;i++){<CR><CR>}<Esc>kk15li
"endfunction 
"autocmd FileType java :call JavaSetting()

" 取消之前的 autocmd 
":autocmd!
" 假如编辑的是 java 文件, 那么读入 java.vim 的宏定义(定义的内容下节说明) 
"autocmd FileType java source ~/.vim/files/java.vim
" 假如编辑的是 java 文件, 那么读入 jcommenter.vim 定义 
"autocmd FileType java source ~/.vim/macros/jcommenter.vim
" 在新建 java 文件时, 预先将 java.skel 的内容复制进来 
"autocmd BufNewFile *.java 0r ~/.vim/files/skeletons/java.skel
" 在读入 java.skel 内容后, 运行 gnp 这个宏命令 
"autocmd BufNewFile *.java normal gnp

" tmp map
"map ,. gg/gettext<CR>wigetlanguage <ESC>:w<CR>/\(^#.*\)\@<!en_us<CR>gg
"map ,m /\(^#.*\)\@<!en_us<CR>\|yyi#<ESC>pf=/gettext<CR>isprintf( <ESC>fudiwi%s<ESC>f)a, getl<C-x><C-p>() )<ESC>:w<CR>?\(^#.*\)\@<=en_us<CR>j\|
"map ,n \|yyi#<ESC>p\|/gettext<CR>isprintf( <ESC>fudiwi%s<ESC>f)a, getl<C-x><C-p>() )<ESC>:w<CR>?\(^#.*\)\@<=en_us<CR>j\|
"map ,b /gettext<CR>isprintf( <ESC>fudiwi%s<ESC>f)a, getl<C-x><C-p>() )<ESC>:w<CR>?\(^#.*\)\@<=en_us<CR>j\|

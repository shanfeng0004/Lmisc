set whichwrap=b,s,[,]
set incsearch

"taglist
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
map <silent> <F9> :TlistToggle<cr>

"NERD tree
nmap <F3> :NERDTree  <CR>
set autoindent
set cindent

set ts=4
set expandtab

"change comment color
hi Comment ctermfg = DarkGrey

"show row number
set number

set encoding=utf-8 termencoding=gbk fileencoding=utf-8

"resize vim window size
"nmap    w=  :resize +3<CR>
"nmap    w-  :resize -3<CR>
"nmap    w,  :vertical resize -3<CR>
"nmap    w.  :vertical resize +3<CR>

"防止自动注释
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"===========================================增加文件头配置================================================begin
"进行版权声明的设置
"添加或更新头
map <F4> :call TitleDet()<cr>'s
function AddTitle()
    call append(0,"/*******************************************************************************")
    call append(1,"*")
    call append(2,"* Author: qihuifeng")
    call append(3,"*")
    call append(4,"* QQ : 327775604")
    call append(5,"*")
    call append(6,"* Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(7,"*")
    call append(8,"* Filename: ".expand("%:t"))
    call append(9,"*")
    call append(10,"* Description: ")
    call append(11,"*")
    call append(12,"*******************************************************************************/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction
"===========================================增加文件头配置================================================end

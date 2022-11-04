" @author      : ewell (1424630446@qq.com)
" @file        : surround_c
" @created     : Wednesday Nov 02, 2022 23:21:54 CST 
" @github      : https://github.com/Leiyi548
" @description  : Thank c https://github.com/yaocccc/vim-surround/blob/master/plugin/surround.vim 
"
"
func! s:getCol(n1, n2)
    let c = 999
    for num in range(a:n1, a:n2)
        let pre = getline(num)
        let after = substitute(pre, '^\s*', '', '')
        let c = trim(pre) ==# '' ? c : min([c, len(pre) - len(after)])
    endfor
    return c
endf

func! s:getEmptyStr(len)
    let str = ''
    for i in range(1, a:len)
        let str .= ' '
    endfor
    return str
endf

func! s:isSelectLines()
    return col("'<") == 1 && col("'>") == len(getline(line("'>"))) + 1
endf

" visual mode add pairs
" 思路，将字符串分为3个部分
" 将2个括号插入
" visual mode add pairs
func! SurroundVaddPairs(left, right)
    let [c1, l1, c2, l2] = [col("'<"), line("'<"), col("'>"), line("'>")]
    let c2 = &selection == "exclusive" ? c2 - 1 : c2
    let [content1, content2] = [getline(l1), getline(l2)]
    if s:isSelectLines()
        let c = s:getCol(l1, l2)
        for num in range(l1, l2)
            let line = getline(num)
            call setline(num, s:getEmptyStr(&shiftwidth) . line)
        endfor
        echo [l1, l2]
        call appendbufline('%', l1 - 1, s:getEmptyStr(c) . a:left)
        call appendbufline('%', l2 + 1, s:getEmptyStr(c) . a:right)
    else 
        if l1 == l2
            let content_1 = c1 - 2 >= 0 ? content1[: c1 - 2] : ''
            let content_2 = content1[c1 - 1: c2 - 1]
            let content_3 = content1[c2: ]
            call setline(l1, content_1 . a:left . content_2 . a:right . content_3)
        else
            let content1_1 = c1 - 2 >= 0 ? content1[: c1 - 2] : ''
            let content2_1 = c2 - 1 >= 0 ? content2[: c2 - 1] : ''
            let content1_2 = content1[c1 - 1:]
            let content2_2 = content2[c2:]
            call setline(l1, content1_1 . a:left . content1_2)
            call setline(l2, content2_1 . a:right . content2_2)
        endif
    endif
endf
" keybindin xnoremap <silent> '      :<c-u>call SurroundVaddPairs("'", "'")<cr>
" :<c-u> 让vim看起来更像:这个行为
" 如果你在visual mode你选中一些文本的时候会出现范围，而c-u刚好就能去除它
xnoremap <silent> "      :<c-u>call SurroundVaddPairs('"', '"')<cr>
xnoremap <silent> `      :<c-u>call SurroundVaddPairs('`', '`')<cr>
xnoremap <silent> {      :<c-u>call SurroundVaddPairs('{', '}')<cr>
xnoremap <silent> }      :<c-u>call SurroundVaddPairs('{', '}')<cr>
xnoremap <silent> [      :<c-u>call SurroundVaddPairs('[', ']')<cr>
xnoremap <silent> ]      :<c-u>call SurroundVaddPairs('[', ']')<cr>
xnoremap <silent> (      :<c-u>call SurroundVaddPairs('(', ')')<cr>
xnoremap <silent> )      :<c-u>call SurroundVaddPairs('(', ')')<cr>

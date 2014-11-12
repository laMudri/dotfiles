" Inserts matching )]}'" after ([{'" iff that character is not already there
" unmatched
" Last Change:	2014 Mar 22
" Maintainer:	James Wood <laMudri@gmail.com>
" License:      Public domain

"if exists("g:loaded_autobracket")
"    echom "Stopped"
"    finish
"endif
let g:loaded_autobracket = 1

"if !hasmapto("<Plug>AutobracketGo")
"    map <unique> ( <Plug>AutobracketGo
"    map <unique> [ <Plug>AutobracketGo
"    map <unique> { <Plug>AutobracketGo
"    map <unique> ' <Plug>AutobracketGo
"    map <unique> " <Plug>AutobracketGo
"endif
"inoremap <unique> <script> <Plug>AutobracketGo <SID>Go

inoremap ( (<ESC>:call Go()<CR>
inoremap [ [<ESC>:call Go()<CR>
inoremap { {<ESC>:call Go()<CR>
inoremap ' '<ESC>:call Go()<CR>
inoremap " "<ESC>:call Go()<CR>

function! Go()
    stopinsert
    let pos0 = getpos(".")
    let char = getline(".")[col(".") - 1]
    if col(".") == col("$") - 1 || char =~ "[(\[{'\"]"
        exe "norm! [" . char
        let pos1 = getpos(".")
        if pos0 != pos1
            norm! %
            let pos2 = getpos(".")
            call setpos(".", pos0)
            if pos1 == pos2
                exe "norm! a" . MatchOf(char) . "\<ESC>"
            endif
        endif
        call setpos(".", pos0)
        call Append()
    endif
endfunction

function! Append()
    if col(".") == col("$") - 1
        startinsert!
    else
        norm! l
        startinsert
    endif
endfunction

function! MatchOf(char)
    if a:char == "("
        return ")"
    elseif a:char == "["
        return "]"
    elseif a:char == "{"
        return "}"
    elseif a:char == "'"
        return "'"
    elseif a:char == '"'
        return '"'
    else
        return ""
    endif
endfunction

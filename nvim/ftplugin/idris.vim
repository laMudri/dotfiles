" t - show type
nnoremap <LocalLeader>t :call IdrisShowType()<ENTER>
" r - reload
nnoremap <LocalLeader>r :call IdrisReload(0)<ENTER>
" c - case split
nnoremap <LocalLeader>c :call IdrisCaseSplit()<ENTER>
" d - create initial pattern match
nnoremap <LocalLeader>d 0:call search(":")<ENTER>b:call IdrisAddClause(0)<ENTER>w
" b - less good version of \d, AFAICT
nnoremap <LocalLeader>b 0w:call IdrisAddClause(0)<ENTER>
" m - add missing
nnoremap <LocalLeader>y :call IdrisAddMissing()<ENTER>
" md - make proof clause
nnoremap <LocalLeader>u 0:call search(":")<ENTER>b:call IdrisAddClause(1)<ENTER>w
" f - refine hole
nnoremap <LocalLeader>f :call IdrisRefine()<ENTER>
" o - prove obvious
nnoremap <LocalLeader>v :call IdrisProofSearch(0)<ENTER>
" p - proof search
nnoremap <LocalLeader>p :call IdrisProofSearch(1)<ENTER>
" l - make lemma
nnoremap <LocalLeader>a :call IdrisMakeLemma()<ENTER>
" e - evaluate expression
nnoremap <LocalLeader>x :call IdrisEval()<ENTER>
" w - make with
nnoremap <LocalLeader>w 0:call IdrisMakeWith()<ENTER>
" mc - make case
nnoremap <LocalLeader>g :call IdrisMakeCase()<ENTER>
" i - show idris response window
nnoremap <LocalLeader>s 0:call IdrisResponseWin()<ENTER>
" h - show documentation
nnoremap <LocalLeader>; :call IdrisShowDoc()<ENTER>

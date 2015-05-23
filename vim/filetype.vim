" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.ijs,*.ijt,*.ijp,*.ijx        setfiletype j
  au BufRead,BufNewFile *.hoq setfiletype hoq
augroup END

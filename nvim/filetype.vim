" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.ijs,*.ijt,*.ijp,*.ijx        setfiletype j
  au BufRead,BufNewFile *.hoq setfiletype hoq
  au BufRead,BufNewFile *?Script.sml let maplocalleader = "\\" | source /home/james/.vim/hol/hol.vim
  "Uncomment the line below to automatically load Unicode
  au BufRead,BufNewFile *?Script.sml source /nix/store/n8z4p2747mqhiqfs86qq7bhagv4ylz8b-hol4-k.10/src/hol-kananaskis-10/tools/vim/holabs.vim
augroup END


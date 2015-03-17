;;; bk-pentadactyl-mode.el --- Simple mode for `.pentadactylrc'

;; Copyright (C) 2012 by Boris Kheyfets

;; Author: kheyf boris (at) gmail com
;; Version: 0.2
;; Time-stamp: <2012-Oct-12 kheyfboris>

;; This file is NOT part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Usage:

;; Load the mode via 
;;
;;   (require 'bk-pentadactyl-mode)
;;
;; in your .emacs.  Be sure to have it in a known path, e.g., like so:
;;
;; (setq load-path (append load-path '("~/.emacs.d/site-lisp/")))

;;; Features:

;; * Simple syntax-highlighting
;; * comment-dwim toggles comment region
;; * Tab completion with Esc-Tab, C-M-i
;; * File association for .pentadactylrc

;;; Code:

(defvar bk-pentadactyl-mode-hook nil)


;; the command to comment/uncomment text
;; (defun bk-pentadactyl-comment-dwim (arg)
;; "Comment or uncomment current line or region in a smart way. For detail, see `comment-dwim'."
;;    (interactive "*P")
;;    (require 'newcomment)
;;    (let ((deactivate-mark nil) (comment-start "\"") (comment-end ""))
;;      (comment-dwim arg)))


(defvar pentadactyl-options
  '("activate" "altwildmode" "autocomplete" "banghist" "cdpath" "complete" "cookieaccept" "cookielifetime" "cookies" "defsearch" "downloadsort" "editor" "encoding" "errorbells" "eventignore" "exrc" "extendedhinttags" "fileencoding" "findcase" "findflags" "followhints" "fullscreen" "guioptions" "helpfile" "hintinputs" "hintkeys" "hintmatching" "hinttags" "hinttimeout" "history" "hlfind" "incfind" "insertmode" "iskeyword" "jsdebugger" "jumptags" "linenumbers" "loadplugins" "mapleader" "maxitems" "messages" "more" "newtab" "nextpattern" "online" "pageinfo" "passkeys" "passunknown" "popups" "previouspattern" "private browsing" "runtimepath" "sanitizeitems" "sanitizeshutdown" "sanitizetimespan" "scroll" "scrollsteps" "scrolltime" "shell" "shellcmdflag" "showmode" "showstatuslinks" "showtabline" "spelllang" "strictfocus" "suggestengines" "timeout" "timeoutlen" "titlestring" "urlseparator" "usermode" "verbose" "visualbell" "wildanchor" "wildcase" "wildignore" "wildmode" "wildsort" "wordseparators" "yankshort"))

(defvar pentadactyl-functions
  '("abbreviate" "addons" "autocmd" "back" "background" "bdelete" "blistkeys" "bmap" "bmark" "bmarks" "bnoremap" "buffer" "buffers" "bunmap" "cabbreviate" "caretlistkeys" "caretmap" "caretnoremap" "caretunmap" "cd" "clistkeys" "cmap" "cnoremap" "colorscheme" "command" "completions" "contexts" "cookies" "cunabbreviate" "cunmap" "delbmarks" "delcommand" "delgroup" "delmacros" "delmarks" "delqmarks" "delstyle" "dialog" "dlclear" "doautoall" "doautocmd" "downloads" "echo" "echoerr" "echomsg" "else" "endif only if the previous conditionals were not executed" "elseif, or argument returns true" "emenu" "execute" "exit" "extadd" "extdelete" "extdisable" "extenable" "extoptions" "extrehash" "exttoggle" "extupdate" "feedkeys" "finish" "forward" "frameonly" "group" "hardcopy" "help" "helpall" "highlight" "history" "iabbreviate" "ilistkeys" "imap" "inoremap" "iunabbreviate" "iunmap" "javascript" "jumps" "keepalt" "let" "listcommands" "listkeys" "listoptions" "loadplugins" "macros" "map" "mark" "marks" "messages" "messclear" "mkpentadactylrc" "mksyntax" "mlistkeys" "mmap" "mnoremap" "munmap" "nlistkeys" "nmap" "nnoremap" "nohlfind" "noremap" "normal" "nunmap" "olistkeys" "omap" "onoremap" "open" "ounmap" "pageinfo" "pagestyle" "pintab" "preferences" "pwd" "qmark" "qmarks" "quit" "quitall" "redraw" "registers" "rehash" "reload" "reloadall" "restart" "runtime" "sanitize" "saveas" "sbclose" "scriptnames" "set" "setglobal" "setlocal" "sidebar" "silent" "source" "stop" "stopall" "style" "styledisable" "styleenable" "styletoggle" "tab" "tabattach" "tabclose" "tabdetach" "tabdo" "tabduplicate" "tablast" "tabmove" "tabnext" "tabonly" "tabopen" "tabprevious" "tabrewind" "time" "tlistkeys" "tmap" "tnoremap" "toolbarhide" "toolbarshow" "toolbartoggle" "tunmap" "unabbreviate" "undo" "undoall" "unlet" "unmap" "unpintab" "verbose" "version" "viewsource" "vlistkeys" "vmap" "vnoremap" "vunmap" "winclose" "window" "winonly" "winopen" "wqall" "yank" "zoom"))


(defvar bk-pentadactyl-key-words
 `(
   ( ,(regexp-opt pentadactyl-options 'words) . font-lock-keyword-face)
   ( ,(regexp-opt pentadactyl-functions 'words) . font-lock-function-name-face)
  ))

;; keywords for tab-completion with M-Tab. Since Alt-Tab is taken by OS, use Esc-Tab
(defvar bk-pentadactyl-keyword-list (append pentadactyl-options pentadactyl-functions))

(defun bk-pentadactyl-complete-symbol ()
  "Perform keyword completion on word before cursor."
  (interactive)
  (let ((posEnd (point))
        (meat (thing-at-point 'symbol))
        maxMatchResult)
    ;; when nil, set it to empty string, so user can see all lang's keywords.
    ;; if not done, try-completion on nil result lisp error.
    (when (not meat) (setq meat ""))
    (setq maxMatchResult (try-completion meat bk-pentadactyl-keyword-list nil))
    (cond ((eq maxMatchResult t))
          ((null maxMatchResult)
           (message "Can't find completion for “%s”" meat)
           (ding))
          ((not (string= meat maxMatchResult))
           (delete-region (- posEnd (length meat)) posEnd)
           (insert maxMatchResult))
          (t 
           (message "Making completion list…")
           (with-output-to-temp-buffer "*Completions*"
             (display-completion-list 
              (all-completions meat bk-pentadactyl-keyword-list)))
           (message "Making completion list…%s" "done")))))


(setq auto-mode-alist
      (append '(("\\.pentadactylrc$" . bk-pentadactyl-mode))
              auto-mode-alist))


;; define the major mode.
(define-derived-mode bk-pentadactyl-mode fundamental-mode
  (setq font-lock-defaults '(bk-pentadactyl-key-words))
  (font-lock-add-keywords nil '(("\\(\".+?\"\\)" 1 font-lock-string-face)))
  (font-lock-add-keywords nil '(("\\(<.+?>\\)" 1 font-lock-variable-name-face)))
  (font-lock-add-keywords nil '(("^\".+" . font-lock-comment-face)))
  (setq mode-name "bk-pentadactyl-mode")


  ;; modify the keymap
  ;; (define-key bk-pentadactyl-mode-map [remap comment-dwim] 'bk-pentadactyl-comment-dwim)
  (define-key bk-pentadactyl-mode-map [remap complete-symbol] 'bk-pentadactyl-complete-symbol)

  ;; comments
  (set (make-local-variable 'comment-start) "\"")
  (set (make-local-variable 'comment-start-skip) "\"")
  (modify-syntax-entry ?\" "w" bk-pentadactyl-mode-syntax-table)
  (modify-syntax-entry ?\n "> b" bk-pentadactyl-mode-syntax-table)
  )


(provide 'bk-pentadactyl-mode)


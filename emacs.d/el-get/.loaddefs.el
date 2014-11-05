;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (ace-jump-mode ace-jump-line-mode ace-jump-word-mode
;;;;;;  ace-jump-char-mode ace-jump-mode-pop-mark) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/ace-jump-mode/ace-jump-mode"
;;;;;;  "ace-jump-mode/ace-jump-mode.el" "2ac13d0fa7db7d7b77db39a91a7756d2")
;;; Generated autoloads from ace-jump-mode/ace-jump-mode.el

(autoload 'ace-jump-mode-pop-mark "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/ace-jump-mode/ace-jump-mode" "\
Pop up a postion from `ace-jump-mode-mark-ring', and jump back to that position

\(fn)" t nil)

(autoload 'ace-jump-char-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/ace-jump-mode/ace-jump-mode" "\
AceJump char mode

\(fn QUERY-CHAR)" t nil)

(autoload 'ace-jump-word-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/ace-jump-mode/ace-jump-mode" "\
AceJump word mode.
You can set `ace-jump-word-mode-use-query-char' to nil to prevent
asking for a head char, that will mark all the word in current
buffer.

\(fn HEAD-CHAR)" t nil)

(autoload 'ace-jump-line-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/ace-jump-mode/ace-jump-mode" "\
AceJump line mode.
Marked each no empty line and move there

\(fn)" t nil)

(autoload 'ace-jump-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/ace-jump-mode/ace-jump-mode" "\
AceJump mode is a minor mode for you to quick jump to a
position in the curret view.
   There is three submode now:
     `ace-jump-char-mode'
     `ace-jump-word-mode'
     `ace-jump-line-mode'

You can specify the sequence about which mode should enter
by customize `ace-jump-mode-submode-list'.

If you do not want to query char for word mode, you can change
`ace-jump-word-mode-use-query-char' to nil.

If you don't like the default move keys, you can change it by
setting `ace-jump-mode-move-keys'.

You can constrol whether use the case sensitive via
`ace-jump-mode-case-fold'.

\(fn &optional PREFIX)" t nil)

;;;***

;;;### (autoloads (turn-on-bib-cite bib-cite-minor-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/bib-cite"
;;;;;;  "auctex/bib-cite.el" "fc46c46f400a42af007fd42ce73395be")
;;; Generated autoloads from auctex/bib-cite.el

(autoload 'bib-cite-minor-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/bib-cite" "\
Toggle bib-cite mode.
When bib-cite mode is enabled, citations, labels and refs are highlighted
when the mouse is over them.  Clicking on these highlights with [mouse-2]
runs bib-find, and [mouse-3] runs bib-display.

\(fn ARG)" t nil)

(autoload 'turn-on-bib-cite "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/bib-cite" "\
Unconditionally turn on Bib Cite mode.

\(fn)" nil nil)

;;;***

;;;### (autoloads (context-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/context"
;;;;;;  "auctex/context.el" "aaede47229785ee362c712c6887cc44f")
;;; Generated autoloads from auctex/context.el

(defalias 'ConTeXt-mode 'context-mode)

(autoload 'context-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/context" "\
Major mode in AUCTeX for editing ConTeXt files.

Special commands:
\\{ConTeXt-mode-map}

Entering `context-mode' calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of ConTeXt-mode-hook.

\(fn)" t nil)

;;;***

;;;### (autoloads (context-en-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/context-en"
;;;;;;  "auctex/context-en.el" "5ac2595246062777c61ed4104a93cf61")
;;; Generated autoloads from auctex/context-en.el

(autoload 'context-en-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/context-en" "\
Major mode for editing files for ConTeXt using its english interface.

Special commands:
\\{ConTeXt-mode-map}

Entering `context-mode' calls the value of `text-mode-hook',
then the value of TeX-mode-hook, and then the value
of context-mode-hook.

\(fn)" t nil)

;;;***

;;;### (autoloads (context-nl-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/context-nl"
;;;;;;  "auctex/context-nl.el" "f5ed983cd477814f04e4a63affd4f323")
;;; Generated autoloads from auctex/context-nl.el

(autoload 'context-nl-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/context-nl" "\
Major mode for editing files for ConTeXt using its dutch interface.

Special commands:
\\{ConTeXt-mode-map}

Entering `context-mode' calls the value of `text-mode-hook',
then the value of TeX-mode-hook, and then the value
of context-mode-hook.

\(fn)" t nil)

;;;***

;;;### (autoloads (font-latex-setup) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/font-latex"
;;;;;;  "auctex/font-latex.el" "2f06608b82005569dd347d3534c206e3")
;;; Generated autoloads from auctex/font-latex.el

(autoload 'font-latex-setup "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/font-latex" "\
Setup this buffer for LaTeX font-lock.  Usually called from a hook.

\(fn)" nil nil)

;;;***

;;;### (autoloads (docTeX-mode TeX-latex-mode BibTeX-auto-store)
;;;;;;  "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/latex"
;;;;;;  "auctex/latex.el" "20e658abb9ce0845f0c019a8324015ce")
;;; Generated autoloads from auctex/latex.el

(autoload 'BibTeX-auto-store "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/latex" "\
This function should be called from `bibtex-mode-hook'.
It will setup BibTeX to store keys in an auto file.

\(fn)" nil nil)

(add-to-list 'auto-mode-alist '("\\.drv\\'" . latex-mode))

(autoload 'TeX-latex-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/latex" "\
Major mode in AUCTeX for editing LaTeX files.
See info under AUCTeX for full documentation.

Special commands:
\\{LaTeX-mode-map}

Entering LaTeX mode calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of `LaTeX-mode-hook'.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.dtx\\'" . doctex-mode))

(autoload 'docTeX-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/latex" "\
Major mode in AUCTeX for editing .dtx files derived from `LaTeX-mode'.
Runs `LaTeX-mode', sets a few variables and
runs the hooks in `docTeX-mode-hook'.

\(fn)" t nil)

(defalias 'TeX-doctex-mode 'docTeX-mode)

;;;***

;;;### (autoloads (multi-prompt-key-value multi-prompt) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/multi-prompt"
;;;;;;  "auctex/multi-prompt.el" "ec1c94ddf907b2d0fe04131a14dd9397")
;;; Generated autoloads from auctex/multi-prompt.el

(autoload 'multi-prompt "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/multi-prompt" "\
Completing prompt for a list of strings.  
The first argument SEPARATOR should be the string (of length 1) to
separate the elements in the list.  The second argument UNIQUE should
be non-nil, if each element must be unique.  The remaining elements
are the arguments to `completing-read'.  See that.

\(fn SEPARATOR UNIQUE PROMPT TABLE &optional MP-PREDICATE REQUIRE-MATCH INITIAL HISTORY)" nil nil)

(autoload 'multi-prompt-key-value "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/multi-prompt" "\
Read multiple strings, with completion and key=value support.
PROMPT is a string to prompt with, usually ending with a colon
and a space.  TABLE is an alist.  The car of each element should
be a string representing a key and the optional cdr should be a
list with strings to be used as values for the key.

See the documentation for `completing-read' for details on the
other arguments: PREDICATE, REQUIRE-MATCH, INITIAL-INPUT, HIST,
DEF, and INHERIT-INPUT-METHOD.

The return value is the string as entered in the minibuffer.

\(fn PROMPT TABLE &optional PREDICATE REQUIRE-MATCH INITIAL-INPUT HIST DEF INHERIT-INPUT-METHOD)" nil nil)

;;;***

;;;### (autoloads (ams-tex-mode TeX-plain-tex-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/plain-tex"
;;;;;;  "auctex/plain-tex.el" "f779fa6e1110cb9255a3a5adacf8911c")
;;; Generated autoloads from auctex/plain-tex.el

(autoload 'TeX-plain-tex-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/plain-tex" "\
Major mode in AUCTeX for editing plain TeX files.
See info under AUCTeX for documentation.

Special commands:
\\{plain-TeX-mode-map}

Entering `plain-tex-mode' calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of plain-TeX-mode-hook.

\(fn)" t nil)

(autoload 'ams-tex-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/plain-tex" "\
Major mode in AUCTeX for editing AmS-TeX files.
See info under AUCTeX for documentation.

Special commands:
\\{AmSTeX-mode-map}

Entering AmS-tex-mode calls the value of `text-mode-hook',
then the value of `TeX-mode-hook', and then the value
of `AmS-TeX-mode-hook'.

\(fn)" t nil)

;;;***

;;;### (autoloads (preview-report-bug LaTeX-preview-setup preview-install-styles)
;;;;;;  "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/preview/preview"
;;;;;;  "auctex/preview/preview.el" "6bfb4efa5a4104080943dc3009908537")
;;; Generated autoloads from auctex/preview/preview.el

(autoload 'preview-install-styles "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/preview/preview" "\
Installs the TeX style files into a permanent location.
This must be in the TeX search path.  If FORCE-OVERWRITE is greater
than 1, files will get overwritten without query, if it is less
than 1 or nil, the operation will fail.  The default of 1 for interactive
use will query.

Similarly FORCE-SAVE can be used for saving
`preview-TeX-style-dir' to record the fact that the uninstalled
files are no longer needed in the search path.

\(fn DIR &optional FORCE-OVERWRITE FORCE-SAVE)" t nil)

(autoload 'LaTeX-preview-setup "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/preview/preview" "\
Hook function for embedding the preview package into AUCTeX.
This is called by `LaTeX-mode-hook' and changes AUCTeX variables
to add the preview functionality.

\(fn)" nil nil)
 (add-hook 'LaTeX-mode-hook #'LaTeX-preview-setup)

(autoload 'preview-report-bug "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/preview/preview" "\
Report a bug in the preview-latex package.

\(fn)" t nil)

;;;***

;;;### (autoloads (TeX-submit-bug-report TeX-auto-generate-global
;;;;;;  TeX-auto-generate TeX-tex-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex"
;;;;;;  "auctex/tex.el" "40ecef6a8f7f087f7c16d8af1e3efd95")
;;; Generated autoloads from auctex/tex.el

(defalias 'TeX-assoc-string (symbol-function (if (featurep 'xemacs) 'assoc 'assoc-string)))

(autoload 'TeX-tex-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex" "\
Major mode in AUCTeX for editing TeX or LaTeX files.
Tries to guess whether this file is for plain TeX or LaTeX.

The algorithm is as follows:

   1) if the file is empty or `TeX-force-default-mode' is not set to nil,
      `TeX-default-mode' is chosen
   2) If \\documentstyle or \\begin{, \\section{, \\part{ or \\chapter{ is
      found, `latex-mode' is selected.
   3) Otherwise, use `plain-tex-mode'

\(fn)" t nil)

(autoload 'TeX-auto-generate "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex" "\
Generate style file for TEX and store it in AUTO.
If TEX is a directory, generate style files for all files in the directory.

\(fn TEX AUTO)" t nil)

(autoload 'TeX-auto-generate-global "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex" "\
Create global auto directory for global TeX macro definitions.

\(fn)" t nil)

(autoload 'TeX-submit-bug-report "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex" "\
Submit a bug report on AUCTeX via mail.

Don't hesitate to report any problems or inaccurate documentation.

If you don't have setup sending mail from (X)Emacs, please copy the
output buffer into your mail program, as it gives us important
information about your AUCTeX version and AUCTeX configuration.

\(fn)" t nil)

;;;***

;;;### (autoloads (LaTeX-install-toolbar TeX-install-toolbar) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex-bar"
;;;;;;  "auctex/tex-bar.el" "d15072908452a8022622ddba3f6537d2")
;;; Generated autoloads from auctex/tex-bar.el

(autoload 'TeX-install-toolbar "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex-bar" "\
Install toolbar buttons for TeX mode.

\(fn)" t nil)

(autoload 'LaTeX-install-toolbar "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex-bar" "\
Install toolbar buttons for LaTeX mode.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex-fold"
;;;;;;  "auctex/tex-fold.el" "48c6d153797c587ee9fadcda90acb39c")
;;; Generated autoloads from auctex/tex-fold.el
 (autoload 'TeX-fold-mode "tex-fold" "Minor mode for hiding and revealing macros and environments." t)

(defalias 'tex-fold-mode 'TeX-fold-mode)

;;;***

;;;### (autoloads (tex-font-setup) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex-font"
;;;;;;  "auctex/tex-font.el" "6cb30f3aa1f7aba735901cdeb6615049")
;;; Generated autoloads from auctex/tex-font.el

(autoload 'tex-font-setup "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex-font" "\
Setup font lock support for TeX.

\(fn)" nil nil)

;;;***

;;;### (autoloads (TeX-texinfo-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex-info"
;;;;;;  "auctex/tex-info.el" "8a7097073dbb4710053094f8d9479b7e")
;;; Generated autoloads from auctex/tex-info.el

(defalias 'Texinfo-mode 'texinfo-mode)

(autoload 'TeX-texinfo-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex-info" "\
Major mode in AUCTeX for editing Texinfo files.

Special commands:
\\{Texinfo-mode-map}

Entering Texinfo mode calls the value of `text-mode-hook'  and then the
value of `Texinfo-mode-hook'.

\(fn)" t nil)

;;;***

;;;### (autoloads (japanese-latex-mode japanese-plain-tex-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex-jp"
;;;;;;  "auctex/tex-jp.el" "66e49ee3fef708a1ebff45997b73ec2b")
;;; Generated autoloads from auctex/tex-jp.el

(autoload 'japanese-plain-tex-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex-jp" "\
Major mode in AUCTeX for editing Japanese plain TeX files.
Set `japanese-TeX-mode' to t, and enter `TeX-plain-tex-mode'.

\(fn)" t nil)

(autoload 'japanese-latex-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/tex-jp" "\
Major mode in AUCTeX for editing Japanese LaTeX files.
Set `japanese-TeX-mode' to t, and enter `TeX-latex-mode'.

\(fn)" t nil)

;;;***

;;;### (autoloads (texmathp-match-switch texmathp) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/texmathp"
;;;;;;  "auctex/texmathp.el" "39e6000daf5c9c5ac7bb7fe6da506713")
;;; Generated autoloads from auctex/texmathp.el

(autoload 'texmathp "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/texmathp" "\
Determine if point is inside (La)TeX math mode.
Returns t or nil.  Additional info is placed into `texmathp-why'.
The functions assumes that you have (almost) syntactically correct (La)TeX in
the buffer.
See the variable `texmathp-tex-commands' about which commands are checked.

\(fn)" t nil)

(autoload 'texmathp-match-switch "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/texmathp" "\
Search backward for any of the math switches.
Limit searched to BOUND.

\(fn BOUND)" nil nil)

;;;***

;;;### (autoloads nil "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/auctex/toolbar-x"
;;;;;;  "auctex/toolbar-x.el" "b53a339031113a1cc21bde9000be3863")
;;; Generated autoloads from auctex/toolbar-x.el
 (autoload 'toolbarx-install-toolbar "toolbar-x")

;;;***

;;;### (autoloads (el-get-checksum el-get-make-recipes el-get-cd
;;;;;;  el-get-self-update el-get-update-packages-of-type el-get-update-all
;;;;;;  el-get-version) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/el-get/el-get"
;;;;;;  "el-get/el-get.el" "af6fb026ece3eee11c474bec3c00c2b8")
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/el-get/el-get" "\
Message the current el-get version

\(fn)" t nil)

(autoload 'el-get-update-all "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-update-packages-of-type "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/el-get/el-get" "\
Update all installed packages of type TYPE.

\(fn TYPE)" t nil)

(autoload 'el-get-self-update "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code.

\(fn)" t nil)

(autoload 'el-get-cd "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE &optional PACKAGE-STATUS-ALIST)" t nil)

;;;***

;;;### (autoloads (el-get-list-packages) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/el-get/el-get-list-packages"
;;;;;;  "el-get/el-get-list-packages.el" "963cec2f84795bf50d332403e97c20ca")
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

;;;***

;;;### (autoloads (evil-leader/set-key-for-mode evil-leader/set-key
;;;;;;  evil-leader-mode global-evil-leader-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/evil-leader/evil-leader"
;;;;;;  "evil-leader/evil-leader.el" "26b0ea6b79d0842cf07c293e8fa81244")
;;; Generated autoloads from evil-leader/evil-leader.el

(autoload 'global-evil-leader-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/evil-leader/evil-leader" "\
Global minor mode for <leader> support.

\(fn &optional ARG)" t nil)

(autoload 'evil-leader-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/evil-leader/evil-leader" "\
Minor mode to enable <leader> support.

\(fn &optional ARG)" t nil)

(autoload 'evil-leader/set-key "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/evil-leader/evil-leader" "\
Bind `key' to command `def' in `evil-leader/default-map'.

Key has to be readable by `read-kbd-macro' and `def' a command.
Accepts further `key' `def' pairs.

\(fn KEY DEF &rest BINDINGS)" t nil)

(autoload 'evil-leader/set-key-for-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/evil-leader/evil-leader" "\
Create keybindings for major-mode `mode' with `key' bound to command `def'.

See `evil-leader/set-key'.

\(fn MODE KEY DEF &rest BINDINGS)" t nil)

;;;***

;;;### (autoloads (evil-numbers/dec-at-pt evil-numbers/inc-at-pt)
;;;;;;  "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/evil-numbers/evil-numbers"
;;;;;;  "evil-numbers/evil-numbers.el" "110ab7e2ddcd99ba46d391b2386b4a56")
;;; Generated autoloads from evil-numbers/evil-numbers.el

(autoload 'evil-numbers/inc-at-pt "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/evil-numbers/evil-numbers" "\
Increment the number at point or after point before end-of-line by `amount'.
When region is selected, increment all numbers in the region by `amount'

NO-REGION is internal flag that allows
`evil-numbers/inc-at-point' to be called recursively when
applying the regional features of `evil-numbers/inc-at-point'.

\(fn AMOUNT &optional NO-REGION)" t nil)

(autoload 'evil-numbers/dec-at-pt "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/evil-numbers/evil-numbers" "\
Decrement the number at point or after point before end-of-line by `amount'.

If a region is active, decrement all the numbers at a point by `amount'.

This function uses `evil-numbers/inc-at-pt'

\(fn AMOUNT)" t nil)

;;;***

;;;### (autoloads nil "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/evil/evil-core"
;;;;;;  "evil/evil-core.el" "fe3660d5844839ce87c778fb252c8a80")
;;; Generated autoloads from evil/evil-core.el
 (autoload 'evil-mode "evil" "Toggle evil in all buffers" t)

;;;***

;;;### (autoloads (goto-last-change-reverse goto-last-change) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/goto-chg/goto-chg"
;;;;;;  "goto-chg/goto-chg.el" "ac249102dc519da040951dd8ed80f8cf")
;;; Generated autoloads from goto-chg/goto-chg.el

(autoload 'goto-last-change "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/goto-chg/goto-chg" "\
Go to the point where the last edit was made in the current buffer.
Repeat the command to go to the second last edit, etc.

To go back to more recent edit, the reverse of this command, use \\[goto-last-change-reverse]
or precede this command with \\[universal-argument] - (minus).

It does not go to the same point twice even if there has been many edits
there. I call the minimal distance between distinguishable edits \"span\".
Set variable `glc-default-span' to control how close is \"the same point\".
Default span is 8.
The span can be changed temporarily with \\[universal-argument] right before \\[goto-last-change]:
\\[universal-argument] <NUMBER> set current span to that number,
\\[universal-argument] (no number) multiplies span by 4, starting with default.
The so set span remains until it is changed again with \\[universal-argument], or the consecutive
repetition of this command is ended by any other command.

When span is zero (i.e. \\[universal-argument] 0) subsequent \\[goto-last-change] visits each and
every point of edit and a message shows what change was made there.
In this case it may go to the same point twice.

This command uses undo information. If undo is disabled, so is this command.
At times, when undo information becomes too large, the oldest information is
discarded. See variable `undo-limit'.

\(fn ARG)" t nil)

(autoload 'goto-last-change-reverse "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/goto-chg/goto-chg" "\
Go back to more recent changes after \\[goto-last-change] have been used.
See `goto-last-change' for use of prefix argument.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads (haskell-latex-mode haskell-latex-maybe) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-latex/haskell-latex"
;;;;;;  "haskell-latex/haskell-latex.el" "476cb580684f17dd104ed29cee02792e")
;;; Generated autoloads from haskell-latex/haskell-latex.el

(autoload 'haskell-latex-maybe "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-latex/haskell-latex" "\
Invoke `haskell-latex-mode' unless the buffer appears to use Bird tracks.
The criterion for Bird tracks is two consecutive lines with `>'
in column 0.
Suitable for adding to `haskell-mode-hook'.

\(fn)" nil nil)

(custom-add-option 'haskell-mode-hook 'haskell-latex-maybe)

(autoload 'haskell-latex-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-latex/haskell-latex" "\
Mode for editing `literate Haskell' with LaTeX conventions.

\(fn)" t nil)

;;;***

;;;### (autoloads (ghc-core-mode ghc-core-create-core) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/ghc-core"
;;;;;;  "haskell-mode/ghc-core.el" "65e8394e43c68ff9ec00042cafe4dce1")
;;; Generated autoloads from haskell-mode/ghc-core.el

(autoload 'ghc-core-create-core "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/ghc-core" "\
Compile and load the current buffer as tidy core.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.hcr\\'" . ghc-core-mode))

(autoload 'ghc-core-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/ghc-core" "\
Major mode for GHC Core files.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-align-imports) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-align-imports"
;;;;;;  "haskell-mode/haskell-align-imports.el" "6cfe8b1b30ad0e488e8e97438dab4d05")
;;; Generated autoloads from haskell-mode/haskell-align-imports.el

(autoload 'haskell-align-imports "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-align-imports" "\
Align all the imports in the buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-c-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-c"
;;;;;;  "haskell-mode/haskell-c.el" "182428eb7aa9aa917e3be4bb53c5c366")
;;; Generated autoloads from haskell-mode/haskell-c.el

(add-to-list 'auto-mode-alist '("\\.hsc\\'" . haskell-c-mode))

(autoload 'haskell-c-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-c" "\
Major mode for Haskell FFI files.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-cabal-visit-file haskell-cabal-get-dir
;;;;;;  haskell-cabal-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-cabal"
;;;;;;  "haskell-mode/haskell-cabal.el" "058eaa2958b47957912a8e13fd89ace4")
;;; Generated autoloads from haskell-mode/haskell-cabal.el

(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

(autoload 'haskell-cabal-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-cabal" "\
Major mode for Cabal package description files.

\(fn)" t nil)

(autoload 'haskell-cabal-get-dir "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-cabal" "\
Get the Cabal dir for a new project. Various ways of figuring this out,
   and indeed just prompting the user. Do them all.

\(fn)" nil nil)

(autoload 'haskell-cabal-visit-file "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-cabal" "\
Locate and visit package description file for file visited by current buffer.
This uses `haskell-cabal-find-file' to locate the closest
\".cabal\" file and open it.  This command assumes a common Cabal
project structure where the \".cabal\" file is in the top-folder
of the project, and all files related to the project are in or
below the top-folder.  If called with non-nil prefix argument
OTHER-WINDOW use `find-file-other-window'.

\(fn OTHER-WINDOW)" t nil)

;;;***

;;;### (autoloads (haskell-compile) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-compile"
;;;;;;  "haskell-mode/haskell-compile.el" "93ff87832c3a02ad19e6d2f9bf874a23")
;;; Generated autoloads from haskell-mode/haskell-compile.el

(autoload 'haskell-compile "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-compile" "\
Compile the Haskell program including the current buffer.
Tries to locate the next cabal description in current or parent
folders via `haskell-cabal-find-dir' and if found, invoke
`haskell-compile-cabal-build-command' from the cabal package root
folder. If no cabal package could be detected,
`haskell-compile-command' is used instead.

If prefix argument EDIT-COMMAND is non-nil (and not a negative
prefix `-'), `haskell-compile' prompts for custom compile
command.

If EDIT-COMMAND contains the negative prefix argument `-',
`haskell-compile' calls the alternative command defined in
`haskell-compile-cabal-build-alt-command' if a cabal package was
detected.

`haskell-compile' uses `haskell-compilation-mode' which is
derived from `compilation-mode'. See Info
node `(haskell-mode)compilation' for more details.

\(fn &optional EDIT-COMMAND)" t nil)

;;;***

;;;### (autoloads (haskell-decl-scan-mode turn-on-haskell-decl-scan
;;;;;;  haskell-ds-create-imenu-index) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-decl-scan"
;;;;;;  "haskell-mode/haskell-decl-scan.el" "448f2b5fd2a8794cb79bd8576fee93ea")
;;; Generated autoloads from haskell-mode/haskell-decl-scan.el

(autoload 'haskell-ds-create-imenu-index "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-decl-scan" "\
Function for finding `imenu' declarations in Haskell mode.
Finds all declarations (classes, variables, imports, instances and
datatypes) in a Haskell file for the `imenu' package.

\(fn)" nil nil)

(autoload 'turn-on-haskell-decl-scan "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-decl-scan" "\
Unconditionally activate `haskell-decl-scan-mode'.

\(fn)" t nil)

(autoload 'haskell-decl-scan-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-decl-scan" "\
Toggle Haskell declaration scanning minor mode on or off.
With a prefix argument ARG, enable minor mode if ARG is
positive, and disable it otherwise.  If called from Lisp, enable
the mode if ARG is omitted or nil, and toggle it if ARG is `toggle'.

See also info node `(haskell-mode)haskell-decl-scan-mode' for
more details about this minor mode.

Top-level declarations are scanned and listed in the menu item
\"Declarations\" (if enabled via option
`haskell-decl-scan-add-to-menubar').  Selecting an item from this
menu will take point to the start of the declaration.

\\[beginning-of-defun] and \\[end-of-defun] move forward and backward to the start of a declaration.

This may link with `haskell-doc-mode'.

For non-literate and LaTeX-style literate scripts, we assume the
common convention that top-level declarations start at the first
column.  For Bird-style literate scripts, we assume the common
convention that top-level declarations start at the third column,
ie. after \"> \".

Anything in `font-lock-comment-face' is not considered for a
declaration.  Therefore, using Haskell font locking with comments
coloured in `font-lock-comment-face' improves declaration scanning.

Literate Haskell scripts are supported: If the value of
`haskell-literate' (set automatically by `literate-haskell-mode')
is `bird', a Bird-style literate script is assumed.  If it is nil
or `tex', a non-literate or LaTeX-style literate script is
assumed, respectively.

Invokes `haskell-decl-scan-mode-hook' on activation.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (haskell-doc-show-type haskell-doc-current-info
;;;;;;  haskell-doc-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-doc"
;;;;;;  "haskell-mode/haskell-doc.el" "373becaca7b0cc3d30c0a1bacaf54fc0")
;;; Generated autoloads from haskell-mode/haskell-doc.el

(autoload 'haskell-doc-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-doc" "\
Enter `haskell-doc-mode' for showing fct types in the echo area.
See variable docstring.

\(fn &optional ARG)" t nil)

(defalias 'turn-on-haskell-doc-mode 'haskell-doc-mode)

(defalias 'turn-on-haskell-doc 'haskell-doc-mode)

(autoload 'haskell-doc-current-info "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-doc" "\
Return the info about symbol at point.
Meant for `eldoc-documentation-function'.

\(fn)" nil nil)

(autoload 'haskell-doc-show-type "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-doc" "\
Show the type of the function near point.
For the function under point, show the type in the echo area.
This information is extracted from the `haskell-doc-prelude-types' alist
of prelude functions and their types, or from the local functions in the
current buffer.

\(fn &optional SYM)" t nil)

;;;***

;;;### (autoloads (haskell-font-lock-choose-keywords) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-font-lock"
;;;;;;  "haskell-mode/haskell-font-lock.el" "87349c880ec108dd5050fc228cfaa1dd")
;;; Generated autoloads from haskell-mode/haskell-font-lock.el

(autoload 'haskell-font-lock-choose-keywords "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-font-lock" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads (haskell-indent-mode turn-on-haskell-indent) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-indent"
;;;;;;  "haskell-mode/haskell-indent.el" "db9be01b9c4c888d4be08a301acdf59d")
;;; Generated autoloads from haskell-mode/haskell-indent.el

(autoload 'turn-on-haskell-indent "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-indent" "\
Turn on ``intelligent'' Haskell indentation mode.

\(fn)" nil nil)

(autoload 'haskell-indent-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-indent" "\
``Intelligent'' Haskell indentation mode.
This deals with the layout rule of Haskell.
\\[haskell-indent-cycle] starts the cycle which proposes new
possibilities as long as the TAB key is pressed.  Any other key
or mouse click terminates the cycle and is interpreted except for
RET which merely exits the cycle.
Other special keys are:
    \\[haskell-indent-insert-equal]
      inserts an =
    \\[haskell-indent-insert-guard]
      inserts an |
    \\[haskell-indent-insert-otherwise]
      inserts an | otherwise =
these functions also align the guards and rhs of the current definition
    \\[haskell-indent-insert-where]
      inserts a where keyword
    \\[haskell-indent-align-guards-and-rhs]
      aligns the guards and rhs of the region
    \\[haskell-indent-put-region-in-literate]
      makes the region a piece of literate code in a literate script

Invokes `haskell-indent-hook' if not nil.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (turn-on-haskell-indentation haskell-indentation-mode)
;;;;;;  "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-indentation"
;;;;;;  "haskell-mode/haskell-indentation.el" "4829b685946fbb2df71a07603bf3a7ae")
;;; Generated autoloads from haskell-mode/haskell-indentation.el

(autoload 'haskell-indentation-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-indentation" "\
Haskell indentation mode that deals with the layout rule.
It rebinds RET, DEL and BACKSPACE, so that indentations can be
set and deleted as if they were real tabs.  It supports
autofill-mode.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-haskell-indentation "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-indentation" "\
Turn on the haskell-indentation minor mode.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-interactive-mode-reset-error haskell-interactive-mode-echo
;;;;;;  haskell-interactive-switch haskell-interactive-bring haskell-interactive-mode)
;;;;;;  "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-interactive-mode"
;;;;;;  "haskell-mode/haskell-interactive-mode.el" "7879c9dd192c0ebad35c1d3e59de90b7")
;;; Generated autoloads from haskell-mode/haskell-interactive-mode.el

(autoload 'haskell-interactive-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-interactive-mode" "\
Interactive mode for Haskell.

See Info node `(haskell-mode)haskell-interactive-mode' for more
information.

Key bindings:
\\{haskell-interactive-mode-map}

\(fn)" t nil)

(autoload 'haskell-interactive-bring "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-interactive-mode" "\
Bring up the interactive mode for this session.

\(fn)" t nil)

(autoload 'haskell-interactive-switch "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-interactive-mode" "\
Switch to the interactive mode for this session.

\(fn)" t nil)

(autoload 'haskell-interactive-mode-echo "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-interactive-mode" "\
Echo a read only piece of text before the prompt.

\(fn SESSION MESSAGE &optional MODE)" nil nil)

(autoload 'haskell-interactive-mode-reset-error "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-interactive-mode" "\
Reset the error cursor position.

\(fn SESSION)" t nil)

;;;***

;;;### (autoloads (haskell-menu) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-menu"
;;;;;;  "haskell-mode/haskell-menu.el" "0d2f4cbf4a8ff4db50707ac87223a6ce")
;;; Generated autoloads from haskell-mode/haskell-menu.el

(autoload 'haskell-menu "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-menu" "\
Launch the Haskell sessions menu.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-hayoo hoogle-lookup-from-local haskell-hoogle
;;;;;;  literate-haskell-mode haskell-mode haskell-customize haskell-mode-view-news
;;;;;;  haskell-version) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-mode"
;;;;;;  "haskell-mode/haskell-mode.el" "776e03ce5eaf517a4e12ad03fc1a6427")
;;; Generated autoloads from haskell-mode/haskell-mode.el

(autoload 'haskell-version "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-mode" "\
Show the `haskell-mode` version in the echo area.
With prefix argument HERE, insert it at point.
When FULL is non-nil, use a verbose version string.
When MESSAGE is non-nil, display a message with the version.

\(fn &optional HERE)" t nil)

(autoload 'haskell-mode-view-news "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-mode" "\
Display information on recent changes to haskell-mode.

\(fn)" t nil)

(autoload 'haskell-customize "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-mode" "\
Browse the haskell customize sub-tree.
This calls 'customize-browse' with haskell as argument and makes
sure all haskell customize definitions have been loaded.

\(fn)" t nil)

(defvar haskell-mode-map (let ((map (make-sparse-keymap))) (define-key map (kbd "C-c C-.") 'haskell-mode-format-imports) (define-key map [remap delete-indentation] 'haskell-delete-indentation) (define-key map (kbd "C-c C-l") 'haskell-mode-enable-process-minor-mode) (define-key map (kbd "C-c C-b") 'haskell-mode-enable-process-minor-mode) (define-key map (kbd "C-c C-v") 'haskell-mode-enable-process-minor-mode) (define-key map (kbd "C-c C-t") 'haskell-mode-enable-process-minor-mode) (define-key map (kbd "C-c C-i") 'haskell-mode-enable-process-minor-mode) map) "\
Keymap used in Haskell mode.")

(autoload 'haskell-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-mode" "\
Major mode for editing Haskell programs.

See also Info node `(haskell-mode)Getting Started' for more
information about this mode.

\\<haskell-mode-map>
Literate scripts are supported via `literate-haskell-mode'.
The variable `haskell-literate' indicates the style of the script in the
current buffer.  See the documentation on this variable for more details.

Use `haskell-version' to find out what version of Haskell mode you are
currently using.

Additional Haskell mode modules can be hooked in via `haskell-mode-hook';
see documentation for that variable for more details.

\(fn)" t nil)

(autoload 'literate-haskell-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-mode" "\
As `haskell-mode' but for literate scripts.

\(fn)" t nil)
(add-to-list 'auto-mode-alist        '("\\.\\(?:[gh]s\\|hi\\)\\'" . haskell-mode))
(add-to-list 'auto-mode-alist        '("\\.l[gh]s\\'" . literate-haskell-mode))
(add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
(add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))

(autoload 'haskell-hoogle "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-mode" "\
Do a Hoogle search for QUERY.
When `haskell-hoogle-command' is non-nil, this command runs
that.  Otherwise, it opens a hoogle search result in the browser.

If prefix argument INFO is given, then `haskell-hoogle-command'
is asked to show extra info for the items matching QUERY..

\(fn QUERY &optional INFO)" t nil)

(defalias 'hoogle 'haskell-hoogle)

(autoload 'hoogle-lookup-from-local "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-mode" "\
Lookup by local hoogle.

\(fn)" t nil)

(autoload 'haskell-hayoo "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-mode" "\
Do a Hayoo search for QUERY.

\(fn QUERY)" t nil)

(defalias 'hayoo 'haskell-hayoo)

;;;***

;;;### (autoloads (haskell-move-nested-left haskell-move-nested-right
;;;;;;  haskell-move-nested) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-move-nested"
;;;;;;  "haskell-mode/haskell-move-nested.el" "3f936f93c0f6503d52b7962d28f311e5")
;;; Generated autoloads from haskell-mode/haskell-move-nested.el

(autoload 'haskell-move-nested "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-move-nested" "\
Shift the nested off-side-rule block adjacent to point by COLS columns to the right.

In Transient Mark mode, if the mark is active, operate on the contents
of the region instead.

\(fn COLS)" nil nil)

(autoload 'haskell-move-nested-right "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-move-nested" "\
Increase indentation of the following off-side-rule block adjacent to point.

Use a numeric prefix argument to indicate amount of indentation to apply.

In Transient Mark mode, if the mark is active, operate on the contents
of the region instead.

\(fn COLS)" t nil)

(autoload 'haskell-move-nested-left "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-move-nested" "\
Decrease indentation of the following off-side-rule block adjacent to point.

Use a numeric prefix argument to indicate amount of indentation to apply.

In Transient Mark mode, if the mark is active, operate on the contents
of the region instead.

\(fn COLS)" t nil)

;;;***

;;;### (autoloads (haskell-navigate-imports-return haskell-navigate-imports-go
;;;;;;  haskell-navigate-imports) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-navigate-imports"
;;;;;;  "haskell-mode/haskell-navigate-imports.el" "a45ce848371144d4d78f0a94b4c999de")
;;; Generated autoloads from haskell-mode/haskell-navigate-imports.el

(autoload 'haskell-navigate-imports "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-navigate-imports" "\
Cycle the Haskell import lines or return to point (with prefix arg).

\(fn &optional RETURN)" t nil)

(autoload 'haskell-navigate-imports-go "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-navigate-imports" "\
Go to the first line of a list of consequtive import lines. Cycles.

\(fn)" t nil)

(autoload 'haskell-navigate-imports-return "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-navigate-imports" "\
Return to the non-import point we were at before going to the module list.
   If we were originally at an import list, we can just cycle through easily.

\(fn)" t nil)

;;;***

;;;### (autoloads (interactive-haskell-mode haskell-process haskell-process-start
;;;;;;  haskell-process-cabal haskell-process-cabal-build haskell-process-load-or-reload
;;;;;;  haskell-process-reload-file haskell-process-load-file haskell-process-do-info
;;;;;;  haskell-process-do-type haskell-process-generate-tags) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-process"
;;;;;;  "haskell-mode/haskell-process.el" "f25e6cba1c0e2dd863329596283d015b")
;;; Generated autoloads from haskell-mode/haskell-process.el

(autoload 'haskell-process-generate-tags "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-process" "\
Regenerate the TAGS table.

\(fn &optional AND-THEN-FIND-THIS-TAG)" t nil)

(autoload 'haskell-process-do-type "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-process" "\
Print the type of the given expression.

\(fn &optional INSERT-VALUE)" t nil)

(autoload 'haskell-process-do-info "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-process" "\
Print info on the identifier at point.
If PROMPT-VALUE is non-nil, request identifier via mini-buffer.

\(fn &optional PROMPT-VALUE)" t nil)

(autoload 'haskell-process-load-file "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-process" "\
Load the current buffer file.

\(fn)" t nil)

(autoload 'haskell-process-reload-file "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-process" "\
Re-load the current buffer file.

\(fn)" t nil)

(autoload 'haskell-process-load-or-reload "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-process" "\
Load or reload. Universal argument toggles which.

\(fn &optional TOGGLE)" t nil)

(autoload 'haskell-process-cabal-build "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-process" "\
Build the Cabal project.

\(fn)" t nil)

(autoload 'haskell-process-cabal "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-process" "\
Prompts for a Cabal command to run.

\(fn P)" t nil)

(autoload 'haskell-process-start "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-process" "\
Start the inferior Haskell process.

\(fn SESSION)" nil nil)

(autoload 'haskell-process "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-process" "\
Get the current process from the current session.

\(fn)" nil nil)

(autoload 'interactive-haskell-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-process" "\
Minor mode for enabling haskell-process interaction.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (haskell-session-process haskell-session haskell-session-maybe
;;;;;;  haskell-session-installed-modules haskell-session-all-modules)
;;;;;;  "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-session"
;;;;;;  "haskell-mode/haskell-session.el" "4ac7b8bf7b7843b99c8815b3b57bb759")
;;; Generated autoloads from haskell-mode/haskell-session.el

(autoload 'haskell-session-all-modules "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-session" "\
Get all modules -- installed or in the current project.
If DONTCREATE is non-nil don't create a new session.

\(fn &optional DONTCREATE)" nil nil)

(autoload 'haskell-session-installed-modules "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-session" "\
Get the modules installed in the current package set.
If DONTCREATE is non-nil don't create a new session.

\(fn &optional DONTCREATE)" nil nil)

(autoload 'haskell-session-maybe "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-session" "\
Maybe get the Haskell session, return nil if there isn't one.

\(fn)" nil nil)

(autoload 'haskell-session "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-session" "\
Get the Haskell session, prompt if there isn't one or fail.

\(fn)" nil nil)

(autoload 'haskell-session-process "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-session" "\
Get the session process.

\(fn S)" nil nil)

;;;***

;;;### (autoloads (haskell-show-parse haskell-show-parse-and-insert
;;;;;;  haskell-show-replace) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-show"
;;;;;;  "haskell-mode/haskell-show.el" "60a7dac5ef8f18c9fa04505eb7dd0e62")
;;; Generated autoloads from haskell-mode/haskell-show.el

(autoload 'haskell-show-replace "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-show" "\
Replace the given region containing a Show value with a pretty
  printed collapsible version.

\(fn START END)" nil nil)

(autoload 'haskell-show-parse-and-insert "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-show" "\
Parse a `string' containing a Show instance value and insert
  it pretty printed into the current buffer.

\(fn GIVEN)" nil nil)

(autoload 'haskell-show-parse "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-show" "\
Parse the given input into a tree.

\(fn GIVEN)" nil nil)

;;;***

;;;### (autoloads (turn-on-haskell-simple-indent haskell-simple-indent-mode)
;;;;;;  "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-simple-indent"
;;;;;;  "haskell-mode/haskell-simple-indent.el" "c4d60eaf3649de991c0fa34cffe11ea7")
;;; Generated autoloads from haskell-mode/haskell-simple-indent.el

(autoload 'haskell-simple-indent-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-simple-indent" "\
Simple Haskell indentation mode that uses simple heuristic.
In this minor mode, `indent-for-tab-command' (bound to <tab> by
default) will move the cursor to the next indent point in the
previous nonblank line, whereas `haskell-simple-indent-backtab'
\(bound to <backtab> by default) will move the cursor the
previous indent point.  An indent point is a non-whitespace
character following whitespace.

Runs `haskell-simple-indent-hook' on activation.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-haskell-simple-indent "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-simple-indent" "\
Turn on function `haskell-simple-indent-mode'.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-sort-imports) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-sort-imports"
;;;;;;  "haskell-mode/haskell-sort-imports.el" "5445879d1d26d696e9f88c9ffe8a3f46")
;;; Generated autoloads from haskell-mode/haskell-sort-imports.el

(autoload 'haskell-sort-imports "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-sort-imports" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-is-prefix-of haskell-string-take haskell-trim)
;;;;;;  "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-string"
;;;;;;  "haskell-mode/haskell-string.el" "22cce3a6ed5c868db99c7b1c5d3d6bd9")
;;; Generated autoloads from haskell-mode/haskell-string.el

(autoload 'haskell-trim "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-string" "\


\(fn STRING)" nil nil)

(autoload 'haskell-string-take "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-string" "\
Take n chars from string.

\(fn STRING N)" nil nil)

(autoload 'haskell-is-prefix-of "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-string" "\
Is x string a prefix of y string?

\(fn X Y)" nil nil)

;;;***

;;;### (autoloads (turn-on-haskell-unicode-input-method) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-unicode-input-method"
;;;;;;  "haskell-mode/haskell-unicode-input-method.el" "af8147f585b55cfcbe8ea317abce4f25")
;;; Generated autoloads from haskell-mode/haskell-unicode-input-method.el

(autoload 'turn-on-haskell-unicode-input-method "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-unicode-input-method" "\
Set input method `haskell-unicode'.
See Info node `Unicode(haskell-mode)' for more details.

\(fn)" t nil)

;;;***

;;;### (autoloads (haskell-yas-complete) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-yas"
;;;;;;  "haskell-mode/haskell-yas.el" "a3ae8a82bda09532d42e1c23db375716")
;;; Generated autoloads from haskell-mode/haskell-yas.el

(autoload 'haskell-yas-complete "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/haskell-yas" "\


\(fn &rest ARGS)" nil nil)

;;;***

;;;### (autoloads (inf-haskell-mode inferior-haskell-find-haddock
;;;;;;  inferior-haskell-find-definition inferior-haskell-info inferior-haskell-kind
;;;;;;  inferior-haskell-type inferior-haskell-send-decl inferior-haskell-load-and-run
;;;;;;  inferior-haskell-load-file switch-to-haskell) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/inf-haskell"
;;;;;;  "haskell-mode/inf-haskell.el" "96b3ad6a7381c9ded99046c570a8b834")
;;; Generated autoloads from haskell-mode/inf-haskell.el

(defalias 'run-haskell 'switch-to-haskell)

(autoload 'switch-to-haskell "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/inf-haskell" "\
Show the inferior-haskell buffer.  Start the process if needed.

\(fn &optional ARG)" t nil)

(autoload 'inferior-haskell-load-file "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/inf-haskell" "\
Pass the current buffer's file to the inferior haskell process.
If prefix arg \\[universal-argument] is given, just reload the previous file.

\(fn &optional RELOAD)" t nil)

(autoload 'inferior-haskell-load-and-run "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/inf-haskell" "\
Pass the current buffer's file to haskell and then run a COMMAND.

\(fn COMMAND)" t nil)

(autoload 'inferior-haskell-send-decl "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/inf-haskell" "\
Send current declaration to inferior-haskell process.

\(fn)" t nil)

(autoload 'inferior-haskell-type "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/inf-haskell" "\
Query the haskell process for the type of the given expression.
If optional argument `insert-value' is non-nil, insert the type above point
in the buffer.  This can be done interactively with the \\[universal-argument] prefix.
The returned info is cached for reuse by `haskell-doc-mode'.

\(fn EXPR &optional INSERT-VALUE)" t nil)

(autoload 'inferior-haskell-kind "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/inf-haskell" "\
Query the haskell process for the kind of the given expression.

\(fn TYPE)" t nil)

(autoload 'inferior-haskell-info "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/inf-haskell" "\
Query the haskell process for the info of the given expression.

\(fn SYM)" t nil)

(autoload 'inferior-haskell-find-definition "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/inf-haskell" "\
Attempt to locate and jump to the definition of the given expression.

\(fn SYM)" t nil)

(autoload 'inferior-haskell-find-haddock "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/inf-haskell" "\
Find and open the Haddock documentation of SYM.
Make sure to load the file into GHCi or Hugs first by using C-c C-l.
Only works for functions in a package installed with ghc-pkg, or
whatever the value of `haskell-package-manager-name' is.

This function needs to find which package a given module belongs
to.  In order to do this, it computes a module-to-package lookup
alist, which is expensive to compute (it takes upwards of five
seconds with more than about thirty installed packages).  As a
result, we cache it across sessions using the cache file
referenced by `inferior-haskell-module-alist-file'. We test to
see if this is newer than `haskell-package-conf-file' every time
we load it.

\(fn SYM)" t nil)

(autoload 'inf-haskell-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/haskell-mode/inf-haskell" "\
Minor mode for enabling inf-haskell process interaction.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (idris-ipkg-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/idris-mode/idris-ipkg-mode"
;;;;;;  "idris-mode/idris-ipkg-mode.el" "309158080d76524de0d1076d46221d2a")
;;; Generated autoloads from idris-mode/idris-ipkg-mode.el

(autoload 'idris-ipkg-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/idris-mode/idris-ipkg-mode" "\
Major mode for Idris package files
     \\{idris-ipkg-mode-map}
Invokes `idris-ipkg-mode-hook'.

\(fn)" t nil)

;;;***

;;;### (autoloads (idris-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/idris-mode/idris-mode"
;;;;;;  "idris-mode/idris-mode.el" "ff0b3b732cc14fd74d612c1a0cdb87cc")
;;; Generated autoloads from idris-mode/idris-mode.el

(autoload 'idris-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/idris-mode/idris-mode" "\
Major mode for Idris
     \\{idris-mode-map}
Invokes `idris-mode-hook'.

\(fn)" t nil)

(push '("\\.idr$" . idris-mode) auto-mode-alist)

(push '("\\.lidr$" . idris-mode) auto-mode-alist)

(eval-after-load 'flycheck '(progn (flycheck-define-checker idris "An Idris syntax and type checker." :command ("idris" "--check" "--nocolor" "--warnpartial" source) :error-patterns ((warning line-start (file-name) ":" line ":" column ":Warning - " (message (and (* nonl) (* "\n" (not (any "/" "~")) (* nonl))))) (error line-start (file-name) ":" line ":" column ":" (message (and (* nonl) (* "\n" (not (any "/" "~")) (* nonl)))))) :modes idris-mode) (add-to-list 'flycheck-checkers 'idris)))

;;;***

;;;### (autoloads (turn-on-idris-simple-indent idris-simple-indent-mode)
;;;;;;  "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/idris-mode/idris-simple-indent"
;;;;;;  "idris-mode/idris-simple-indent.el" "9e8f6f2d93a85cbb9bcbe0514939bf25")
;;; Generated autoloads from idris-mode/idris-simple-indent.el

(autoload 'idris-simple-indent-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/idris-mode/idris-simple-indent" "\
Simple Idris indentation mode that uses simple heuristic.
In this minor mode, `indent-for-tab-command' (bound to <tab> by
default) will move the cursor to the next indent point in the
previous nonblank line, whereas `idris-simple-indent-backtab'
\(bound to <backtab> by default) will move the cursor the
previous indent point. An indent point is a non-whitespace
character following whitespace.

Runs `idris-simple-indent-hook' on activation.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-idris-simple-indent "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/idris-mode/idris-simple-indent" "\
Turn on function `idris-simple-indent-mode'.

\(fn)" t nil)

;;;***

;;;### (autoloads (j-console) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/j-mode/j-console"
;;;;;;  "j-mode/j-console.el" "9fb213b9e997dc89681ab5aa412e677d")
;;; Generated autoloads from j-mode/j-console.el

(autoload 'j-console "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/j-mode/j-console" "\
Ensures a running j-console-cmd session and switches focus to
the containing buffer

\(fn)" t nil)

;;;***

;;;### (autoloads (j-help-lookup-symbol-at-point j-help-lookup-symbol)
;;;;;;  "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/j-mode/j-help"
;;;;;;  "j-mode/j-help.el" "5011d9076f384d9fe3ecfe98655d8419")
;;; Generated autoloads from j-mode/j-help.el

(autoload 'j-help-lookup-symbol "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/j-mode/j-help" "\
Lookup symbol in dictionary

\(fn SYMBOL)" t nil)

(autoload 'j-help-lookup-symbol-at-point "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/j-mode/j-help" "\
Determine the symbol nearest to POINT and look it up in the dictionary

\(fn POINT)" t nil)

;;;***

;;;### (autoloads (j-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/j-mode/j-mode"
;;;;;;  "j-mode/j-mode.el" "3757a074de0eb1e6008130d254f83785")
;;; Generated autoloads from j-mode/j-mode.el

(autoload 'j-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/j-mode/j-mode" "\
Major mode for editing J

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.ij[rstp]$" . j-mode))

;;;***

;;;### (autoloads (turn-off-show-smartparens-mode turn-on-show-smartparens-mode
;;;;;;  show-smartparens-global-mode show-smartparens-mode turn-off-smartparens-mode
;;;;;;  turn-on-smartparens-mode smartparens-global-mode turn-on-smartparens-strict-mode
;;;;;;  smartparens-global-strict-mode smartparens-strict-mode smartparens-mode
;;;;;;  sp-use-smartparens-bindings sp-use-paredit-bindings sp-cheat-sheet)
;;;;;;  "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens"
;;;;;;  "smartparens/smartparens.el" "bcf7a3205f85105c55fd62a47ecc6332")
;;; Generated autoloads from smartparens/smartparens.el

(autoload 'sp-cheat-sheet "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" "\
Generate a cheat sheet of all the smartparens interactive functions.

Without a prefix argument, print only the short documentation and examples.

With non-nil prefix argument, show the full documentation for each function.

You can follow the links to the function or variable help page.
To get back to the full list, use \\[help-go-back].

You can use `beginning-of-defun' and `end-of-defun' to jump to
the previous/next entry.

Examples are fontified using the `font-lock-string-face' for
better orientation.

\(fn &optional ARG)" t nil)

(defvar sp-keymap (make-sparse-keymap) "\
Keymap used for `smartparens-mode'.")

(autoload 'sp-use-paredit-bindings "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" "\
Initiate `sp-keymap' with paredit-compatible bindings for
corresponding functions provided by smartparens.  See variable
`sp-paredit-bindings'.

\(fn)" t nil)

(autoload 'sp-use-smartparens-bindings "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" "\
Initiate `sp-keymap' with smartparens bindings for navigation functions.
See variable `sp-smartparens-bindings'.

\(fn)" t nil)

(autoload 'smartparens-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" "\
Toggle smartparens mode.

You can enable pre-set bindings by customizing
`sp-base-key-bindings' variable.  The current content of
`sp-keymap' is:

 \\{sp-keymap}

\(fn &optional ARG)" t nil)

(autoload 'smartparens-strict-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" "\
Toggle the strict smartparens mode.

When strict mode is active, `delete-char', `kill-word' and their
backward variants will skip over the pair delimiters in order to
keep the structure always valid (the same way as `paredit-mode'
does).  This is accomplished by remapping them to
`sp-delete-char' and `sp-kill-word'.  There is also function
`sp-kill-symbol' that deletes symbols instead of words, otherwise
working exactly the same (it is not bound to any key by default).

When strict mode is active, this is indicated with \"/s\"
after the smartparens indicator in the mode list.

\(fn &optional ARG)" t nil)

(defvar smartparens-global-strict-mode nil "\
Non-nil if Smartparens-Global-Strict mode is enabled.
See the command `smartparens-global-strict-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `smartparens-global-strict-mode'.")

(custom-autoload 'smartparens-global-strict-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" nil)

(autoload 'smartparens-global-strict-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" "\
Toggle Smartparens-Strict mode in all buffers.
With prefix ARG, enable Smartparens-Global-Strict mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Smartparens-Strict mode is enabled in all buffers where
`turn-on-smartparens-strict-mode' would do it.
See `smartparens-strict-mode' for more information on Smartparens-Strict mode.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-smartparens-strict-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" "\
Turn on `smartparens-strict-mode'.

\(fn)" t nil)

(defvar smartparens-global-mode nil "\
Non-nil if Smartparens-Global mode is enabled.
See the command `smartparens-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `smartparens-global-mode'.")

(custom-autoload 'smartparens-global-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" nil)

(autoload 'smartparens-global-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" "\
Toggle Smartparens mode in all buffers.
With prefix ARG, enable Smartparens-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Smartparens mode is enabled in all buffers where
`turn-on-smartparens-mode' would do it.
See `smartparens-mode' for more information on Smartparens mode.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-smartparens-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" "\
Turn on `smartparens-mode'.

\(fn)" t nil)

(autoload 'turn-off-smartparens-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" "\
Turn off `smartparens-mode'.

\(fn)" t nil)

(autoload 'show-smartparens-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" "\
Toggle visualization of matching pairs.  When enabled, any
matching pair is highlighted after `sp-show-pair-delay' seconds
of Emacs idle time if the point is immediately in front or after
a pair.  This mode works similarly to `show-paren-mode', but
support custom pairs.

\(fn &optional ARG)" t nil)

(defvar show-smartparens-global-mode nil "\
Non-nil if Show-Smartparens-Global mode is enabled.
See the command `show-smartparens-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `show-smartparens-global-mode'.")

(custom-autoload 'show-smartparens-global-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" nil)

(autoload 'show-smartparens-global-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" "\
Toggle Show-Smartparens mode in all buffers.
With prefix ARG, enable Show-Smartparens-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Show-Smartparens mode is enabled in all buffers where
`turn-on-show-smartparens-mode' would do it.
See `show-smartparens-mode' for more information on Show-Smartparens mode.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-show-smartparens-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" "\
Turn on `show-smartparens-mode'.

\(fn)" t nil)

(autoload 'turn-off-show-smartparens-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/smartparens/smartparens" "\
Turn off `show-smartparens-mode'.

\(fn)" t nil)

;;;***

;;;### (autoloads (global-undo-tree-mode undo-tree-mode) "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/undo-tree/undo-tree"
;;;;;;  "undo-tree/undo-tree.el" "924e72a4702cc3f220c5acb42a52dd37")
;;; Generated autoloads from undo-tree/undo-tree.el

(autoload 'undo-tree-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/undo-tree/undo-tree" "\
Toggle undo-tree mode.
With no argument, this command toggles the mode.
A positive prefix argument turns the mode on.
A negative prefix argument turns it off.

Undo-tree-mode replaces Emacs' standard undo feature with a more
powerful yet easier to use version, that treats the undo history
as what it is: a tree.

The following keys are available in `undo-tree-mode':

  \\{undo-tree-map}

Within the undo-tree visualizer, the following keys are available:

  \\{undo-tree-visualizer-mode-map}

\(fn &optional ARG)" t nil)

(defvar global-undo-tree-mode nil "\
Non-nil if Global-Undo-Tree mode is enabled.
See the command `global-undo-tree-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-undo-tree-mode'.")

(custom-autoload 'global-undo-tree-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/undo-tree/undo-tree" nil)

(autoload 'global-undo-tree-mode "../../../../mnt/sda9/home/james/dotfiles/emacs.d/el-get/undo-tree/undo-tree" "\
Toggle Undo-Tree mode in all buffers.
With prefix ARG, enable Global-Undo-Tree mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Undo-Tree mode is enabled in all buffers where
`turn-on-undo-tree-mode' would do it.
See `undo-tree-mode' for more information on Undo-Tree mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (global-evil-surround-mode turn-off-evil-surround-mode
;;;;;;  turn-on-evil-surround-mode evil-surround-mode evil-surround-change
;;;;;;  evil-surround-delete) "evil-surround/evil-surround" "../../../../../../../home/james/.emacs.d/el-get/evil-surround/evil-surround.el"
;;;;;;  "496019bf0e17c04097eacbda413ff9b5")
;;; Generated autoloads from ../../../../../../../home/james/.emacs.d/el-get/evil-surround/evil-surround.el

(autoload 'evil-surround-delete "evil-surround/evil-surround" "\
Delete the surrounding delimiters represented by CHAR.
Alternatively, the text to delete can be represented with
the overlays OUTER and INNER, where OUTER includes the delimiters
and INNER excludes them. The intersection (i.e., difference)
between these overlays is what is deleted.

\(fn CHAR &optional OUTER INNER)" t nil)

(autoload 'evil-surround-change "evil-surround/evil-surround" "\
Change the surrounding delimiters represented by CHAR.
Alternatively, the text to delete can be represented with the
overlays OUTER and INNER, which are passed to `evil-surround-delete'.

\(fn CHAR &optional OUTER INNER)" t nil)

(autoload 'evil-surround-mode "evil-surround/evil-surround" "\
Buffer-local minor mode to emulate surround.vim.

\(fn &optional ARG)" t nil)

(autoload 'turn-on-evil-surround-mode "evil-surround/evil-surround" "\
Enable evil-surround-mode in the current buffer.

\(fn)" nil nil)

(autoload 'turn-off-evil-surround-mode "evil-surround/evil-surround" "\
Disable evil-surround-mode in the current buffer.

\(fn)" nil nil)

(defvar global-evil-surround-mode nil "\
Non-nil if Global-Evil-Surround mode is enabled.
See the command `global-evil-surround-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-evil-surround-mode'.")

(custom-autoload 'global-evil-surround-mode "evil-surround/evil-surround" nil)

(autoload 'global-evil-surround-mode "evil-surround/evil-surround" "\
Toggle Evil-Surround mode in all buffers.
With prefix ARG, enable Global-Evil-Surround mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Evil-Surround mode is enabled in all buffers where
`turn-on-evil-surround-mode' would do it.
See `evil-surround-mode' for more information on Evil-Surround mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../../../home/james/.emacs.d/el-get/evil-surround/evil-surround.el"
;;;;;;  "ace-jump-mode/ace-jump-mode.el" "auctex/bib-cite.el" "auctex/context-en.el"
;;;;;;  "auctex/context-nl.el" "auctex/context.el" "auctex/font-latex.el"
;;;;;;  "auctex/latex.el" "auctex/multi-prompt.el" "auctex/plain-tex.el"
;;;;;;  "auctex/preview/preview.el" "auctex/tex-bar.el" "auctex/tex-fold.el"
;;;;;;  "auctex/tex-font.el" "auctex/tex-info.el" "auctex/tex-jp.el"
;;;;;;  "auctex/tex.el" "auctex/texmathp.el" "auctex/toolbar-x.el"
;;;;;;  "el-get/el-get-list-packages.el" "el-get/el-get.el" "evil-leader/evil-leader.el"
;;;;;;  "evil-numbers/evil-numbers.el" "evil/evil-core.el" "goto-chg/goto-chg.el"
;;;;;;  "haskell-latex/haskell-latex.el" "haskell-mode/ghc-core.el"
;;;;;;  "haskell-mode/haskell-align-imports.el" "haskell-mode/haskell-c.el"
;;;;;;  "haskell-mode/haskell-cabal.el" "haskell-mode/haskell-compile.el"
;;;;;;  "haskell-mode/haskell-decl-scan.el" "haskell-mode/haskell-doc.el"
;;;;;;  "haskell-mode/haskell-font-lock.el" "haskell-mode/haskell-indent.el"
;;;;;;  "haskell-mode/haskell-indentation.el" "haskell-mode/haskell-interactive-mode.el"
;;;;;;  "haskell-mode/haskell-menu.el" "haskell-mode/haskell-mode.el"
;;;;;;  "haskell-mode/haskell-move-nested.el" "haskell-mode/haskell-navigate-imports.el"
;;;;;;  "haskell-mode/haskell-process.el" "haskell-mode/haskell-session.el"
;;;;;;  "haskell-mode/haskell-show.el" "haskell-mode/haskell-simple-indent.el"
;;;;;;  "haskell-mode/haskell-sort-imports.el" "haskell-mode/haskell-string.el"
;;;;;;  "haskell-mode/haskell-unicode-input-method.el" "haskell-mode/haskell-yas.el"
;;;;;;  "haskell-mode/inf-haskell.el" "idris-mode/idris-ipkg-mode.el"
;;;;;;  "idris-mode/idris-mode.el" "idris-mode/idris-simple-indent.el"
;;;;;;  "j-mode/j-console.el" "j-mode/j-help.el" "j-mode/j-mode.el"
;;;;;;  "smartparens/smartparens.el" "undo-tree/undo-tree.el") (21569
;;;;;;  12879 10517 232000))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here

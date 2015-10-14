(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/elpa")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(require 'linum-relative)
(global-linum-mode)
(column-number-mode)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-f 't)
(setq scroll-s 1)

(add-to-list 'load-path "~/.emacs.d/j-mode/")
(autoload 'j-mode "j-mode.el" "Major mode for editing J files" t)
(add-to-list 'auto-mode-alist '("\\.ij[rstp]$" . j-mode))

;(custom-set-face
; '(j-verb-face ((t (:foreground "cornflower blue"))))
; '(j-adverb-face ((t (:foreground "goldenrod"))))
; '(j-conjunction-face ((t (:foreground "olive drab"))))
; '(j-other-face ((t (:foreground "Black")))))

(require 'evil-indent-textobject)

(require 'evil-leader)
(global-evil-leader-mode)

(require 'evil)
(evil-mode 1)

(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)
(setq-default evil-cross-lines t)

(define-key evil-motion-state-map "," 'evil-ex)
(define-key evil-motion-state-map ":" 'evil-repeat-find-char-reverse)

(define-key evil-motion-state-map (kbd "C-n") 'evil-scroll-line-up)
(define-key evil-normal-state-map (kbd "C-n") 'evil-scroll-line-up)

(define-key evil-window-map "j" 'evil-window-left)
(define-key evil-window-map "J" 'evil-window-move-far-left)
(define-key evil-window-map "h" 'evil-window-down)
(define-key evil-window-map "H" 'evil-window-move-very-bottom)
(define-key evil-window-map "k" 'evil-window-up)
(define-key evil-window-map "K" 'evil-window-move-very-top)

(define-key evil-motion-state-map "j" 'evil-backward-char)
(define-key evil-motion-state-map "J" 'evil-window-top)
(define-key evil-motion-state-map "h" 'evil-next-line)
(define-key evil-motion-state-map "k" 'evil-previous-line)

(define-key evil-normal-state-map (kbd "M-x") 'execute-extended-command)
(define-key evil-motion-state-map "|" 'evil-execute-in-emacs-state)

(evil-define-operator myevil-yank-line (beg end type register yank-handler)
  "Save the rest of the line into the kill-ring."
  :motion nil
  :keep-visual t
  (interactive "<R><x>")
  ;; act linewise in Visual state
  (let* ((beg (or beg (point)))
         (end (or end beg)))
    (when (evil-visual-state-p)
      (unless (memq type '(line block))
        (let ((range (evil-expand beg end 'line)))
          (setq beg (evil-range-beginning range)
                end (evil-range-end range))))
      (evil-exit-visual-state))
    (cond
     ((eq type 'block)
      (let ((temporary-goal-column most-positive-fixnum)
            (last-command 'next-line))
        (evil-yank beg end 'block register yank-handler)))
     ((eq type 'line)
      (evil-yank beg end 'block register yank-handler))
     (t
      (evil-yank beg (line-end-position) type register yank-handler)))))
(define-key evil-normal-state-map "Y" 'myevil-yank-line)

(require 'evil-escape)
(setq evil-escape-key-sequence (kbd "C-c C-c"))
(require 'evil-surround)
(evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)
(evil-define-key 'visual evil-surround-mode-map "S" 'evil-Surround-region)
(global-evil-surround-mode 1)
(require 'evil-exchange)
(setq evil-exchange-key (kbd "zx"))
(setq evil-exchange-cancel-key (kbd "zX"))
(evil-exchange-install)
(require 'evil-indent-textobject)
(global-evil-visualstar-mode)
(global-evil-tabs-mode t)

(require 'evil-args)
(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)
(define-key evil-normal-state-map (kbd "gj") 'evil-forward-arg)
(define-key evil-motion-state-map (kbd "gj") 'evil-forward-arg)
(define-key evil-normal-state-map (kbd "gl") 'evil-backward-arg)
(define-key evil-motion-state-map (kbd "gl") 'evil-backward-arg)
(define-key evil-normal-state-map (kbd "gh") 'evil-jump-out-args)
(define-key evil-motion-state-map (kbd "gh") 'evil-jump-out-args)

(require 'smartparens)
(smartparens-global-mode)
(require 'smartparens-config)
;(sp-pair "(" ")" :wrap "C-s )")
;(sp-pair "[" "]" :wrap "C-s ]")
;(sp-pair "{" "}" :wrap "C-s }")
;(sp-pair "<" ">" :wrap "C-s >")
;(sp-pair "\"" "\"" :wrap "C-s \"")
;(sp-pair "'" "'" :wrap "C-s '")
(require 'evil-smartparens)
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

(require 'ace-jump-buffer)
(define-key evil-normal-state-map (kbd "RET") 'ace-jump-buffer)

;(unless (display-graphic-p)
;  (require 'evil-terminal-cursor-changer))
;(setq evil-visual-state-cursor 'box)
;(setq evil-insert-state-cursor 'bar)
;(setq evil-emacs-state-cursor 'hbar)

;(setq initial-frame-alist '(
;  (font . "Monospace-9")
;))
;(setq default-frame-alist '(
;  (font . "Monospace-9")
;))

(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

; AUCTeX
;(require 'auctex)
(define-key evil-normal-state-map "gpp" 'preview-at-point)
(add-hook 'LaTeX-mode-hook (lambda () (whitespace-mode nil)))

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

(define-key evil-normal-state-map (kbd "S-SPC") 'evil-ace-jump-mode)
(define-key evil-normal-state-map (kbd "SPC") 'evil-ace-jump-char-mode)
(define-key evil-visual-state-map (kbd "S-SPC") 'evil-ace-jump-mode)
(define-key evil-visual-state-map (kbd "SPC") 'evil-ace-jump-char-mode)
(define-key evil-operator-state-map (kbd "S-SPC") 'evil-ace-jump-mode)
(define-key evil-operator-state-map (kbd "SPC") 'evil-ace-jump-char-mode)

(autoload 'lojban-parse-region "lojban" nil t)
(autoload 'lojban-mode "lojban-mode" nil t)

;(setq mail-user-agent 'sendmail-user-agent)
;(setenv "MAILHOST" "pop3server")
;(setq rmail-primary-inbox-list '("po:jdw74@cam.ac.uk")
;      rmail-pop-password-required t)

(require 'yasnippet)
(yas-global-mode 1)

(setq-default indent-tabs-mode nil)

(require 'helm-config)
(define-key evil-normal-state-map (kbd "g h") 'helm-mini)
;(helm-mode 1)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 24)

(require 'helm-idris)

(idris-define-evil-keys)

(require 'bk-pentadactyl-mode)

(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
;(define-key haskell-mode-map (kbd "\\ r") 'haskell-process-load-or-reload)

(add-to-list 'completion-ignored-extensions '".ibc")

(require 'whitespace)
(setq-default show-trailing-whitespace t)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

(let ((myFont (concat "-adobe-Source Code Pro"
                      "-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")))
  (set-default-font myFont nil t)
  (set-fontset-font t '(8500 . 8800) myFont)
  (setq default-frame-alist '((font . myFont))))
(set-fontset-font t '(#xE000 . #xE1FF)
                  '("Dushan Shwa Alphabet" . "unicode-bmp"))

;(require 'powerline)
;(require 'powerline-evil)
;(powerline-evil-vim-color-theme)

;(sml/setup)

(require 'zlc)
(zlc-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(AmS-TeX-mode-hook (quote (whitespace-mode)))
 '(LaTeX-mode-hook (quote (preview-mode-setup)) t)
 '(agda2-include-dirs (quote ("." "/home/james/.nix-profile/share/agda/")))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("f04122bbc305a202967fa1838e20ff741455307c2ae80a26035fbf5d637e325f" "013e87003e1e965d8ad78ee5b8927e743f940c7679959149bbee9a15bd286689" "3632cf223c62cb7da121be0ed641a2243f7ec0130178722554e613c9ab3131de" "66132890ee1f884b4f8e901f0c61c5ed078809626a547dbefbb201f900d03fd8" "b6f42c69cf96795c75b1e79e5cd8ca62f9f9a0cb07bf11d1e0b49f97785358f1" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(evil-args-delimiters (quote ("," ";" " ")))
 '(evil-digraphs-table-user
   (quote
    (((108 101)
      . 8715)
     ((101 108)
      . 8712)
     ((98 98)
      . 120121)
     ((122 122)
      . 8484)
     ((113 113)
      . 8474)
     ((61 61)
      . 8801)
     ((47 61)
      . 8802)
     ((60 61)
      . 8804)
     ((62 61)
      . 8805)
     ((38 38)
      . 8743)
     ((124 124)
      . 8744)
     ((111 111)
      . 8728))) nil (evil-digraphs))
 '(fci-rule-color "#eee8d5")
 '(global-whitespace-mode t)
 '(haskell-compile-command
   "ghc -Wall -ferror-spans -fforce-recomp -fdefer-type-errors -c %s")
 '(haskell-package-conf-file "/usr/lib64/ghc-7.6.3/package.conf")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(idris-interpreter-flags (quote ("-p" "contrib")))
 '(idris-metavariable-list-show-expanded nil)
 '(idris-mode-hook
   (quote
    (turn-on-idris-simple-indent idris-enable-clickable-imports turn-on-eldoc-mode turn-on-pretty-mode)))
 '(idris-pretty-printer-width 80)
 '(idris-warnings-printing (quote (warnings-repl)))
 '(inhibit-startup-screen t)
 '(latex-run-command "pdflatex")
 '(magit-diff-use-overlays nil)
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(preview-TeX-style-dir "/home/james/.emacs.d/elpa/auctex-11.88.2/latex" t)
 '(show-trailing-whitespace t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(whitespace-global-modes (quote (not latex-mode tex-mode)))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-highlight-bound-variable-face ((t (:foreground "violet"))))
 '(agda2-highlight-coinductive-constructor-face ((t (:foreground "green"))))
 '(agda2-highlight-datatype-face ((t (:foreground "#0087ff"))))
 '(agda2-highlight-dotted-face ((t (:foreground "violet"))))
 '(agda2-highlight-field-face ((t (:foreground "orange red"))))
 '(agda2-highlight-function-face ((t (:foreground "orange red"))))
 '(agda2-highlight-inductive-constructor-face ((t (:foreground "green"))))
 '(agda2-highlight-keyword-face ((t (:foreground "orange"))))
 '(agda2-highlight-module-face ((t (:foreground "brightgreen"))))
 '(agda2-highlight-number-face ((t (:foreground "brightgreen"))))
 '(agda2-highlight-postulate-face ((t (:foreground "cyan"))))
 '(agda2-highlight-primitive-face ((t (:foreground "#0087ff"))))
 '(agda2-highlight-primitive-type-face ((t (:foreground "#0087ff"))))
 '(agda2-highlight-record-face ((t (:foreground "#0087ff"))))
 '(agda2-highlight-string-face ((t (:foreground "brightred"))))
 '(agda2-highlight-symbol-face ((t (:foreground "brightblue"))))
 '(custom-themed ((t (:background "blue1" :foreground "white")))))

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

(eval-after-load 'agda2
  '(progn
     (load "agda2-mode-improvements")
     (evil-define-key 'normal agda2-mode-map
       "\\v" 'agda2-auto
       "\\u" 'agda2-previous-goal
       "\\y" 'agda2-next-goal
       "\\c" 'agda2-make-case
       "\\xt" 'agda2-infer-type-maybe-toplevel
       "\\e" 'agda2-show-context
       "\\r" 'agda2-load
       "\\n" 'agda2-compute-normalised-maybe-toplevel
       "\\o" 'agda2-module-contents-maybe-toplevel
       "\\f" 'agda2-refine
       "\\p" 'agda2-solveAll
       "\\t" 'agda2-goal-type
       "\\ " 'agda2-give
       "\\." 'agda2-goal-and-context
       "\\;" 'agda2-goal-and-context-and-inferred
       "\\=" 'agda2-show-constraints
       "\\g" 'agda2-show-goals
       "\\xc" 'agda2-compile
       "\\xd" 'agda2-remove-annotations
       "\\xh" 'agda2-display-implicit-arguments
       "\\xl" 'agda2-load
       "\\xq" 'agda2-quit
       "\\xr" 'agda2-restart

       "\\l" 'agda2-solve-with-db
       "\\xs" 'agda2-show-current-dbs
       "\\w" 'agda2-add-with-exp
       "\\a" 'agda2-add-with-exp-make-case
       "\\d" 'agda2-generate-function-stub
       "\\z" 'agda2-fix-line
     )
     (add-hook 'evil-insert-state-entry-hook
               (lambda () (set-input-method "Agda")))
     (add-hook 'evil-insert-state-exit-hook
               (lambda () (set-input-method nil)))))

(load-file "~/Downloads/cubicaltt/cubicaltt.el")
(add-to-list 'auto-mode-alist '("\\.ctt\\'" . ctt-mode))

; Terminal background colour fix for solarized
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
(add-hook 'window-setup-hook 'on-after-init)

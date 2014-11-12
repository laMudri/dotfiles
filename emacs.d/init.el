<<<<<<< HEAD
(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/elpa")

=======
(add-to-list 'load-path "~/.emacs.d/")
>>>>>>> cfe00da17d48901e6345aea7c09c194d9ba3e582
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

<<<<<<< HEAD
(require 'linum-relative)
=======
>>>>>>> cfe00da17d48901e6345aea7c09c194d9ba3e582
(global-linum-mode)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-f 't)
(setq scroll-s 1)

<<<<<<< HEAD
=======
(add-to-list 'load-path "~/.emacs.d/lojban")
(autoload 'lojban-parse-region "lojban" nil t)
(autoload 'lojban-mode "lojban-mode" nil t)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

>>>>>>> cfe00da17d48901e6345aea7c09c194d9ba3e582
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

<<<<<<< HEAD
=======
(add-to-list 'load-path "~/.emacs.d/evil")
>>>>>>> cfe00da17d48901e6345aea7c09c194d9ba3e582
(require 'evil)
(evil-mode 1)

(setq evil-search-module 'evil-search)
(setq evil-magic 'very-magic)

(define-key evil-motion-state-map "," 'evil-ex)
(define-key evil-motion-state-map ":" 'evil-repeat-find-char-reverse)

(define-key evil-motion-state-map (kbd "C-n") 'evil-scroll-line-up)
(define-key evil-normal-state-map (kbd "C-n") 'evil-scroll-line-up)

(define-key evil-window-map "j" 'evil-window-left)
(define-key evil-window-map "J" 'evil-window-move-far-left)
(define-key evil-window-map "k" 'evil-window-down)
(define-key evil-window-map "K" 'evil-window-move-very-bottom)
(define-key evil-window-map "h" 'evil-window-up)
(define-key evil-window-map "H" 'evil-window-move-very-top)

(define-key evil-motion-state-map "j" 'evil-backward-char)
(define-key evil-motion-state-map "J" 'evil-window-top)
(define-key evil-motion-state-map "k" 'evil-next-line)
(define-key evil-motion-state-map "h" 'evil-previous-line)

(define-key evil-normal-state-map (kbd "M-x") 'execute-extended-command)
(define-key evil-motion-state-map "|" 'evil-execute-in-emacs-state)

<<<<<<< HEAD
(require 'evil-escape)
(setq evil-escape-key-sequence (kbd "C-c C-c"))
(require 'evil-surround)
(global-evil-surround-mode 1)
(require 'evil-exchange)
(setq evil-exchange-key (kbd "zx"))
(setq evil-exchange-cancel-key (kbd "zx"))
(evil-exchange-install)

(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer))

=======
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

;(set-face-attribute 'default nil :height 100)
>>>>>>> cfe00da17d48901e6345aea7c09c194d9ba3e582
(setq initial-frame-alist '(
  (font . "Monospace-9")
))
(setq default-frame-alist '(
  (font . "Monospace-9")
))

(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

; AUCTeX
(define-key evil-normal-state-map "gpp" 'preview-at-point)

(smartparens-global-mode)
(require 'smartparens-config)
;(sp-pair "(" ")" :wrap "C-s )")
;(sp-pair "[" "]" :wrap "C-s ]")
;(sp-pair "{" "}" :wrap "C-s }")
;(sp-pair "<" ">" :wrap "C-s >")
;(sp-pair "\"" "\"" :wrap "C-s \"")
;(sp-pair "'" "'" :wrap "C-s '")
<<<<<<< HEAD

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

(define-key evil-normal-state-map (kbd "S-SPC") 'ace-jump-mode)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-char-mode)

(autoload 'lojban-parse-region "lojban" nil t)
(autoload 'lojban-mode "lojban-mode" nil t)
=======
>>>>>>> cfe00da17d48901e6345aea7c09c194d9ba3e582

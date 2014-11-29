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
(global-evil-surround-mode 1)
(require 'evil-exchange)
(setq evil-exchange-key (kbd "zx"))
(setq evil-exchange-cancel-key (kbd "zx"))
(evil-exchange-install)

(require 'ace-jump-buffer)
(define-key evil-normal-state-map (kbd "RET") 'ace-jump-buffer)

(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer))

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

;(setq mail-user-agent 'sendmail-user-agent)
;(setenv "MAILHOST" "pop3server")
;(setq rmail-primary-inbox-list '("po:jdw74@cam.ac.uk")
;      rmail-pop-password-required t)

(require 'yasnippet)
(yas-global-mode 1)

(setq-default indent-tabs-mode nil)

(require 'helm-config)
(define-key evil-normal-state-map (kbd "g h") 'helm-mini)
(helm-mode 1)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 24)

(require 'helm-idris)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-light)))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; fish-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "fish-mode" "fish-mode.el" (21787 49442 532698
;;;;;;  39000))
;;; Generated autoloads from fish-mode.el

(autoload 'fish-mode "fish-mode" "\
Major mode for editing fish shell files.

\(fn)" t nil)
 (add-to-list 'auto-mode-alist '("\\.fish\\'" . fish-mode))
 (add-to-list 'interpreter-mode-alist '("fish" . fish-mode))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; fish-mode-autoloads.el ends here
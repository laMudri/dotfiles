;;; funcs.el --- Javascript Layer functions File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Muneeb Shaikh <muneeb@reversehack.in>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

<<<<<<< HEAD

;; tern

(defun spacemacs//set-tern-key-bindings (mode)
  "Set the key bindings for tern and the given MODE."
  (add-to-list (intern (format "spacemacs-jump-handlers-%S" mode))
            'tern-find-definition)
  (spacemacs/set-leader-keys-for-major-mode mode
    "rrV" 'tern-rename-variable
    "hd" 'tern-get-docs
    "gG" 'tern-find-definition-by-name
    (kbd "C-g") 'tern-pop-find-definition
    "ht" 'tern-get-type))

(defun spacemacs//tern-detect ()
=======
(defun javascript//tern-detect ()
>>>>>>> 9f9faa404e3dec3e08cc73cf7b5a0439fc309800
  "Detect tern binary and warn if not found."
  (let ((found (executable-find "tern")))
    (unless found
      (spacemacs-buffer/warning "tern binary not found!"))
    found))

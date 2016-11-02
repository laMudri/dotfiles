;;; packages.el --- tmux Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
<<<<<<< HEAD
(setq tmux-packages
      '(
        golden-ratio
        (tmux :location local)
        ))

(defun tmux/post-init-golden-ratio ()
  (with-eval-after-load 'golden-ratio
    (add-to-list 'golden-ratio-extra-commands 'tmux-nav-left)
    (add-to-list 'golden-ratio-extra-commands 'tmux-nav-right)
    (add-to-list 'golden-ratio-extra-commands 'tmux-nav-up)
    (add-to-list 'golden-ratio-extra-commands 'tmux-nav-down)))
=======
(setq tmux-packages '((tmux :location local)))
>>>>>>> 9f9faa404e3dec3e08cc73cf7b5a0439fc309800

(defun tmux/init-tmux ()
  "Initialize tmux"
  (use-package tmux))

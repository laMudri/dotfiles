;;; config.el --- Javascript Layer configuration File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; Variables

(spacemacs|defvar-company-backends js2-mode)

(spacemacs|define-jump-handlers js2-mode)

<<<<<<< HEAD
=======
(setq javascript/key-binding-prefixes '(("mh" . "documentation")
                                        ("mg" . "goto")
                                        ("mr" . "refactor")))
(mapc (lambda (x) (spacemacs/declare-prefix-for-mode
                   'js2-mode (car x) (cdr x)))
      javascript/key-binding-prefixes)

>>>>>>> 9f9faa404e3dec3e08cc73cf7b5a0439fc309800
(defvar javascript-disable-tern-port-files t
  "Stops tern from creating tern port files.")

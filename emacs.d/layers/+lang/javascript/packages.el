;;; packages.el --- Javascript Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq javascript-packages
  '(
    coffee-mode
    company
    (company-tern :toggle (configuration-layer/package-usedp 'company))
    evil-matchit
    flycheck
    ggtags
    helm-gtags
    js-doc
    js2-mode
    js2-refactor
    json-mode
    json-snatcher
    (tern :toggle (spacemacs//tern-detect))
    web-beautify
    skewer-mode
    livid-mode
    ))

(defun javascript/init-coffee-mode ()
  (use-package coffee-mode
    :defer t
    :init
    (progn
      (defun javascript/coffee-indent ()
        (if (coffee-line-wants-indent)
            ;; We need to insert an additional tab because the last line was special.
            (coffee-insert-spaces (+ (coffee-previous-indent) coffee-tab-width))
          ;; otherwise keep at the same indentation level
          (coffee-insert-spaces (coffee-previous-indent)))
        )
      ;; indent to right position after `evil-open-below' and `evil-open-above'
      (add-hook 'coffee-mode-hook '(lambda ()
                                     (setq indent-line-function 'javascript/coffee-indent
                                           evil-shift-width coffee-tab-width))))))

(defun javascript/post-init-company ()
  (spacemacs|add-company-hook js2-mode))

(defun javascript/init-company-tern ()
  (use-package company-tern
    :if (and (configuration-layer/package-usedp 'company)
             (configuration-layer/package-usedp 'tern))
    :defer t
    :init
    (push 'company-tern company-backends-js2-mode)))

(defun javascript/post-init-flycheck ()
  (dolist (mode '(coffee-mode js2-mode json-mode))
    (spacemacs/add-flycheck-hook mode)))

(defun javascript/post-init-ggtags ()
  (add-hook 'js2-mode-local-vars-hook #'spacemacs/ggtags-mode-enable))

(defun javascript/post-init-helm-gtags ()
  (spacemacs/helm-gtags-define-keys-for-mode 'js2-mode))

(defun javascript/init-js-doc ()
  (use-package js-doc
    :defer t
    :init
    (progn
      (defun spacemacs/js-doc-require ()
        "Lazy load js-doc"
        (require 'js-doc))
      (add-hook 'js2-mode-hook 'spacemacs/js-doc-require)

      (defun spacemacs/js-doc-set-key-bindings (mode)
        "Setup the key bindings for `js2-doc' for the given MODE."
        (spacemacs/declare-prefix-for-mode mode "mrd" "documentation")
        (spacemacs/set-leader-keys-for-major-mode mode "rdb" 'js-doc-insert-file-doc)
        (spacemacs/set-leader-keys-for-major-mode mode "rdf" 'js-doc-insert-function-doc)
        (spacemacs/set-leader-keys-for-major-mode mode "rdt" 'js-doc-insert-tag)
        (spacemacs/set-leader-keys-for-major-mode mode "rdh" 'js-doc-describe-tag))
      (spacemacs/js-doc-set-key-bindings 'js2-mode))))

(defun javascript/init-js2-mode ()
  (use-package js2-mode
    :defer t
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
      ;; Required to make imenu functions work correctly
      (add-hook 'js2-mode-hook 'js2-imenu-extras-mode))
    :config
    (progn
      (spacemacs/declare-prefix-for-mode 'js2-mode "mh" "documentation")
      (spacemacs/declare-prefix-for-mode 'js2-mode "mg" "goto")
      (spacemacs/declare-prefix-for-mode 'js2-mode "mr" "refactor")
      (spacemacs/declare-prefix-for-mode 'js2-mode "mz" "folding")
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode
        "w" 'js2-mode-toggle-warnings-and-errors
        "zc" 'js2-mode-hide-element
        "zo" 'js2-mode-show-element
        "zr" 'js2-mode-show-all
        "ze" 'js2-mode-toggle-element
        "zF" 'js2-mode-toggle-hide-functions
        "zC" 'js2-mode-toggle-hide-comments))))

(defun javascript/post-init-evil-matchit ()
  (add-hook `js2-mode `turn-on-evil-matchit-mode))

(defun javascript/init-js2-refactor ()
  (use-package js2-refactor
    :defer t
    :init
    (progn
      (defun spacemacs/js2-refactor-require ()
        "Lazy load js2-refactor"
        (require 'js2-refactor))
      (add-hook 'js2-mode-hook 'spacemacs/js2-refactor-require)

      (defun spacemacs/js2-refactor-set-key-bindings (mode)
        (spacemacs/declare-prefix-for-mode mode "mr3" "ternary")
        (spacemacs/set-leader-keys-for-major-mode mode "r3i" 'js2r-ternary-to-if)

        (spacemacs/declare-prefix-for-mode mode "mra" "add/args")
        (spacemacs/set-leader-keys-for-major-mode mode "rag" 'js2r-add-to-globals-annotation)
        (spacemacs/set-leader-keys-for-major-mode mode "rao" 'js2r-arguments-to-object)

        (spacemacs/declare-prefix-for-mode mode "mrb" "barf")
        (spacemacs/set-leader-keys-for-major-mode mode "rba" 'js2r-forward-barf)

        (spacemacs/declare-prefix-for-mode mode "mrc" "contract")
        (spacemacs/set-leader-keys-for-major-mode mode "rca" 'js2r-contract-array)
        (spacemacs/set-leader-keys-for-major-mode mode "rco" 'js2r-contract-object)
        (spacemacs/set-leader-keys-for-major-mode mode "rcu" 'js2r-contract-function)

        (spacemacs/declare-prefix-for-mode mode "mre" "expand/extract")
        (spacemacs/set-leader-keys-for-major-mode mode "rea" 'js2r-expand-array)
        (spacemacs/set-leader-keys-for-major-mode mode "ref" 'js2r-extract-function)
        (spacemacs/set-leader-keys-for-major-mode mode "rem" 'js2r-extract-method)
        (spacemacs/set-leader-keys-for-major-mode mode "reo" 'js2r-expand-object)
        (spacemacs/set-leader-keys-for-major-mode mode "reu" 'js2r-expand-function)
        (spacemacs/set-leader-keys-for-major-mode mode "rev" 'js2r-extract-var)

        (spacemacs/declare-prefix-for-mode mode "mri" "inline/inject/introduct")
        (spacemacs/set-leader-keys-for-major-mode mode "rig" 'js2r-inject-global-in-iife)
        (spacemacs/set-leader-keys-for-major-mode mode "rip" 'js2r-introduce-parameter)
        (spacemacs/set-leader-keys-for-major-mode mode "riv" 'js2r-inline-var)

        (spacemacs/declare-prefix-for-mode mode "mrl" "localize/log")
        (spacemacs/set-leader-keys-for-major-mode mode "rlp" 'js2r-localize-parameter)
        (spacemacs/set-leader-keys-for-major-mode mode "rlt" 'js2r-log-this)

        (spacemacs/declare-prefix-for-mode mode "mrr" "rename")
        (spacemacs/set-leader-keys-for-major-mode mode "rrv" 'js2r-rename-var)

        (spacemacs/declare-prefix-for-mode mode "mrs" "split/slurp")
        (spacemacs/set-leader-keys-for-major-mode mode "rsl" 'js2r-forward-slurp)
        (spacemacs/set-leader-keys-for-major-mode mode "rss" 'js2r-split-string)
        (spacemacs/set-leader-keys-for-major-mode mode "rsv" 'js2r-split-var-declaration)

        (spacemacs/declare-prefix-for-mode mode "mrt" "toggle")
        (spacemacs/set-leader-keys-for-major-mode mode "rtf" 'js2r-toggle-function-expression-and-declaration)

        (spacemacs/declare-prefix-for-mode mode "mru" "unwrap")
        (spacemacs/set-leader-keys-for-major-mode mode "ruw" 'js2r-unwrap)

        (spacemacs/declare-prefix-for-mode mode "mrv" "var")
        (spacemacs/set-leader-keys-for-major-mode mode "rvt" 'js2r-var-to-this)

        (spacemacs/declare-prefix-for-mode mode "mrw" "wrap")
        (spacemacs/set-leader-keys-for-major-mode mode "rwi" 'js2r-wrap-buffer-in-iife)
        (spacemacs/set-leader-keys-for-major-mode mode "rwl" 'js2r-wrap-in-for-loop)

        (spacemacs/set-leader-keys-for-major-mode mode "k" 'js2r-kill)

        (spacemacs/declare-prefix-for-mode mode "mx" "text")
        (spacemacs/declare-prefix-for-mode mode "mxm" "move")
        (spacemacs/set-leader-keys-for-major-mode mode "xmj" 'js2r-move-line-down)
        (spacemacs/set-leader-keys-for-major-mode mode "xmk" 'js2r-move-line-up))

      (spacemacs/js2-refactor-set-key-bindings 'js2-mode))))

(defun javascript/init-json-mode ()
  (use-package json-mode
    :defer t))

(defun javascript/init-json-snatcher ()
  (use-package json-snatcher
    :defer t
    :config
    (spacemacs/set-leader-keys-for-major-mode 'json-mode
      "hp" 'jsons-print-path)
    ))

(defun javascript/init-tern ()
  (use-package tern
    :defer t
<<<<<<< HEAD
    :diminish tern-mode
=======
    :if (javascript//tern-detect)
>>>>>>> 9f9faa404e3dec3e08cc73cf7b5a0439fc309800
    :init (add-hook 'js2-mode-hook 'tern-mode)
    :config
    (progn
      (when javascript-disable-tern-port-files
        (add-to-list 'tern-command "--no-port-file" 'append))
<<<<<<< HEAD
      (spacemacs//set-tern-key-bindings 'js2-mode))))
=======
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "rrV" 'tern-rename-variable)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "hd" 'tern-get-docs)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "gg" 'tern-find-definition)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "gG" 'tern-find-definition-by-name)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode (kbd " C-g") 'tern-pop-find-definition)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode "ht" 'tern-get-type))))
>>>>>>> 9f9faa404e3dec3e08cc73cf7b5a0439fc309800

(defun javascript/init-web-beautify ()
  (use-package web-beautify
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode  "=" 'web-beautify-js)
      (spacemacs/set-leader-keys-for-major-mode 'json-mode "=" 'web-beautify-js)
      (spacemacs/set-leader-keys-for-major-mode 'web-mode  "=" 'web-beautify-html)
      (spacemacs/set-leader-keys-for-major-mode 'css-mode  "=" 'web-beautify-css))))

(defun javascript/init-skewer-mode ()
  (use-package skewer-mode
    :defer t
    :diminish skewer-mode
    :init
    (progn
      (spacemacs/register-repl 'skewer-mode 'spacemacs/skewer-start-repl "skewer")
      (add-hook 'js2-mode-hook 'skewer-mode))
    :config
    (progn
      (defun spacemacs/skewer-start-repl ()
        "Attach a browser to Emacs and start a skewer REPL."
        (interactive)
        (run-skewer)
        (skewer-repl))

      (defun spacemacs/skewer-load-buffer-and-focus ()
        "Execute whole buffer in browser and switch to REPL in insert state."
        (interactive)
        (skewer-load-buffer)
        (skewer-repl)
        (evil-insert-state))

      (defun spacemacs/skewer-eval-defun-and-focus ()
       "Execute function at point in browser and switch to REPL in insert state."
       (interactive)
       (skewer-eval-defun)
       (skewer-repl)
       (evil-insert-state))

      (defun spacemacs/skewer-eval-region (beg end)
        "Execute the region as JavaScript code in the attached browser."
        (interactive "r")
        (skewer-eval (buffer-substring beg end) #'skewer-post-minibuffer))

      (defun spacemacs/skewer-eval-region-and-focus (beg end)
        "Execute the region in browser and swith to REPL in insert state."
        (interactive "r")
        (spacemacs/skewer-eval-region beg end)
        (skewer-repl)
        (evil-insert-state))

      (spacemacs/set-leader-keys-for-major-mode 'js2-mode
        "'" 'spacemacs/skewer-start-repl
        "ee" 'skewer-eval-last-expression
        "eE" 'skewer-eval-print-last-expression
        "sb" 'skewer-load-buffer
        "sB" 'spacemacs/skewer-load-buffer-and-focus
        "si" 'spacemacs/skewer-start-repl
        "sf" 'skewer-eval-defun
        "sF" 'spacemacs/skewer-eval-defun-and-focus
        "sr" 'spacemacs/skewer-eval-region
        "sR" 'spacemacs/skewer-eval-region-and-focus
        "ss" 'skewer-repl))))

(defun javascript/init-livid-mode ()
  (use-package livid-mode
    :defer t
    :init (spacemacs|add-toggle javascript-repl-live-evaluation
            :mode livid-mode
            :documentation "Live evaluation of JS buffer change."
            :evil-leader-for-mode (js2-mode . "sa"))))

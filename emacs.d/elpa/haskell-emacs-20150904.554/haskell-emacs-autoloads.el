;;; haskell-emacs-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "haskell-emacs" "haskell-emacs.el" (22000 14660
;;;;;;  851197 103000))
;;; Generated autoloads from haskell-emacs.el

(autoload 'haskell-emacs-init "haskell-emacs" "\
Initialize haskell FFI or reload it to reflect changed functions.

When ARG is not nil or `haskell-emacs-init' is called
interactively and `haskell-emacs-dir' doesn't exist, ask an
installation dialog.  It will try to wrap all exported functions
within `haskell-emacs-dir' into an synchronous and an
asynchronous elisp function.

Dependencies:
 - GHC
 - cabal

Haskell packages:
 - atto-lisp
 - happy
 - haskell-src-exts
 - parallel
 - utf8-string

Consider that you've got the following toy program:

---- ~/.emacs.d/haskell-fun/Matrix.hs
module Matrix where

import qualified Data.List as L

-- | Takes a matrix (a list of lists of ints) and returns its transposition.
transpose :: [[Int]] -> [[Int]]
transpose = L.transpose

-- | Returns an identity matrix of size n.
identity :: Int -> [[Int]]
identity n
  | n > 1 = L.nub $ L.permutations $ 1 : replicate (n-1) 0
  | otherwise = [[1]]

-- | Check whether a given matrix is a identity matrix.
isIdentity :: [[Int]] -> Bool
isIdentity xs = xs == identity (length xs)

-- | Compute the dyadic product of two vectors.
dyadic :: [Int] -> [Int] -> [[Int]]
dyadic xs ys = map (\\x -> map (x*) ys) xs
----

Now call `haskell-emacs-init' to provide the elisp wrappers.

  (Matrix.transpose '((1 2) (3 4) (5 6)))
    => ((1 3 5) (2 4 6))

  (Matrix.dyadic '(1 2 3) '(4 5 6))
    => ((4 5 6) (8 10 12) (12 15 18))

If you provide bad input, a description of the type error will be
shown to you.

If you call the async pendant of your functions, you'll get a
future which will block on evaluation if the result is not already present.

  (Matrix.transpose-async '((1 2) (3 4) (5 6)))
    => (haskell-emacs--get 7)

  (eval (haskell-emacs--get 7))
    => ((1 3 5) (2 4 6))

Or perhaps more convenient:

  (let ((tr (Matrix.transpose-async '((1 2) (3 4) (5 6)))))

       ;; other elisp stuff, or more asyncs

       (eval tr))

Haskell-emacs can handle functions of arbitrary arity (including
0), but you should note, that only monomorphic functions are
supported, and only about ten different types.

Functions that take only one argument will be fused on Emacs
side, this allows executing a chain of functions asynchronously:

  (let ((result (Matrix.transpose-async (Matrix.transpose '((1 2) (3 4))))))

    ;; other stuff

    (eval result))
     => ((1 2) (3 4))

Furthermore, it nullifies the small performance overhead (0.07 ms
per function call) between fused functions which allows more
modularity and using haskell for even more basic tasks.

If you want to distribute a haskell library for haskell-emacs,
just write an elisp file describing the package and the
corresponding haskell file in the same dir:

  ;;;; haskell-emacs-pi/haskell-emacs-pi.el

  ;;; haskell-emacs-pi.el --- return pi

  ;; Version: 1.0.0
  ;; Package-Requires: ((haskell-emacs \"2.4.0\"))

  ;;; Code:

  (require 'haskell-emacs)
  (provide 'haskell-emacs-pi)

  ;;; haskell-emacs-pi.el ends here


  ---- haskell-emacs-pi/Pi.hs

  module Pi where (piSquare)

  piSquare :: Double
  piSquare = pi^2

  ----

That's all.  You can distribute this package for example via
melpa (don't forget to add the *.hs to the files of the recipe)
or just point your `load-path' to this directory.  If you call
afterwards `haskell-emacs-init', it will automatically find this
module and provide the functions.

If you want to use such functions in your elisp library, do the following:

  ;;; my-nums.el --- add a number to the square of pi

  ;; Package-Requires: ((haskell-emacs-pi \"1.0.0\"))

  ;;; Code:

  (require 'haskell-emacs-pi)
  (eval-when-compile (haskell-emacs-init))

  ;;;### autoload
  (defun my-nums (arg)
    (+ arg (Pi.piSquare)))

  ;;; my-nums.el ends here.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("haskell-emacs-pkg.el") (22000 14660 964621
;;;;;;  443000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; haskell-emacs-autoloads.el ends here

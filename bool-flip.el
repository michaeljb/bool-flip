;;; bool-flip.el --- flip the boolean under the point

;; Copyright (C) 2016 Michael Brandt
;;
;; Author: Michael Brandt <michaelbrandt5@gmail.com>
;; URL: http://github.com/michaeljb/bool-flip/
;; Package-Requires: ((emacs "24"))
;; Version: 1.0.0
;; Keywords: boolean, convenience, usability

;; This file is not part of GNU Emacs.

;;; License:

;; Licensed under the same terms as Emacs.

;;; Commentary:

;; Bind the following commands:
;; bool-flip-do-flip
;;
;; For a detailed introduction see:
;; http://github.com/michaeljb/bool-flip/blob/master/README.md

;;; Code:

(defcustom bool-flip-pairs-alist
  '((T . F)
    (F . T)

    (t . f)
    (f . t)

    (TRUE . FALSE)
    (FALSE . TRUE)

    (True . False)
    (False . True)

    (true . false)
    (false . true)

    (Y . N)
    (N . Y)

    (y . n)
    (n . y)

    (YES . NO)
    (NO . YES)

    (Yes . No)
    (No . Yes)

    (yes . no)
    (no . yes)

    (1 . 0)
    (0 . 1))
  "List of values flipped by bool-flip-do-flip."
  :group 'bool-flip
  :safe 'listp)

;;;###autoload
(defun bool-flip-do-flip ()
  "Replace the symbol at point with its boolean opposite."
  (interactive)
  (let (bool-flip-current-val bool-flip-new-val)
    (setq bool-flip-current-val (intern (thing-at-point 'symbol)))

    (setq bool-flip-new-val (alist-get bool-flip-current-val bool-flip-pairs-alist))

    ;; replace the value in the buffer
    (if bool-flip-new-val
	(let (pos1 pos2 pt)
	  (setq pos1 (car (bounds-of-thing-at-point 'symbol)))
	  (setq pos2 (cdr (bounds-of-thing-at-point 'symbol)))
	  (setq pt (point))
	  (delete-region pos1 pos2)
	  (insert (symbol-name bool-flip-new-val))
	  (goto-char pt)))))

(provide 'bool-flip)
;;; bool-flip.el ends here

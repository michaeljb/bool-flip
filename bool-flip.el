(setq bool-flip-base-hash (make-hash-table :test 'equal))

(defun base-hash-pair (true false)
  (puthash true false bool-flip-base-hash)
  (puthash false true bool-flip-base-hash))

(base-hash-pair "T" "F")
(base-hash-pair "t" "f")

(base-hash-pair "TRUE" "FALSE")
(base-hash-pair "True" "False")
(base-hash-pair "true" "false")

(base-hash-pair "Y" "N")
(base-hash-pair "y" "n")

(base-hash-pair "YES" "NO")
(base-hash-pair "yes" "no")
(base-hash-pair "Yes" "no")

(base-hash-pair "1" "0")

(defun bool-flip ()
  "Replace the thing at point with its boolean opposite."
  (interactive)
  (let (new-val pt bounds pos1 pos2)
    (setq new-val (gethash (thing-at-point 'word) bool-flip-base-hash))

    (if new-val
	(progn
	  (setq pt (point))
	  (setq bounds (bounds-of-thing-at-point 'symbol))
	  (setq pos1 (car bounds))
	  (setq pos2 (cdr bounds))
	  (delete-region pos1 pos2)
	  (insert new-val)
	  (goto-char pt)))))

(provide 'bool-flip)

(setq bool-flip-hash-base (make-hash-table :test 'equal))
(setq bool-flip-major-modes (make-hash-table :test 'equal))

(defun bool-flip-pair (true false &optional major-mode-name)
  (let (hash-to-use)
    (if major-mode-name
	(let (major-mode-hash)
	  (setq major-mode-hash (gethash (intern major-mode-name) bool-flip-major-modes))
	  (if (not major-mode-hash)
	      (puthash (intern major-mode-name) (make-hash-table :test 'equal) bool-flip-major-modes))
	  (setq hash-to-use (gethash (intern major-mode-name) bool-flip-major-modes)))
      (setq hash-to-use bool-flip-hash-base))

    (puthash true false hash-to-use)
    (puthash false true hash-to-use)))

(bool-flip-pair "T" "F")
(bool-flip-pair "t" "f")
(bool-flip-pair "TRUE" "FALSE")
(bool-flip-pair "True" "False")
(bool-flip-pair "true" "false")
(bool-flip-pair "Y" "N")
(bool-flip-pair "y" "n")
(bool-flip-pair "YES" "NO")
(bool-flip-pair "yes" "no")
(bool-flip-pair "Yes" "No")
(bool-flip-pair "1" "0")

(bool-flip-pair "t" "nil" "lisp-interaction-mode")
(bool-flip-pair "t" "nil" "emacs-lisp-mode")

(defun bool-flip-do-flip ()
  "Replace the symbol at point with its boolean opposite."
  (interactive)
  (let (major-mode-name major-mode-hash hash-to-use bool-flip-new-val)

    ;; use the base hash, or the major mode hash
    (setq major-mode-name (buffer-local-value 'major-mode (current-buffer)))
    (setq major-mode-hash (gethash major-mode-name bool-flip-major-modes))
    (if major-mode-hash
	(setq hash-to-use major-mode-hash)
      (setq hash-to-use bool-flip-hash-base))

    ;; get the val from the chosen hash
    (setq bool-flip-new-val (gethash (thing-at-point 'symbol) hash-to-use))

    ;; fall back to the base hash if the major mode hash doesn't have the key
    (if (not bool-flip-new-val)
	(setq bool-flip-new-val (gethash (thing-at-point 'symbol) bool-flip-hash-base)))

    ;; replace the value in the buffer
    (if bool-flip-new-val
	(let (pt bounds pos1 pos2)
	  (setq pt (point))
	  (setq bounds (bounds-of-thing-at-point 'symbol))
	  (setq pos1 (car bounds))
	  (setq pos2 (cdr bounds))
	  (delete-region pos1 pos2)
	  (insert bool-flip-new-val)
	  (goto-char pt)))))

(provide 'bool-flip)

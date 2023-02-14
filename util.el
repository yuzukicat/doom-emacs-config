;;; util.el -*- lexical-binding: t; -*-

(defun my/copy (&optional ARG)
  (interactive "p")
  (if mark-active
      (copy-region-as-kill (region-beginning) (region-end))
    (if ARG
        (copy-region-as-kill (line-beginning-position) (line-end-position))
      (kill-new (thing-at-point 'symbol)))))

;; https://emacs.stackexchange.com/questions/30942/insert-a-string-from-eval-expression-without-the-quotes#answer-30960
(defun vicarie/eval-last-sexp-and-do (f)
  "Eval the last sexp and call F on its value."
  (let ((standard-output (current-buffer))
        (value (eval-last-sexp nil)))
    (funcall f value)))
(defun vicarie/eval-print-last-sexp ()
  "Evaluate and print the last sexp on the same line."
  (interactive)
  (vicarie/eval-last-sexp-and-do (lambda (value)
                                   (insert (format " (= %s ) " value)))))
(defun vicarie/eval-replace-last-sexp ()
  "Evaluate and replace last sexp with its value."
  (interactive)
  (vicarie/eval-last-sexp-and-do (lambda (value)
                                   (backward-kill-sexp)
                                   (insert (format "%s" value)))))

;;(map! :map emacs-lisp-mode-map "C-c +" #'vicarie/eval-replace-last-sexp)

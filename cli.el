;;; cli.el -*- lexical-binding: t; -*-
(setq! org-confirm-babel-evaluate nil)
(advice-add 'org-babel-execute-src-block
  :around #'(lambda (orig-fn &rest args)
  (quiet! (apply orig-fn args))))

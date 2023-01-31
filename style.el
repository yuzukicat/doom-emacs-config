;;; style.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-tomorrow-day)

(setq doom-font (font-spec :family "JetBrains Mono" :size 24)
      doom-big-font (font-spec :family "JetBrains Mono" :size 26)
      doom-variable-pitch-font (font-spec :family "Source Code Variable" :size 22)
      doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "TeX Gyre Cursor")
      )

(after! doom-modeline
  (custom-set-variables '(doom-modeline-buffer-file-name-style 'relative-to-project)
			'(doom-modeline-major-mode-icon t)
			'(doom-modeline-modal-icon nil)))

(setq display-line-numbers-type 'relative)

(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")

(setq! frame-title-format
      '("%b – Doom Emacs"
	(:eval
         (let ((project-name (projectile-project-name)))
           (unless (string= "-" project-name)
             (format "  -  [%s]" project-name))))))

(setq yas-triggers-in-field t)
(setq eros-eval-result-prefix "⟹ ") ; default =>

(after! treemacs
  (setq! treemacs-indent-guide-mode t
         treemacs-show-hidden-files t
         doom-themes-treemacs-theme "doom-colors"
         treemacs-file-event-delay 1000
         treemacs-file-follow-delay 0.1)
  (treemacs-follow-mode t)
  ;; (treemacs-filewatch-mode t)
  (treemacs-git-mode 'deferred)
  (treemacs-hide-gitignored-files-mode t))

(custom-set-variables
 '(hl-todo-keyword-faces '(("NOTE" font-lock-builtin-face bold) ;; needs discussion or further investigation.
                           ("REVIEW" font-lock-keyword-face bold) ;; review was conducted.
                           ("HACK" font-lock-variable-name-face bold) ;; workaround a known problem.
                           ("DEPRECATED" region bold) ;; why it was deprecated and to suggest an alternative.
                           ("XXX+" font-lock-constant-face bold) ;; warn other programmers of problematic or misguiding code.
                           ("TODO" font-lock-function-name-face bold) ;; tasks/features to be done.
                           ("FIXME" font-lock-warning-face bold) ;; problematic or ugly code needing refactoring or cleanup.
                           ("KLUDGE" font-lock-preprocessor-face bold )
                           ("BUG" error bold) ;; a known bug that should be corrected.
                           )))

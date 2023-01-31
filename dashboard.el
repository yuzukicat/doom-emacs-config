(map! :map +doom-dashboard-mode-map
      :desc "org agenda" "a" #'org-agenda
      :desc "find file" "f" #'find-file
      :desc "recent session" "R" #'doom/quickload-session
      :desc "recent files" "r" #'counsel-recentf
      :desc "config dir" "C" #'doom/open-private-config
      :desc "open config.org" "c" (cmd! (find-file (expand-file-name "config.org" doom-private-dir)))
      ;; :desc "open dotfile" "." (cmd! (doom-project-find-file "~/.config/"))
      :desc "notes (roam)" "n" #'org-roam-node-find
      :desc "switch buffer" "b" #'+vertico/switch-workspace-buffer
      ;; :desc "switch buffers (all)" "B" #'consult-buffer
      :desc "ibuffer" "i" #'ibuffer
      :desc "open project" "p" #'counsel-projectile-switch-project
      ;; :desc "set theme" "t" #'consult-theme
      :desc "quit" "q" #'save-buffers-kill-terminal
      :desc "documentation" "H" #'doom/help
      :desc "show keybindings" "h" (cmd! (which-key-show-major-mode)))

(remove-hook '+doom-dashboard-functions
      #'doom-dashboard-widget-shortmenu)

(add-hook! '+doom-dashboard-mode-hook (hide-mode-line-mode 1)
      (hl-line-mode 1))

(defun ginshio/doom-init-ui-misc()
  (menu-bar-mode -1)               ;; disable menu-bar
  (setq-default cursor-type 'box)  ;; set box style cursor
  (blink-cursor-mode -1)           ;; cursor not blink
  ;;<<doom-dashboard-layout>>
  (if (display-graphic-p)
      (progn
	;; NOTE: ONLY GUI
	;; set font
	(dolist (charset '(kana han symbol cjk-misc bopomofo gb18030))
          (set-fontset-font (frame-parameter nil 'font) charset
                            (font-spec :family "Source Han Mono")))
	(appendq! face-font-rescale-alist
                  '(("Source Han Mono" . 1.2)
                    ))
	;;<<doom-image-banner>>
	;; random banner image from bing.com, NOTE: https://emacs-china.org/t/topic/264/33
	)
    (progn
      ;; NOTE: ONLY TUI
      ;;<<doom-ascii-banner>>
      )))
(add-hook! 'doom-init-ui-hook #'ginshio/doom-init-ui-misc)

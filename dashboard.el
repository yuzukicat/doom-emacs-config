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

(defun my/dashboard-draw-ascii-banner-fn ()
  (let* ((banner
          '("██╗░░░░░███████╗███╗░░░███╗░█████╗░███╗░░██╗"
            "██║░░░░░██╔════╝████╗░████║██╔══██╗████╗░██║"
            "██║░░░░░█████╗░░██╔████╔██║██║░░██║██╔██╗██║"
            "██║░░░░░██╔══╝░░██║╚██╔╝██║██║░░██║██║╚████║"
            "███████╗███████╗██║░╚═╝░██║╚█████╔╝██║░╚███║"
            "╚══════╝╚══════╝╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚══╝"
            ""
            "                Emacs Master                "
            ""))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat
                 line (make-string (max 0 (- longest-line (length line)))
                                   32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'my/dashboard-draw-ascii-banner-fn)

(when (featurep! :app telegram)
  (setq +doom-dashboard-menu-sections
        `(("Telegram: Keyboard War"
           :icon (all-the-icons-faicon "paper-plane" :face 'doom-dashboard-menu-title)
           :action telega)
          ,@+doom-dashboard-menu-sections)))

(advice-remove '+doom-dashboard/open "delete-other-windows")
(advice-add '+doom-dashboard/open :before
            (lambda (&rest _) (delete-other-windows))
            '((name . "delete-other-windows")))

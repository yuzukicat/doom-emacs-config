
;;; personal.el -*- lexical-binding: t; -*-

(setq default-directory "~/")

(setq user-full-name "Yuzuki"
      user-mail-address "yuzuki.cat@kamisu66.com")

(setq org-directory "~/org/")
(setq org-roam-directory "~/org/")
(setq org-agenda-files
      (directory-files-recursively
       "~/org" "\\.org$"))

;; projectile auto projects discovery
;; M-x projectile-discover-projects-in-search-path
;; https://docs.projectile.mx/projectile/usage.html#automated-project-discovery
(setq projectile-project-search-path
      '("~/Workspace/"))

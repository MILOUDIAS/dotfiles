(setq user-full-name "Miloudi Adel Hani"
      user-mail-address "adelhani.miloudi@gmail.com")

(setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'semi-light)
     doom-variable-pitch-font (font-spec :family "Fira Sans" :size 15))

(setq doom-theme 'doom-one)
(doom/set-frame-opacity 95)
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq org-directory "~/Dropbox/Personal/org/")
(setq org-roam-directory "~/Dropbox/Personal/org-roam/")
(setq +org-roam-open-buffer-on-find-file t)

(set-eglot-client! 'cc-mode '("ccls" "--init={\"index\": {\"threads\": 2}}"))

;; (after! rainbow-mode
(add-hook 'prog-mode-hook 'rainbow-mode)
;; Enable Rainbow Delimiters
;; (after! rainbow-delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; (after! color-identifiers-mode
;;   (add-hook 'prog-mode-hook 'global-color-identifiers-mode))

;; (after! rainbow-identifiers
(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

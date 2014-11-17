;; load solarized theme path
;; fork: https://github.com/Kaze3/emacs-color-theme-solarized
;; implementation: https://github.com/sellout/emacs-color-theme-solarized
;; original: http://ethanschoonover.com/solarized
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized/")

(when (>= emacs-major-version 24)
  (setq package-list '(auto-complete
                       helm
                       sass-mode
                       web-mode
                       yasnippet
                       ))

  (setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.org/packages/")))
  (package-initialize)

  (or (file-exists-p package-user-dir)
      (package-refresh-contents))

  (dolist (package package-list)
    (unless (package-installed-p package)
          (package-install package)))

  ;; load solarized theme
  (load-theme 'solarized-dark t)

  ;; automatically add matching brackets
  (electric-pair-mode 1)

  (require 'helm-config)
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-mini)
)

;; auto-complete
;; http://auto-complete.org/
;; https://github.com/auto-complete/auto-complete
(ac-config-default)

;; yasnippet: https://github.com/capitaomorte/yasnippet
(yas-global-mode 1)

;; web-mode: http://web-mode.org/
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; indent with spaces and set indentation levels
(setq-default indent-tabs-mode nil)
(setq tab-width 2
      js-indent-level 2
      sass-indent-offset 2)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; store backup and auto-save files in user dir
(setq backup-by-copying t
      backup-directory-alist '(("." . "~/.emacs-backup/backups"))
      auto-save-file-name-transforms '((".*" "~/.emacs-backup/autosaves" t)))
(make-directory "~/.emacs-backup/autosaves" t)

;; remove scrollbar, menubar, and toolbar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; highlight current line
(global-hl-line-mode 1)

;; highlight corresponding parentheses when cursor is on one
(show-paren-mode 1)

;; highlight tabulations
(setq-default highlight-tabs t)

;; show trailing whitespace
(setq-default show-trailing-whitespace t)

;; remove useless whitespace before saving
(add-hook 'before-save-hook 'whitespace-cleanup)

;; don't show startup message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

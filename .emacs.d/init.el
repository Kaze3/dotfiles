(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized/")

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives
  	       '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize)

  (load-theme 'solarized-dark t)
)

(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

(if window-system
  (tool-bar-mode -1)
)

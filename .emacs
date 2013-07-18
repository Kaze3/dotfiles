; replace tabs with spaces and set default width to 2
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq tab-stop-list (number-sequence 2 200 2))

; line numbers
(global-linum-mode t)
(setq linum-format "%d ")

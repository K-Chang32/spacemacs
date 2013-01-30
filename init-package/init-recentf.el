(require 'recentf)
(setq recentf-exclude '("~/.emacs.d/.recentf"))
(setq recentf-save-file (concat user-emacs-directory "/.recentf"))
(setq recentf-max-saved-items 100)
(setq recentf-auto-cleanup 10)
(setq recentf-auto-save-timer (run-with-idle-timer 600 t 'recentf-save-list))
(recentf-mode 1)

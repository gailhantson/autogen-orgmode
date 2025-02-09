;; init.el -- minimal Emacs config

;; Set some basic preferences
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; (Optional) Load org-mode enhancements
(require 'org)

;; Example: Add a function to quickly open org files
(defun open-org-directory ()
  "Open the default org directory."
  (interactive)
  (dired "~/org"))

;; If you want to install packages, you can do that here.
;; e.g., (package-initialize) and so forth.

(provide 'init)

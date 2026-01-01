(with-eval-after-load 'dired
  (add-hook 'dired-mode-hook #'dired-hide-details-mode))

(setq wdired-allow-to-change-permissions t)

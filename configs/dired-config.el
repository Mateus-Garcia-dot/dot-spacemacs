(setq insert-directory-program "gls")

(setq dired-listing-switches "-alhv --group-directories-first --dired")

(with-eval-after-load 'dired
  (add-hook 'dired-mode-hook #'dired-hide-details-mode))

(setq wdired-allow-to-change-permissions t)

(add-hook 'dired-mode-hook 'lsp-dired-mode)

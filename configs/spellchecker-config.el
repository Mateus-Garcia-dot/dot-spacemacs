;; Enable jinx globally
(dolist (hook '(text-mode-hook prog-mode-hook conf-mode-hook))
  (add-hook hook #'jinx-mode))

(setq-default jinx-languages "en_US")

(spacemacs/set-leader-keys "S s" 'jinx-correct)

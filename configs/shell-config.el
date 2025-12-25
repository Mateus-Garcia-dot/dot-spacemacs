(setq vterm-timer-delay 0.01)

(with-eval-after-load 'vterm
  (evil-set-initial-state 'vterm-mode 'emacs)
  (evil-define-key 'emacs vterm-mode-map (kbd "C-c") #'vterm-send-C-c))

(define-key vterm-mode-map [(control return)]   #'vterm-toggle-insert-cd)

(spacemacs/set-leader-keys
  "'" 'vterm-toggle)

(setq vterm-timer-delay 0.01)
(evil-define-key 'insert vterm-mode-map (kbd "C-c") #'vterm--self-insert)
(evil-define-key 'normal vterm-mode-map (kbd "C-c") #'vterm--self-insert)

(define-key vterm-mode-map [(control return)]   #'vterm-toggle-insert-cd)

(spacemacs/set-leader-keys
  "'" 'vterm-toggle)

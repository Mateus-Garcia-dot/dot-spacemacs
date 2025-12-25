(setq vterm-timer-delay 0.01)

(defun my/vterm-paste ()
  "Paste from system clipboard into vterm."
  (interactive)
  (vterm-insert (simpleclip-get-contents)))

(with-eval-after-load 'vterm
  (evil-set-initial-state 'vterm-mode 'emacs)
  (evil-define-key 'emacs vterm-mode-map (kbd "s-v") #'my/vterm-paste)
  (evil-define-key 'emacs vterm-mode-map (kbd "s-c") #'vterm-copy-mode)
  (evil-define-key 'emacs vterm-mode-map (kbd "C-c") #'vterm-send-C-c))

(define-key vterm-mode-map [(control return)]   #'vterm-toggle-insert-cd)

(spacemacs/set-leader-keys
  "'" 'vterm-toggle)

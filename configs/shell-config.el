(setq vterm-timer-delay 0.01)

(defun my/vterm-paste ()
  "Paste from system clipboard into vterm."
  (interactive)
  (vterm-insert (simpleclip-get-contents)))

(with-eval-after-load 'vterm
  (evil-set-initial-state 'vterm-mode 'emacs)
  (evil-define-key 'emacs vterm-mode-map (kbd "s-v") #'my/vterm-paste)
  (evil-define-key 'emacs vterm-mode-map (kbd "C-c") #'vterm-send-C-c)
  (evil-define-key 'emacs vterm-mode-map (kbd "<C-return>") #'vterm-copy-mode)
  (evil-define-key 'normal vterm-mode-map (kbd "<C-return>") #'vterm-copy-mode)
  (define-key vterm-copy-mode-map (kbd "<C-return>") #'vterm-copy-mode)
  (define-key vterm-copy-mode-map (kbd "C-c") #'vterm-copy-mode))

(defvar-local my/vterm-saved-cursor nil)

(add-hook 'vterm-copy-mode-hook
          (lambda ()
            (if vterm-copy-mode
                (progn
                  (setq my/vterm-saved-cursor cursor-type)
                  (evil-normal-state))
              (progn
                (evil-emacs-state)
                (run-at-time 0.01 nil
                             (lambda (buf cur)
                               (when (buffer-live-p buf)
                                 (with-current-buffer buf
                                   (setq-local cursor-type cur))))
                             (current-buffer)
                             my/vterm-saved-cursor)))))

(setq vterm-toggle-scope 'project)

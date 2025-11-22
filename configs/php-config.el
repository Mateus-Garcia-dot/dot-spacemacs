(require 'flycheck-phpstan)

(defvar-local my/flycheck-local-cache nil)

(defun my/flycheck-checker-get (orig-fn checker property)
  (or (alist-get property (alist-get checker my/flycheck-local-cache))
      (funcall orig-fn checker property)))

(advice-add 'flycheck-checker-get :around #'my/flycheck-checker-get)

(defun my/php-mode-setup ()
  "Setup that runs when entering php-mode."
  (flycheck-mode t)

  (when (derived-mode-p 'php-mode)
    (setq my/flycheck-local-cache
          '((lsp . ((next-checkers . (phpstan))))))))

(add-hook 'php-mode-hook #'my/php-mode-setup)

(add-hook 'lsp-managed-mode-hook
          (lambda ()
            (when (derived-mode-p 'php-mode)
              (setq my/flycheck-local-cache
                    '((lsp . ((next-checkers . (phpstan)))))))))

(defun my/toggle-class-search ()
  (interactive)
  (let ((class-name nil))
    (save-excursion
      (when (re-search-backward "^\\s-*\\(?:final\\s-+\\)?class\\s-+\\([A-Za-z_][A-Za-z0-9_]*\\)" nil t)
        (setq class-name (match-string-no-properties 1))))
    (when class-name
      (let* ((search-term (if (string-suffix-p "Test" class-name)
                              (string-remove-suffix "Test" class-name)
                            (concat class-name "Test"))))
        (ivy-read "Find file: "
                  (remove (file-relative-name buffer-file-name (projectile-project-root))
                          (projectile-current-project-files))
                  :initial-input (concat search-term "\\b")
                  :action (lambda (file)
                            (find-file (expand-file-name file (projectile-project-root))))
                  :caller 'my/toggle-class-search)))))

(spacemacs/set-leader-keys "od" 'my/toggle-class-search)

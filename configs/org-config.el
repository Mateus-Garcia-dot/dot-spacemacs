(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode -1)))

(use-package org-present
  :config
  (setq org-present-text-scale 3)

  (add-hook 'org-present-mode-hook
            (lambda ()
              (org-present-big)
              (setq-local face-remapping-alist
                          '((header-line (:height 4.0 :inherit variable-pitch))))
              (setq header-line-format " ")
              (visual-line-mode 1)
              (visual-fill-column-mode 1)
              (setq visual-fill-column-width 80)
              (setq visual-fill-column-center-text t)))

  (add-hook 'org-present-mode-quit-hook
            (lambda ()
              (org-present-small)
              (visual-fill-column-mode -1)
              (setq header-line-format nil))))

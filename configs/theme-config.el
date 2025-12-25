(setq-default mode-line-format nil)

(setq spacious-padding-widths
      '( :internal-border-width 15
         :right-divider-width 1
         ))

(with-eval-after-load 'flycheck
  (set-face-attribute 'flycheck-error nil :underline '(:style line :color "#ff6c6b"))
  (set-face-attribute 'flycheck-warning nil :underline '(:style line :color "#ECBE7B")))

(setq window-divider-default-bottom-width 1
      window-divider-default-right-width 1
      window-divider-default-places 'bottom-only)

(defun my/set-window-divider-faces ()
  (set-face-attribute 'window-divider nil :foreground "#2d3640")
  (set-face-attribute 'window-divider-first-pixel nil :foreground "#2d3640")
  (set-face-attribute 'window-divider-last-pixel nil :foreground "#2d3640"))

(add-hook 'spacious-padding-mode-hook
          (lambda ()
            (when spacious-padding-mode
              (my/set-window-divider-faces))))

(spacious-padding-mode 1)
(window-divider-mode 1)
(my/set-window-divider-faces)

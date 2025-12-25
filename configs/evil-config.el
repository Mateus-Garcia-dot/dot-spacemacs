(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "+") (kbd "\"+"))
  (define-key evil-visual-state-map (kbd "+") (kbd "\"+"))
  )

(use-package evil-quickscope
  :config
  (global-evil-quickscope-always-mode 1))

(add-hook 'after-change-major-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

(require 'evil-goggles)
(evil-goggles-mode)
(evil-goggles-use-diff-faces)

(setq evil-symbol-word-search t)

;; Evil mode customizations

(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "+") (kbd "\"+"))
  (define-key evil-visual-state-map (kbd "+") (kbd "\"+"))
  )

(load-file (concat dotspacemacs-directory "packages/evil-quickscope/evil-quickscope.el"))
(require 'evil-quickscope)
(add-hook 'prog-mode-hook 'turn-on-evil-quickscope-always-mode)
(global-evil-quickscope-always-mode 1)

(require 'evil-goggles)
(evil-goggles-mode)
(evil-goggles-use-diff-faces)

(setq evil-symbol-word-search t)

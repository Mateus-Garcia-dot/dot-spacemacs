(use-package consult-gh
  :after consult
  :custom
  (consult-gh-default-clone-directory "~/projects")

  (consult-gh-show-preview t)
  (consult-gh-preview-key "C-o")

  (consult-gh-repo-action #'consult-gh--repo-browse-files-action)

  (consult-gh-confirm-before-clone t)

  :config
  (add-to-list 'savehist-additional-variables 'consult-gh--known-orgs-list)
  (add-to-list 'savehist-additional-variables 'consult-gh--known-repos-list)

  (consult-gh-enable-default-keybindings)

  (require 'consult-gh-transient))

(use-package consult-gh-forge
  :after (consult-gh forge)
  :config
  (consult-gh-forge-mode +1)
  (setq consult-gh-forge-timeout-seconds 20))


(spacemacs/set-leader-keys
  "gh"  'consult-gh-transient
  "ghs" 'consult-gh-search-repos
  "ghi" 'consult-gh-search-issues
  "ghp" 'consult-gh-search-prs
  "ghf" 'consult-gh-find-file
  "ghc" 'consult-gh-search-code
  "ghl" 'consult-gh-repo-list
  "ghd" 'consult-gh-dashboard)

(spacemacs/set-leader-keys "$ c" 'gptel-commit)

(setq gptel-model 'gpt-5.1 )

(use-package gptel-watch
  :after gptel
  :config
  (gptel-watch-global-mode 1))

(with-eval-after-load 'gptel-watch
  (setq gptel-watch-system-prompt
        "You are an inline code and text generation assistant.
Infer the user's intent from context and generate the appropriate content.

Rules:
- Return ONLY the generated content.
- No explanations.
- No Markdown.
- No code fences.
- No surrounding text."))

(with-eval-after-load 'gptel-context
  (set-face-attribute 'gptel-context-highlight-face nil
                      :background "#2d3748FF"
                      :extend t)

  (advice-add 'gptel-context--make-overlay :filter-return
              (lambda (ov)
                (overlay-put ov 'priority 50)
                (overlay-put ov 'face 'gptel-context-highlight-face)
                ov)))

(setq gptel-watch-trigger-commands
      '(newline
        newline-and-indent
        electric-newline-and-maybe-indent
        org-return))

(add-to-list 'gptel-watch-trigger-commands 'self-insert-command)

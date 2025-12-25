;; Enable jinx globally
(dolist (hook '(text-mode-hook prog-mode-hook conf-mode-hook))
  (add-hook hook #'jinx-mode))

(setq-default jinx-languages "en_US")

(spacemacs/set-leader-keys "S s" 'jinx-correct)


(with-eval-after-load 'jinx
  (add-to-list 'jinx-camel-modes 'php-mode)
  (set-face-attribute 'jinx-misspelled nil
                      :underline '(:style line :color "#5c6773"))
  )

(with-eval-after-load 'jinx
  (setq jinx-include-faces
        (let ((extra
               '(tree-sitter-hl-face:comment
                 tree-sitter-hl-face:doc
                 tree-sitter-hl-face:variable
                 tree-sitter-hl-face:function.method
                 tree-sitter-hl-face:constructor
                 tree-sitter-hl-face:string)))
          (cl-loop
           for (mode . faces) in jinx-include-faces
           collect
           (if (eq mode 'prog-mode)
               (cons mode (cl-delete-duplicates (append faces extra)))
             (cons mode faces))))))

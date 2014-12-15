(evil-define-operator evil-commentary (beg end type register)
  "Comment or uncomment region that {motion} moves over."
  :move-point nil
  (interactive "<R><x>")
  (comment-or-uncomment-region beg end))

(evil-define-operator evil-commentary-line (beg end type register)
  "Comment or uncomment [count] lines."
  :motion evil-line
  :move-point nil
  (interactive "<R><x>")
  (when (evil-visual-state-p)
    (unless (memq type '(line block))
      (let ((range (evil-expand beg end 'line)))
        (setq beg (evil-range-beginning range)
              end (evil-range-end range)
              type (evil-type range))))
    (evil-exit-visual-state))
  (comment-or-uncomment-region beg end))

(defun evil-commentary-default-setup ()
  "Default key bindings for `evil-commentary`."
  (interactive)
  (define-key evil-normal-state-map "gc" 'evil-commentary)
  (global-set-key (kbd "s-/") 'evil-commentary-line))

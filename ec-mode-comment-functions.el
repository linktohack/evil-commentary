;;; ec-mode-comment-functions.el --- Other comment functions for specific mode

;; (eval-after-load 'web-mode
;;   '(defun web-mode-comment-or-uncomment-region (beg end)
;;      "Comment or uncomment region."
;;      (interactive)
;;      (save-excursion
;;        (push-mark end)
;;        (goto-char beg)
;;        (setq mark-active t)
;;        (web-mode-comment-or-uncomment)
;;        (pop-mark))))


(provide 'ec-mode-comment-functions)

;;; ec-mode-comment-functions.el ends here

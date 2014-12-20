;;; evil-commentary.el --- Comment stuff out. A port of vim-commentary.

;; Copyright (C) 2014 Quang Linh LE

;; Author: Quang Linh LE <linktohack@gmail.com>
;; URL: http://github.com/linktohack/evil-commentary
;; Version: 0.0.1
;; Keywords: evil comment commentary evil-commentary
;; Package-Requires: ((evil "1.0.0"))

;; This file is not part of GNU Emacs.

;;; License:

;; This file is part of evil-commentary
;;
;; evil-commentary is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation, either version 3 of the License,
;; or (at your option) any later version.
;;
;; evil-commentary is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; This program emulates evil-commentary initially developed by Tim Pope
;; (tpope) It help you comment line with `counts` and `motions`.

;;; Example:
;;
;; `gcc` to comment/uncomment a line
;; `5gcc` to comment/uncomment 5 lines
;; `gc$` to comment/uncomment from current position
;; `gcap` to comment/uncomment current paragraph


;;; Code:

(require 'evil)

(evil-define-operator evil-commentary (beg end type)
  "Comment or uncomment region that {motion} moves over."
  :move-point nil
  (interactive "<R>")
  (comment-or-uncomment-region beg end))

(evil-define-operator evil-commentary-line (beg end type)
  "Comment or uncomment [count] lines."
  :motion evil-line
  :move-point nil
  (interactive "<R>")
  (when (evil-visual-state-p)
    (unless (memq type '(line block))
      (let ((range (evil-expand beg end 'line)))
        (setq beg (evil-range-beginning range)
              end (evil-range-end range)
              type (evil-type range))))
    (evil-exit-visual-state))
  (comment-or-uncomment-region beg end))

;;;###autoload
(defun evil-commentary-default-setup ()
  "Default key bindings for `evil-commentary`."
  (interactive)
  (define-key evil-normal-state-map "gc" 'evil-commentary)
  (global-set-key (kbd "s-/") 'evil-commentary-line))

(provide 'evil-commentary)

;;; evil-commentary.el ends here

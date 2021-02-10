(require 'f)

(defvar evil-commentary-support-path
  (f-dirname load-file-name))

(defvar evil-commentary-features-path
  (f-parent evil-commentary-support-path))

(defvar evil-commentary-root-path
  (f-parent evil-commentary-features-path))

(add-to-list 'load-path evil-commentary-root-path)

;; Ensure that we don't load old byte-compiled versions
(let ((load-prefer-newer t))
  (require 'evil-commentary)
  (require 'espuds)
  (require 'ert))

(Setup
 ;; Before anything has run
 )

(Before
 ;; Before each scenario is run
 )

(After
 ;; After each scenario is run
 )

(Teardown
 ;; After when everything has been run
 )

Feature: Comment in emacs-lisp
  I can comment in and out an elisp buffer

  Background:
    Given I am in buffer "*evil-commentary-test*"
    And the buffer is empty
    And I turn on emacs-lisp-mode
    And I turn on evil-mode
    And I turn on evil-commentary-mode
    And I insert:
    """
    (defun function ()
      "This is a function"
      (interactive)
      nil)
    """

  Scenario: Comment and uncomment a line
    Given I go to line "2"
    And I press "s-/"
    Then I should see:
    """
    (defun function ()
      ;; "This is a function"
      (interactive)
      nil)
    """
    And I press "s-/"
    Then I should see:
    """
    (defun function ()
      "This is a function"
      (interactive)
      nil)
    """

  Scenario: Comment and un comment two lines
    Given I go to line "2"
    And I press "2 s-/"
    Then I should see:
    """
    (defun function ()
      ;; "This is a function"
      ;; (interactive)
      nil)
    """
    Then I go to line "2"
    And I press "2 s-/"
    Then I should see:
    """
    (defun function ()
      "This is a function"
      (interactive)
      nil)
    """


(require 'evil-leader)
(global-evil-leader-mode)
(setq evil-leader/leader "<SPC>")
(evil-leader/set-key
  "/" 'comment-line
  "e" 'find-file
  "b" 'ivy-switch-buffer
  "h" 'help
  "g d" 'elpy-goto-definition
  "g a" 'elpy-goto-assignment
  )
;(evil-leader/set-key "e" 'find-file)
(provide 'evil-leader-key-set)

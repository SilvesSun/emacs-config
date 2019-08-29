(use-package all-the-icons)
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-desc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag))
  )

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;      HELM-Dash
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package helm-dash
  :config
  (progn
    (setq helm-dash-browser-func 'eww)
    (setq helm-dash-docsets-path (expand-file-name "~/.emacs.d/docsets"))

    (helm-dash-activate-docset "Go")
    (helm-dash-activate-docset "Python 3")
    (helm-dash-activate-docset "CMake")
    (helm-dash-activate-docset "Bash")
    (helm-dash-activate-docset "Django")
    (helm-dash-activate-docset "Redis")
    (helm-dash-activate-docset "Emacs Lisp")
    ))
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;     markdown 
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

(use-package markdown-mode
  :ensure t
  :bind (("C-c p" . livedown-preview)
         ("C-c k" . livedown-kill))
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;      Python IDE Setup
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(setq python-indent-offset 4
      python-shell-interpreter "python3"
      pippel-python-command "python3"
      importmagic-python-interpreter "/root/.virtualenvs/django/bin/python")
(setenv "PYTHONIOENCODING" "utf-8")

(use-package pyvenv
  :config
  (progn
    (pyvenv-mode)
    (defalias 'workon 'pyvenv-workon)))

(use-package elpy
  :ensure t
  :defer t
  :commands (elpy-enable)
  :init
  (advice-add 'python-mode :before 'elpy-enable) 
  (setq elpy-rpc-backend "jedi")
  :config
  (with-eval-after-load 'elpy))
(use-package cpython-mode :defer t)
(use-package yapfify
  :init
  (progn
    (add-hook 'python-mode-hook 'yapf-mode)
    ))

;; (use-package anaconda-mode
  ;; :init
  ;; (progn
    ;; (add-hook 'python-mode-hook 'anaconda-mode)
    ;; ))

;; (use-package company-anaconda
;;   :init
;;   (progn
;;     (add-to-list 'company-backends '(company-anaconda :with company-yasnippet))
;;     (add-hook 'python-mode-hook 'anaconda-mode)
;;     ))
(defun pkg-disable-multi-auto-complete ()
  (auto-complete-mode -1))
(add-hook 'python-mode-hook 'pkg-disable-multi-auto-complete)
(add-hook 'python-mode-hook 'elpy-enable)
(provide 'init-use-package-set)

(require 'cl)
(defvar sk/packages '(
				 company
				 hungry-delete
				 evil
				 swiper
				 counsel
				 smartparens
				 popwin
				 exec-path-from-shell
				 markdown-mode
				 smex
				 spacemacs-theme
				 which-key
				 evil-leader
				 treemacs
				 treemacs-evil
				 treemacs-projectile				 
				 )  "Default packages")
(setq package-archives '(("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
			 ("marmalade" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")
			 ("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ))

(setq package-selected-packages sk/packages)

(defun sk/packages-installed-p ()
  (loop for pkg in sk/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (sk/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg sk/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
(require 'popwin)
(popwin-mode 1)
(setq visible-bell t)
(setq ring-bell-function 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)
(require 'cnfonts)

;; 让cnfonts随着emacs一起启动
(cnfonts-enable)
;(setq hippie-expand-try-function-list '(try-expand-debbrev
;					try-expand-debbrev-all-buffers
;					try-expand-debbrev-from-kill
;					try-complete-file-name-partially
;					try-complete-file-name
;					try-expand-all-abbrevs
;					try-expand-list
;					try-expand-line
;					try-complete-lisp-symbol-partially
;					try-complete-lisp-symbol))


;(global-set-key (kbd "s-/") 'hippie-expand)

;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;;初始化which-key
(require 'which-key)
(which-key-mode)
(which-key-setup-side-window-right)
(which-key-setup-minibuffer)

(require 'use-package)

(provide 'init-packages)

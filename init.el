(require 'package)
(setq package-archives '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
			 ("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
			 ))
(package-initialize) ;;
;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)
(global-hi-lock-mode 1)
(menu-bar-mode 0)
;; 关闭文件滑动控件
(scroll-bar-mode -1)
;; disable auto backup
(setq make-backup-files nil)
;; 分屏时自动到新buffer 
(global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1)))
;; 显示行号
(global-linum-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)
(setq auto-save-default nil)
;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)


;; region selected and copy
(setq mouse-drag-copy-region t)

(require 'org)
;; disable startup screen
(setq inhibit-startup-screen t)
;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)
;; Wrap lines at 120 characters
(setq-default fill-column 120)
(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq org-src-fontify-natively t)

;;全局按键绑定
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-s") 'helm-M)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
(setq helm-M-x-fuzzy-match t)
(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "C-<tab>") 'previous-buffer)


;;yasnippet
(setq yas-snippet-dirs '("c:/users/sk.sun/yasippet"))
(yas-global-mode 1)

;; cnfont
(use-package cnfonts
  :ensure t
  :config
  (cnfonts-enable)
  )
(use-package rust-mode
  :ensure t
  )

(use-package projectile)
(use-package csv-mode
  :ensure t)
(use-package awesome-tab
  :load-path "D:/tools/awesome-tab"
  :config
  (awesome-tab-mode t))

(awesome-tab-build-helm-source)
(use-package all-the-icons
  )

(require 'use-package)
(setq use-package-verbose t)
(load-theme 'spacemacs-dark t)
(global-company-mode 1)
(use-package company-tabnine :ensure t)
(add-to-list 'company-backends #'company-tabnine)
;; Trigger completion immediately.
(setq company-idle-delay 0.5)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

(use-package highlight-parentheses
  :ensure t
  :config (highlight-parentheses-mode)
  )
(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "SPC")
  (evil-leader/set-key
    "f f" 'find-file
    "feR" '(lambda() (interactive)(load-file "~/.emacs.d/init.el"))
    "fed" '(lambda() (interactive)(find-file "~/.emacs.d/init.el"))
    "f t" 'treemacs
    ;; org key bind
    "aoa" 'org-agenda-list
    "aoc" 'org-capture
    "aoki" 'org-clock-in
    "aoko" 'org-clock-out
    "aos" 'org-archive-subtree
    ;;buffer settings
    "TAB" 'switch-to-next-buffer
    "bb" 'switch-to-buffer
    "bp" 'switch-to-prev-buffer
    "bk" 'kill-buffer
    )
  )
(use-package evil
  :ensure t
  :config (evil-mode t))

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
        ("C-x t M-t" . treemacs-find-tag)))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package which-key
  :ensure t
  :config
  (which-key-mode 1)
  (setq which-key-popup-type 'minibuffer))
(use-package helm
  :ensure t
  :bind (("M-a" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x f" . helm-recentf)
         ("C-SPC" . helm-dabbrev)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-buffers-list))
  :bind (:map helm-map
	      ("M-i" . helm-previous-line)
	      ("M-k" . helm-next-line)
	      ("M-I" . helm-previous-page)
	      ("M-K" . helm-next-page)
	      ("M-h" . helm-beginning-of-buffer)
	      ("M-H" . helm-end-of-buffer))
  :config (progn
	    (setq helm-buffers-fuzzy-matching t)
            (helm-mode 1)))
(use-package google-this
  :ensure t
  :bind (("C-x g" . 'google-this-mode-submap))
  )

(use-package ob-ipython
  :ensure t)

(google-this-mode 1)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; org mode custom
;; 打开 org-indent mode
;;(setq org-startup-indented t)
;; record time
(setq-default org-display-custom-times t)
(setq org-time-stamp-custom-formats '("<%Y-%m-%d %H:%M:%S>" . "<%Y-%m-%d %H:%M>"))
(format-time-string "%Y-%m-%d %H:%M:%S")
(setq org-log-done 'time)
(global-set-key "\C-ca" 'org-agenda)
;; 设置全局快捷键, 方便随时使用这个功能
(global-set-key (kbd "C-c c") 'org-capture)
;; 配置归档文件的名称和Headline格式

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
(setq org-babel-python-command "C:/Users/sk.sun/AppData/Local/conda/conda/envs/scrapy/python.exe")
;; Python source code blocks in Org Mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ipython . t)
   (emacs-lisp . t)
   (shell . t)
   (rust . t)
   ))

;; org style settings
;; hide the emphasis markup
(setq org-hide-emphasis-markers t)

;; 取消每次运行代码时的确认
(setq org-confirm-babel-evaluate nil)
(setq org-archive-location "%s_archive::date-tree")
(setq org-agenda-file-regexp "\\`[^.].*\\.org\\(_archive\\)?\\'")
(setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))
;; 设置 bullet list

;;美化: Todo Keyword
;; 设置 todo keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "HAND" "|" "DONE(d)")))

(setq org-log-done t)
;; 调试好久的颜色，效果超赞！todo keywords 增加背景色
(setf org-todo-keyword-faces '(("TODO" . (:foreground "white" :background "#95A5A6"   :weight bold))
                                ("HAND" . (:foreground "white" :background "#2E8B57"  :weight bold))
                                ("DONE" . (:foreground "white" :background "#3498DB" :weight bold))))

;; 让中文也可以不加空格就使用行内格式
(setcar (nthcdr 0 org-emphasis-regexp-components) " \t('\"{[:nonascii:]")
(setcar (nthcdr 1 org-emphasis-regexp-components) "- \t.,:!?;'\")}\\[[:nonascii:]")
(org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)
(org-element-update-syntax)
;; 规定上下标必须加 {}，否则中文使用下划线时它会以为是两个连着的下标
(setq org-use-sub-superscripts "{}")
;; agenda 里面时间块彩色显示
;; From: https://emacs-china.org/t/org-agenda/8679/3
(defun sk/org-agenda-time-grid-spacing ()
  "Set different line spacing w.r.t. time duration."
  (save-excursion
    (let* ((background (alist-get 'background-mode (frame-parameters)))
           (background-dark-p (string= background "dark"))
           (colors (list "#1ABC9C" "#2ECC71" "#3498DB" "#9966ff"))
           pos
           duration)
      (nconc colors colors)
      (goto-char (point-min))
      (while (setq pos (next-single-property-change (point) 'duration))
        (goto-char pos)
        (when (and (not (equal pos (point-at-eol)))
                   (setq duration (org-get-at-bol 'duration)))
          (let ((line-height (if (< duration 30) 1.0 (+ 0.5 (/ duration 60))))
                (ov (make-overlay (point-at-bol) (1+ (point-at-eol)))))
            (overlay-put ov 'face `(:background ,(car colors)
                                                :foreground
                                                ,(if background-dark-p "black" "white")))
            (setq colors (cdr colors))
            (overlay-put ov 'line-height line-height)
            (overlay-put ov 'line-spacing (1- line-height))))))))

(server-start)

(add-hook 'org-agenda-finalize-hook #'sk/org-agenda-time-grid-spacing)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(org-agenda-files (quote ("d:/工作文档/gtd.org_archive" "d:/工作文档/gtd.org")))
 '(package-selected-packages
   (quote
    (ob-async yasnippet ob-rust cnfonts csv-mode org-gnome org-bullets google-this treemacs-magit treemacs-icons-dired treemacs-projectile treemacs-evil treemacs lv powershell powerline-evil smart-mode-line-powerline-theme spaceline-all-the-icons spaceline helm-lsp helm which-key evil-leader highlight-parentheses company-tabnine use-package spacemacs-theme)))
 '(python-shell-virtualenv-root
   "C:/Users/sk.sun/AppData/Local/conda/conda/envs/scrapy/python.exe"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



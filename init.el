(set-language-environment "chinese-gbk")
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-16-le)
(set-file-name-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-next-selection-coding-system 'utf-16-le)
(set-selection-coding-system 'utf-16-le)
(set-terminal-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(global-set-key (kbd "C-h") 'delete-backward-char) (global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "<f1>") 'help-command)
(define-key isearch-mode-map "\C-h" 'isearch-delete-char)
;;d by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(scroll-bar-mode -1)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)
(require 'init-better-defaults)
(require 'init-py-input)
(require 'init-key-bind)
(setq make-backup-files nil)
;; 快速打开配置文
(require 'spacemacs-dark-theme)
(load-theme 'spacemacs-dark' t)
;; 开启全局 Company 补全
;;(add-to-list 'company-backends #'company-tabnine)
(eval-after-load 'company
    '(push 'company-tabnine company-backends))
;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)
(global-company-mode 1)
(add-hook 'after-init-hook 'global-company-mode)
(global-linum-mode 1)
(setq normal-erase-is-backspace 1)

(global-set-key (kbd "C-SPC") nil)
(setq inhibit-splash-screen 1)
(xterm-mouse-mode -1)
(tool-bar-mode -1)

;;(setq default-frame-alist '((left . 0) (width . 253) (fullscreen . fullheight)))
(defun maximize-frame ()
  "Maximizes the active frame in Windows"
  (interactive)
  ;; Send a `WM_SYSCOMMAND' message to the active frame with the
  ;; `SC_MAXIMIZE' parameter.
  (when (eq system-type 'windows-nt)
    (w32-send-sys-command 61488)))
(add-hook 'window-setup-hook 'maximize-frame t)

(setq default-directory "~/")
(setq x-select-enable-clipboard t)
;;(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(show-paren-mode 1)
(electric-pair-mode 1)
;;;windmove-mode
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings)
    (global-set-key (kbd "C-c h")  'windmove-left)
    (global-set-key (kbd "C-c l") 'windmove-right)
    (global-set-key (kbd "C-c k")    'windmove-up)
    (global-set-key (kbd "C-c j")  'windmove-down))

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(require 'evil-leader-key-set)
(require 'init-use-package-set)
;; (require 'evil-leader)
;; (global-evil-leader-mode)
;; (setq evil-leader/leader "<SPC>")
;; (evil-leader/set-key "/" 'comment-line)
;; (evil-leader/set-key "e" 'find-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(package-selected-packages
   (quote
    (virtualenvwrapper virtualenv pyenv-mode-auto company-jedi anaconda-mode company-anaconda elpy pyvenv yapfify pyenv-mode helm-dash dash-docs treemacs-evil treemacs-icons-dired treemacs-magit treemacs-projectile treemacs pyim doom-modeline powerline powerline-evil posframe ivy-explorer smex embrace expand-region magit cnfonts auto-org-md paredit rainbow-delimiters evil ewal-spacemacs-themes ewal-spacemacs-theme ewal-evil-cursors company)))
 '(pyim-dicts (quote ((:name "sougou" :file "/root/.emacs.d/"))))
 '(setq default-input-method t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))



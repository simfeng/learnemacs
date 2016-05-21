
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
               ;; --- Auto-completion ---
               company
               ;; --- Better Editor ---
               hungry-delete
               swiper
	       counsel
               ;; counsel
               smartparens
               ;; --- Major Mode ---
               js2-mode
               ;; --- Minor Mode ---
               nodejs-repl
               exec-path-from-shell
               ;; --- Themes ---
               monokai-theme
               ;; solarized-theme
               ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
    (loop for pkg in my/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

(unless (my/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; config js2-mode for js file
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;;config for smartparens
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;;config for swiper and counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)


(require 'hungry-delete)
(global-hungry-delete-mode) ;;hungry-delete用法

;;load主题
(load-theme 'monokai t)

(tool-bar-mode -1) ;关闭工具栏
(scroll-bar-mode -1) ;关闭滚动条


(global-linum-mode t) ;显示行号
(setq inhibit-splash-screen t) ;关闭启动画面
(setq-default cursor-type 'bar) ;改变光标样式

(setq make-backup-files nil);disable backup file(end with ~)

;定义函数，打开自定义init文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'org)
(setq org-src-fontify-natively t) ;文档里面代码语法高亮

;;recent files
(require 'recentf);导入recentf文件，相当于import，可用C-h f查看require功能
(recentf-mode 1);打开recentf模式
(setq recentf-max-menu-items 25) ;设置变量
(global-set-key "\C-x\ \C-r" 'recentf-open-files); 添加快捷键

(delete-selection-mode t);双击选中输入会替换原来的内容

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode);elisp 语法 对应括号高亮

(global-hl-line-mode t) ;高亮当前行

;绑定快捷键
(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-company-mode t)  ;开启全局company模式

(setq initial-frame-alist (quote ((fullscreen . maximized))));开启时全屏

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("6df30cfb75df80e5808ac1557d5cc728746c8dbc9bc726de35b15180fa6e0ad9" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))

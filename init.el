
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(tool-bar-mode -1) ;关闭工具栏
(scroll-bar-mode -1) ;关闭滚动条
(electric-indent-mode -1) ;解决缩进问题

(global-linum-mode t) ;显示行号
(setq inhibit-splash-screen t) ;关闭启动画面

;定义函数，打开自定义init文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;绑定快捷键
(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-company-mode t)  ;开启全局company模式

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

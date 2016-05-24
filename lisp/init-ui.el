(tool-bar-mode -1) ;关闭工具栏
(scroll-bar-mode -1) ;关闭滚动条

(global-linum-mode t) ;显示行号
(setq inhibit-splash-screen t) ;关闭启动画面
(setq-default cursor-type 'bar) ;改变光标样式

(global-hl-line-mode t) ;高亮当前行

(setq initial-frame-alist (quote ((fullscreen . maximized))));开启时全屏

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode);elisp 语法 对应括号高亮

(provide 'init-ui)

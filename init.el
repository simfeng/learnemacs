
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp");;将自定义目录加到emacs load目录


;定义函数，打开自定义init文件
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages);;调用自定义的init-packages文件
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)

;;设置packages custome file 位置并load
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load custom-file)

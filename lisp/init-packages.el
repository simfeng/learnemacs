(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))


;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar zhengquan/packages '(
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
	       popwin
               ;; solarized-theme
               ) "Default packages")

(setq package-selected-packages zhengquan/packages)



(defun zhengquan/packages-installed-p ()
    (loop for pkg in zhengquan/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

(unless (zhengquan/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg zhengquan/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;config for smartparens
;;(require 'smartparens-config) 他是auto load,这里不需要require
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)


;;config for swiper and counsel
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


(require 'popwin)
(popwin-mode 1)

(require 'hungry-delete)
(global-hungry-delete-mode) ;;hungry-delete用法

;; config js2-mode for js file
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(global-company-mode t)  ;开启全局company模式

;;load主题
(load-theme 'monokai t)

(provide 'init-packages) ;;定义此文件的provide名字，其他文件require时使用，一般与文件名相同

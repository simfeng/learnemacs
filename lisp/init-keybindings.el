;;C-c开头一般是用户自定义的快捷键

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key "\C-x\ \C-r" 'recentf-open-files); 添加快捷键

;绑定快捷键
(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-set-key (kbd "C-c p f") 'counsel-git);;counsel-git用于查找git仓库下的文件


(provide 'init-keybindings)

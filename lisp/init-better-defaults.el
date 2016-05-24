(abbrev-mode t) ;;自定义缩写,输入缩写+空格，即出现全写
(define-abbrev-table 'global-abbrev-table '(
					    ("8zq" "zhengquan")
					    ("sbb" "nishishabi")
					    ))

;;recent files
(require 'recentf);导入recentf文件，相当于import，可用C-h f查看require功能
(recentf-mode 1);打开recentf模式
(setq recentf-max-menu-items 25) ;设置变量


(global-auto-revert-mode t) ;自动从磁盘加载

(setq make-backup-files nil);disable backup file(end with ~)
(setq auto-save-default nil);禁止自动保存

(delete-selection-mode t);双击选中输入会替换原来的内容

(setq ring-bell-function 'ignore);;关闭提示音


(provide 'init-better-defaults)

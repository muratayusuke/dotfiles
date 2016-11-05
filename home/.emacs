
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load "~/.emacs.d/init.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(package-selected-packages
   (quote
    (flycheck-pos-tip flycheck yaml-mode undo-tree terraform-mode scss-mode rubocop rinari rhtml-mode revive recentf-ext pos-tip pkg-info php-mode multiple-cursors markdown-mode magit js2-mode jade-mode init-loader highlight-indentation helm-gtags helm-git-files helm-descbinds helm-c-yasnippet helm-ag-r haml-mode golden-ratio gitignore-mode gitconfig-mode git-gutter-fringe flex-autopair feature-mode f expand-region emmet-mode egg color-theme coffee-mode auto-complete anzu)))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

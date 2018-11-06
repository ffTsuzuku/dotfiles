;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


;;Disable emacs welcome
(setq inhibit-startup-screen t)


;;PowerLine
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
(setq powerline-arrow-shape 'arrow)


;;Dracula theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'dracula t)


;;Disable Menu, Scroll and, toolbar
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;;Disable Tabs
(setq-default indent-tabs-mode nil)


;;Set tab to 4
(setq tab-stop-list (number-sequence 4 200 4))



;;Column Marker Config
;;Use C-h v major-mode RET to get names
(setq-default
 whitespace-line-column 80
 whitespace-style       '(face lines-tail))

(add-hook 'prog-mode-hook #'whitespace-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;C Mode Config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(setq-default c-basic-offset 8)




;;Shit happened with M-x install package
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 '(package-selected-packages (quote (##))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;Neo Tree Added.
(add-to-list 'load-path "/home/tsuzuku/.emacs.d/vendor/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(tool-bar-mode -1)

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
(setq abg-required-packages
      (list 'ergoemacs-keybindings ))
(dolist (package abg-required-packages)
  (when (not (package-installed-p package))
    (package-refresh-contents)
    (package-install package)))

(require 'ergoemacs-mode)
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "us")
(ergoemacs-mode 1)

(cua-mode t)
(ido-mode t)
(setq ring-bell-function 'ignore)
(transient-mark-mode 1)
(delete-selection-mode 1)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

(when (featurep 'ns-win)
  (custom-set-faces
   '(default ((t (:height 180 :width normal :family "Menlo")))))
  )

(require 'maxframe)
(maximize-frame)

(require 'nginx-mode)
(setq auto-mode-alist
      (append '(("\\.conf$" . nginx-mode)) auto-mode-alist))
(add-hook 'nginx-mode-hook (lambda () (set tab-width 4)))


(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
   				     interpreter-mode-alist))

(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (inf-ruby-keys)
	     ))

(add-hook 'ruby-mode-hook (lambda () (set tab-width 2)))
(line-number-mode 1)
(global-linum-mode 1) 
(column-number-mode 1)
(setq make-backup-files nil) 
(setq auto-save-default nil) 
(recentf-mode 1)
(global-visual-line-mode 1) 
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)

(add-to-list 'load-path "~/.emacs.d/magit")
(require 'magit)

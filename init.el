(tool-bar-mode -1)
(setq inhibit-startup-message t)
(defalias 'yes-or-no-p 'y-or-n-p)
(iswitchb-mode 1)

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

;; Setting English Font
(set-face-attribute
  'default nil :font "Menlo 16")
 
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft YaHei" :size 16)))

(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-blackboard)))

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

(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(require 'tabbar)
; turn on the tabbar
(tabbar-mode t)
; define all tabs to be one of 3 possible groups: “Emacs Buffer”, “Dired”,
;“User Buffer”.

(defun tabbar-buffer-groups ()
  "Return the list of group names the current buffer belongs to.
This function is a custom function for tabbar-mode's tabbar-buffer-groups.
This function group all buffers into 3 groups:
Those Dired, those user buffer, and those emacs buffer.
Emacs buffer are those starting with “*”."
  (list
   (cond
    ((string-equal "*" (substring (buffer-name) 0 1))
     "Emacs Buffer"
     )
    ((eq major-mode 'dired-mode)
     "Dired"
     )
    (t
     "User Buffer"
     )
    ))) 

(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

(global-set-key (kbd "M-{") 'tabbar-backward)
(global-set-key (kbd "M-}") 'tabbar-forward)

(global-set-key (kbd "M-=") 'text-scale-increase)
(global-set-key (kbd "M--") 'text-scale-decrease)
(global-set-key (kbd "M-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "M-w") 'close-current-buffer)

(require 'textmate)
(require 'peepopen)
(textmate-mode)

(add-to-list 'load-path "~/.emacs.d/slime/")
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(require 'slime)
(slime-setup)

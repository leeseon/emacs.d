(tool-bar-mode -1)
(cua-mode t)
(ido-mode t)

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
					; show line number the cursor is on, in status bar (the mode line)
(line-number-mode 1)
					; display line numbers in margin (fringe). Emacs 23 only.
(global-linum-mode 1) ; always show line numbers
(column-number-mode 1)
(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files
(recentf-mode 1)
(global-visual-line-mode 1) ; 1 for on, 0 for off.
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)

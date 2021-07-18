;; Visual Clutter:

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(load "~/.emacs.d/interface.el")
(setq frame-resize-pixelwise t)
(setq global-linum-mode t)
(setq dired-listing-switches "-ahl")
(exit-splash-screen)


(find-file "~/sam.org")

(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-<return>") 'eshell)
(global-set-key (kbd "M-<right>") 'tab-next)
(global-set-key (kbd "M-<left>") 'tab-previous)
(global-set-key (kbd "C-x f") 'fzf)
(global-set-key (kbd "C-x F") 'fzf-dired)

(setq eshell-prefer-lisp-functions t)

;; Packages

(require 'package)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

(package-initialize)
(package-refresh-contents)
(require 'use-package)
(require 'skeleton)
(use-package use-package)
(use-package auctex
	     :defer t
	     :ensure t)
(use-package auctex-latexmk)
(use-package magit)
(use-package org)
(use-package bind-key)
(use-package go-mode)
(use-package haskell-mode)
(use-package pdf-tools)
(require 'server)
(require 'tramp)
(server-start)


(defun insert-shell-command (cmd) (insert (shell-command-to-string (format "printf %%s \"$(%s)\"" cmd))))
(defun insert-date (date) (interactive "sWhen? ") (insert-shell-command (format "date -d '%s'" date)))


;; LaTeX



(define-skeleton tex-insert-par "inserts big tex parens" nil "\\left( " _ " \\right)")
(define-skeleton tex-insert-ang "inserts big tex angles" nil "\\langle " _ " \\rangle")
(define-skeleton tex-insert-brackets "inserts big tex brackets" nil "\\left[ " _ " \\right]")
(define-skeleton tex-insert-set "inserts a big set" nil "\\left\\{ " _ " \\right\\}")
(define-skeleton tex-insert-norm "inserts a big norm" nil "\\Vert " _ " \\Vert")
(bind-key "M-p (" 'tex-insert-par LaTeX-mode-map)
(bind-key "M-p <" 'tex-insert-ang LaTeX-mode-map)
(bind-key "M-p [" 'tex-insert-brackets LaTeX-mode-map)
(bind-key "M-p s" 'tex-insert-set LaTeX-mode-map)
(bind-key "M-p n" 'tex-insert-norm LaTeX-mode-map)

(auctex-latexmk-setup)
(setq TeX-view-program-list '(("Zathura" "zathura %o")))
(setq TeX-view-program-selection '((output-pdf "Zathura")))

;; Org

(setq org-html-doctype "html5")
(setq org-publish-project-alist
      '(("personal-website"
	:base-directory "~/repos/samueltwallace.github.io"
	:base-extension "org"
	:publishing-directory "~/repos/samueltwallace.github.io"
	:publishing-function org-html-publish-to-html
	:auto-sitemap t
	:recursive t
	:sitemap-title "Map of this site"
	)
      ))

(setq org-latex-compiler "latexmk")

;; Julia

(defun run-julia () (interactive) (ansi-term "/usr/bin/julia"))

;; Zathura

(setq async-shell-command-buffer "new-buffer")

(defun zathura-view (file) (interactive "sFile: ") (async-shell-command (format "/usr/bin/zathura %s" file) "* Zathura *"))

(defun dired-zathura-view-marked () (interactive) (mapc (lambda (file) (async-shell-command (format "/usr/bin/zathura \"%s\"" file) "* Zathura *" )) (dired-get-marked-files)))

;; Haskell

(defun run-ghci () (interactive) (ansi-term "/usr/bin/ghci"))

;; FZF

(defun fzf-dired () (interactive) (fzf-with-entries (directory-files-recursively default-directory  ".+/" t) 'dired))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("cf9414f229f6df728eb2a5a9420d760673cca404fee9910551caf9c91cff3bfa" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" default))
 '(org-agenda-files '("~/sam.org"))
 '(package-selected-packages
   '(lua-mode fzf pdf-tools tron-legacy-theme julia-mode ormolu haskell-mode nord-theme gruvbox-theme go-mode use-package magit auctex-latexmk)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

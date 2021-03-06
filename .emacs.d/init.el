;; Visual Clutter:

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-face-attribute 'default nil :family "IBM Plex Mono")
(set-face-attribute 'default nil :height 98)
(load-theme 'gruvbox-dark-hard)
(setq frame-resize-pixelwise t)
(setq global-linum-mode t)
(setq dired-listing-switches "-ahl")
(exit-splash-screen)

(find-file "~/org/top.org")

(global-set-key (kbd "C-<tab>") 'other-window)

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
(require 'server)

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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" default))
 '(org-agenda-files
   '("~/org/misc/www.org" "~/org/fiction/books.org" "~/org/top.org" "~/org/work/MSGI2021.org" "~/org/tech/software.org" "~/org/tech/hardware.org" "~/org/school/ian.org" "~/org/misc/agenda.org" "~/org/fiction/DnDCampaignIdeas.org"))
 '(package-selected-packages '(gruvbox-theme go-mode use-package magit auctex-latexmk)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

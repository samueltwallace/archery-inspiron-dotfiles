;; Visual Clutter:

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-face-attribute 'default nil :family "Iosevka")
(set-face-attribute 'default nil :height 98)
(load-theme 'wombat)
(setq frame-resize-pixelwise t)
(setq global-linum-mode t)
(setq dired-listing-switches "-ahl")

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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(go-mode use-package magit auctex-latexmk)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

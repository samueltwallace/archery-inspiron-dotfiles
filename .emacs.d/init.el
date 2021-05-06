;; Visual Clutter:

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-face-attribute 'default nil :family "Iosevka")
(set-face-attribute 'default nil :height 98)
(load-theme 'wombat)
(setq frame-resize-pixelwise t)
(setq global-linum-mode t)

;; Packages

(require 'package)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

(package-initialize)
(package-refresh-contents)
(require 'use-package)
(use-package use-package)
(use-package auctex
	     :defer t
	     :ensure t)
(use-package auctex-latexmk)
(use-package magit)
(use-package org)

;; LaTeX

(auctex-latexmk-setup)
(setq TeX-view-program-list '(("Zathura" "zathura %o")))
(setq TeX-view-program-selection '((output-pdf "Zathura")))

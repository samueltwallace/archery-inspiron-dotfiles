.PHONY: update desktop emacs shell yay science CLI DESKTOP EMACS YAY SCIENCE

CLI = zsh fzf ripgrep which
DESKTOP = xorg xmonad rofi i3lock firefox pipewire picom pipewire-alsa lightdm lightdm-gtk-greeter
EMACS = emacs
YAY = zoom nxyt
SCIENCE = julia texlive-most biber

all: update 

update:
	@echo Updating...
	@sudo pacman -Syu
	@git pull
	@yay -Syu

desktop: .xmonad/xmonad.hs
	@echo Installing...
	@sudo pacman -Sv ${DESKTOP}
	@echo Creating configuration...
	@cp -v .xmonad/xmonad.hs $HOME/.xmonad/xmonad.hs
	@echo Enabling Display Manager...
	@sudo systemctl enable lightdm

emacs: .emacs.d/init.el .emacs.d/interface.el
	@echo Installing Emacs...
	@sudo pacman -Sv ${EMACS}
	@echo Creating configuration...
	@cp -v .emacs.d/init.el $HOME/.emacs.d/init.el
	@cp -v .emacs.d/interface.el $HOME/.emacs.d/interface.el
cli:
	@sudo pacman -Sv ${CLI}


.ONESHELL:
yay:
	@echo Installing prerequisites...
	@sudo pacman -Sv base-devel git
	@ORIGDIR=$(pwd)
	@mkdir -p $HOME/.cache/
	@cd $HOME/.cache
	@git clone https://aur.archlinux.org/yay.git
	@cd yay
	@echo Buiding yay...
	@makepkg -si
	@echo Installing packages...
	@yay -Sv ${YAY}

science:
	@echo Installing packages...
	@sudo pacman -Sv ${SCIENCE}
	@echo Installing Julia packages...
	@julia -e 'using Pkg; Pkg.add("Plots")'

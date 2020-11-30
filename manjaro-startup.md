# Manjaro Startup Notes

Update software: `sudo pacman -Syu` #TODO: What is it different from `sudo pacman -Syyu`

Install some useful software:

```bash
sudo pacman -S yay
yay -S google-chrome
```

## Natural Scrolling

Open the `/etc/X11/xorg.conf.d/30-touchpad.conf` file, then add the natural scrolling option:

```
Section "InputClass"
    ...
    Option "Natural Scrolling" "true"
    ...
EndSection
```

## (China Specific) Install Proxy 

Use the command `sudo pacman -S ss-qt5`. In I3WM, it is difficult to set global proxy. It would be better to use SwitchyOmega in Chrome. First use `google-chrome-stable --proxy-server="<proxy_address>"` to launch chrome and download SwitchyOmega then use chrome as usual. 

## (China Specific) Install input sources

Install fcitx first: `sudo pacman -S fcitx-im fcitx-configtool fcitx-googlepinyin`. Then add the following content to `~/.xprofile`. 

```
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
```

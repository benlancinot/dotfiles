export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR="nvim"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BROWSER=/usr/bin/firefox
export HOSTALIASES=/etc/host.aliases
export SUDO_EDITOR=$EDITOR
export KUBE_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR
export GOPATH=$HOME/dev/go
export GO111MODULE=on
export GONOSUMDB="github.com/gustvision/*"
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export ANDROID_HOME=$HOME/Android/Sdk
export SDK_HOME=/opt/android-sdk
export GRADLE_HOME=/usr/bin/gradle
export GTK_THEME='Catppuccin-Frappe-Standard-Lavender-dark:dark'

export PATH="$GOPATH/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/.gem/ruby/3.0.0/bin:$PATH:$HOME/.npm-global/bin"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    # Start with wayland WM
    export WLR_NO_HARDWARE_CURSORS=1
    export GTK_USE_PORTAL=1
    export _JAVA_AWT_WM_NONREPARENTING=1
    export MOZ_ENABLE_WAYLAND=1
    export MOZ_DBUS_REMOTE=1
    export TERM=kitty
    export XDG_CURRENT_DESKTOP=Hyprland
    export CLUTTER_BACKEND=wayland

    #exec sway
    exec Hyprland

    # Start i3 WM with X
    # export TERM=rxvt-unicode-256color
    # exec startx
fi

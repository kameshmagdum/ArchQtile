#!/bin/bash
SRL="$(echo -e "Shutdown\nReboot\nLogout\nCancel" | fzf --prompt=" Why u wanna leave... " --color=dark --height 90% --reverse --header="    LOGOUT MENU " --info=hidden --header-first)"

case $SRL in
    Shutdown) 
        sudo /sbin/shutdown -h now
        ;;
    Reboot)
        sudo /sbin/reboot
        ;;
    Logout)
        qtile cmd-obj -o cmd -f shutdown
        ;;
    *)
        ;;
esac

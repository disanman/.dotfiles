#!/usr/bin/fish

function fish_prompt
    set_color green
    printf '𘠌'
    # printf '%s@%s%s%s%s> ' (whoami) (hostname | cut -d . -f 1) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
    set_color blue
    printf '𘠓'
    set_color $fish_color_cwd
    printf (prompt_pwd)
    set_color normal
    printf '> '
end

# Functions for VI mode (also cursor change in urxvt)
function hybrid_bindings --description "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
# Setting cursor mode
function fish_vi_cursor --on-variable fish_bind_mode
    switch $fish_bind_mode
        case default
            printf "\033[2 q"
        case insert
            printf "\033[6 q"
        case replace
            printf "\033[4 q"
    end
end

# Functions used to search in Google and Duck Duck go
function ds
    w3m 'duckduckgo.com/?q='$argv
end
function gs
    w3m 'google.com/search?q='$argv
end
function gd
    w3m 'google.com/search?q=define '$argv
end
function ws
    w3m 'en.wikipedia.org/wiki/'$argv
end


# Settings
set -U fish_greeting  # removes greetings!
set -g fish_key_bindings hybrid_bindings
# fish_vi_cursor
export PATH="$PATH:$HOME/.vim/bundle/vim-superman/bin"
export PATH="/home/diego/miniconda3/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Programs abbr
abbr x 'exit'
abbr iftop 'sudo iftop -i wlp9s0'
abbr gotop 'gotop -c monokai'
abbr g 'gotop'
abbr v 'nvim'
abbr n 'nvim'
abbr sv 'sudo nvim'
abbr sr 'sudo ranger'
abbr update 'sudo pacman -Syy'
abbr upgrade 'sudo pacman -Su'
abbr install 'sudo pacman -S'
abbr remove 'sudo pacman -Rs'
# Install/Uninstall programs using yay and fzf!
abbr yinstall "yay -Slq | fzf -q '$1' -m --preview 'yay -Si {1}'| xargs -ro yay -S"
abbr yremove "yay -Qq | fzf -q '$1' -m --preview 'yay -Qi {1}' | xargs -ro yay -Rns"
abbr autoremove 'sudo apt autoremove'
abbr b 'feh --randomize --bg-fill ~/Pictures/Wallpapers/*'
abbr f 'figlet'
abbr r 'ranger'
alias c 'git --git-dir=/home/diego/.cfg/ --work-tree=/home/diego'
abbr cs 'c status'
abbr cc 'c commit -a'
abbr cdiff 'c difftool'
abbr cdf 'c difftool'
abbr q 'jupyter qtconsole & disown'
abbr j 'jupyter notebook --notebook-dir=~/Documents/Python/ML_projects/'
abbr star_wars 'telnet towel.blinkenlights.nl'
abbr ll 'ls -alF'
abbr la 'ls -A'
abbr l 'ls -CF'
abbr today 'cal -3 && date'
# Mount and unmount disk
abbr m_disk 'udisksctl mount -b /dev/sdb1'  # use lsblk to find disk names
abbr um_disk 'udisksctl unmount -b /dev/sdb1'
abbr umk 'udisksctl unmount -b /dev/sdb1'
abbr m_data 'udisksctl mount -b /dev/sda1'  # use lsblk to find disk names
abbr md 'udisksctl mount -b /dev/sda1'  # use lsblk to find disk names
abbr um_data 'udisksctl unmount -b /dev/sda1'
abbr ud 'udisksctl unmount -b /dev/sda1'  # use lsblk to find disk names

# Utilities
abbr count_files 'find -type f | wc -l'    # recursive count of number of files in current folder
abbr cf 'find -type f | wc -l'    # recursive count of number of files in current folder

# Tasks shortcuts
abbr t 'clear && task'
abbr ta 'task add'
abbr tm 'task modify'
abbr td 'task done'
abbr tu 'task undo'
abbr tsy 'task sync'
abbr t@ 'task @'
abbr t@w 'task @ work'
abbr t@h 'task @ home'
abbr t@0 'task @ none'
abbr tw 'task @ work && clear && task'
abbr th 'task @ home && clear && task'
abbr t0 'task @ none && clear && task'
# Task reports
abbr tww 'clear && task waiting'
abbr tp 'clear && task projects'
abbr ts 'clear && task summary'
abbr st 'clear && task start'
abbr ttime 'clear && task timesheet'
abbr tc 'clear && task completed'
abbr tr 'clear && task recurring'
abbr tcal 'clear && task calendar'
abbr tbd 'clear && task burndown.daily'
abbr tbw 'clear && task burndown.weekly'
abbr tbm 'clear && task burndown.monthly'
abbr thd 'clear && task history.daily'
abbr thw 'clear && task history.weekly'
abbr thm 'clear && task history.monthly'
abbr thy 'clear && task history.yearly'
abbr tghd 'clear && task ghistory.daily'
abbr tghw 'clear && task ghistory.weekly'
abbr tghm 'clear && task ghistory.monthly'
abbr tghy 'clear && task ghistory.yearly'
# Task filters
abbr tpj 'task project:'
# TimeWarrior
abbr tws 'timew summary'

# Expressvpn
abbr vpn 'sudo systemctl start expressvpn.service && sleep 3 && expressvpn connect'
abbr e 'expressvpn'
abbr ec 'expressvpn connect'
abbr ed 'expressvpn disconnect'
# History
abbr h 'history | fzf'

# Opening youtube videos using vlc and specific resolutions
abbr y 'ytfzf -t'
abbr y240 'cvlc --preferred-resolution 240'
abbr y360 'cvlc --preferred-resolution 360'
abbr y480 'cvlc --preferred-resolution 480'
abbr y720 'cvlc --preferred-resolution 720'
abbr y1080 'cvlc --preferred-resolution 1080'

# abbr for machine connection
abbr ssh_abi_linux 'ssh -i ~/Documents/crawlers crawler@35.204.0.72'
abbr ssh_tableau_linux 'ssh -i ~/Documents/crawlers user@35.198.171.3'
abbr ssh_web_services_ws 'ssh -i ~/Documents/crawlers crawler@35.242.229.152'
abbr ssh_pricing_gba 'ssh -i ~/Documents/crawlers crawler@35.234.125.251'
abbr sp 'ssh -i ~/Documents/crawlers crawler@35.234.125.251'
abbr ssh_pricing_vs 'ssh -i ~/Documents/crawlers crawler@35.207.89.160'
abbr ssh_mount_pricing_gba 'sudo mkdir /mnt/pricing_gba && sudo sshfs crawler@35.234.125.251:/home/crawler/ /mnt/pricing_gba/ -o IdentityFile=~/Documents/crawlers'
abbr ssh_umount_pricing_gba 'sudo fusermount -u /mnt/pricing_gba && sudo rm -r /mnt/pricing_gba'

# Abbr for weather
abbr now 'bash ~/Documents/Notes/Linux/now.sh'
abbr w1 "curl 'https://en.wttr.in/Dusseldorf'"
abbr w2 "curl 'https://en.wttr.in/Dusseldorf?format=v2'"
abbr w3 "curl -s 'wttr.in/{Dusseldorf,Milan,Bogota}?format=3'"

# abbr for config files
abbr cfi 'nvim ~/.i3/config'            # Config i3
abbr cfc 'nvim ~/.config/compton.conf'         # Config i3
abbr cfb 'nvim ~/.bashrc'                      # Config bashrc
abbr cfq 'nvim ~/.config/qutebrowser/config.py' # Config qutebrowser
abbr cfr 'nvim .config/ranger/rc.conf'         # Config ranger
abbr cfrr 'nvim .config/ranger/rifle.conf'     # Config ranger-rifle
abbr cfrc 'nvim ~/.config/ranger/commands.py'  # Config ranger-commands
abbr cfrs 'nvim ~/.config/ranger/scope.sh'     # Config ranger-scope
abbr cff 'nvim ~/.config/fish/config.fish'     # Config fish shell
abbr cfk 'nvim ~/.config/kitty/kitty.conf'     # Config Kitty terminal
abbr cfv 'nvim ~/.config/nvim/init.vim'        # Config nvim
abbr cft 'nvim ~/.taskrc'                      # Config task
abbr restart 'sudo shutdown -r now'
abbr low_light 'xbacklight -set 0.01'
abbr reload_term 'xrdb ~/.Xresources'
abbr ip 'ipython --no-autoindent'
abbr py39 '~/miniconda3/envs/py39/bin/python'
abbr pip39 '~/miniconda3/envs/py39/bin/pip'

# Change locale
abbr es 'setxkbmap es && setxkbmap -option caps:swapescape && xmodmap /home/diego/.Xmodmap && xmodmap -e "keycode 65 = Hyper_L" && xmodmap -e "keycode any = space" && killall xcape && xcape -e "Hyper_L=space" && notify-send "Locale: ES"'
abbr us 'setxkbmap us && setxkbmap -option caps:swapescape && xmodmap /home/diego/.Xmodmap && xmodmap -e "keycode 65 = Hyper_L" && xmodmap -e "keycode any = space" && killall xcape && xcape -e "Hyper_L=space" && notify-send "Locale: US"'

# Start/Stop PostgreSQL
abbr pstart 'pg_ctl -D /var/lib/postgres/data/ start'

# Bluetooth devices
abbr bp 'bluetoothctl power on && bluetoothctl connect E8:07:BF:F3:1D:7A'
abbr bh 'bluetoothctl power on && bluetoothctl connect 00:16:94:28:CE:28'
abbr bd 'bluetoothctl disconnect && bluetoothctl power off'
abbr bi 'bluetoothctl info'
abbr bs 'bluetoothctl scan'
abbr bc 'bluetoothctl scan'

# Screen settings, created by using arandr (save option)
abbr 2s 'sh ~/.screenlayout/2_screens.sh && feh --randomize --bg-fill ~/Pictures/Wallpapers/*'
abbr 1s 'sh ~/.screenlayout/1_screen.sh && feh --randomize --bg-fill ~/Pictures/Wallpapers/*'
abbr 1bs 'sh ~/.screenlayout/1_big_screen.sh && feh --randomize --bg-fill ~/Pictures/Wallpapers/*'

# Tuxi
abbr tt tuxi

# Screen settings
abbr om 'optimus-manager'

# Play emulator
abbr play 'pcsxr'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/diego/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


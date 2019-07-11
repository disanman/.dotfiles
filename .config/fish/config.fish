#!/usr/bin/fish

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

# Settings
set -U fish_greeting  # removes greetings!
set -g fish_key_bindings hybrid_bindings
# fish_vi_cursor
export PATH="$PATH:$HOME/.vim/bundle/vim-superman/bin"
export PATH="/home/diego/miniconda3/bin:$PATH"

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
abbr autoremove 'sudo apt autoremove'
abbr b 'feh --randomize --bg-fill ~/Pictures/Wallpapers/*'
abbr f 'figlet'
abbr r 'ranger'
alias c 'git --git-dir=/home/diego/.cfg/ --work-tree=/home/diego'
abbr q 'jupyter qtconsole & disown'
abbr j 'jupyter notebook'
abbr star_wars 'telnet towel.blinkenlights.nl'
abbr ll 'ls -alF'
abbr la 'ls -A'
abbr l 'ls -CF'
abbr today 'cal -3 && date'
# Mount and unmount disk
abbr m_disk 'udisksctl mount -b /dev/sdb1'  # use lsblk to find disk names
abbr um_disk 'udisksctl unmount -b /dev/sdb1'
abbr m_data 'udisksctl mount -b /dev/sda1'  # use lsblk to find disk names
abbr um_data 'udisksctl unmount -b /dev/sda1'

# Opening youtube videos using vlc and specific resolutions
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

# abbr for config files
abbr cfi 'nvim ~/.i3/config'            # Config i3
abbr cfc 'nvim ~/.config/compton.conf'         # Config i3
abbr cfb 'nvim ~/.bashrc'                      # Config bashrc
abbr cfq 'nvim ~/.config/qutebrowser/config.py' # Config qutebrowser
abbr cfr 'nvim .config/ranger/rc.conf'         # Config ranger
abbr cfrr 'nvim .config/ranger/rifle.conf'     # Config ranger-rifle
abbr cfrc 'nvim ~/.config/ranger/commands.py'  # Config ranger-commands
abbr cff 'nvim ~/.config/fish/config.fish'     # Config fish shell
abbr cfv 'nvim ~/.config/nvim/init.vim'        # Config nvim
abbr restart 'sudo shutdown -r now'
abbr low_light 'xbacklight -set 0.01'
abbr reload_term 'xrdb ~/.Xresources'
abbr ip 'ipython --no-autoindent'

# Start/Stop PostgreSQL
abbr pstart 'pg_ctl -D /var/lib/postgres/data/ start'

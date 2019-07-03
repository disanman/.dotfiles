# ------------------------------------------------------------------------
exec fish
# ------------------------------------------------------------------------

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
fi
# unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# added by Miniconda3 installer
export PATH="/home/diego/miniconda3/bin:$PATH"

# Added for openning w3m using images:
w3mimg (){
    w3m -o imgdisplay=/usr/lib/w3m/w3mimgdisplay $1
}

function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# maketar ~/folder_to_compress
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# makezip ~/folder_to_compress
function makezip() { zip -r "${1%%/}.zip" "$1" ; }


# Programs alias
alias x='exit'
alias iftop='sudo iftop -i wlp9s0'
alias gotop='gotop -c monokai'
alias v='nvim'
alias sv='sudo nvim'
# alias update='sudo apt update'
# alias upgrade='sudo apt upgrade'
# alias install='sudo apt install'
# alias remove='sudo apt remove'
alias update='sudo pacman -Syy'
alias upgrade='sudo pacman -Su'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rs'
alias autoremove='sudo apt autoremove'
alias f='figlet'
alias r='ranger'
alias config='/usr/bin/git --git-dir=/home/diego/.cfg/ --work-tree=/home/diego'
alias c='config'
alias b='feh --randomize --bg-fill ~/Pictures/Wallpapers/*'
alias q='jupyter qtconsole &'
alias j='jupyter qtconsole &'
alias star_wars='telnet towel.blinkenlights.nl'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias today='cal -3 && date'
# Mount and unmount disk
alias m_disk='udisksctl mount -b /dev/sdb1'  # use lsblk to find disk names
alias um_disk='udisksctl unmount -b /dev/sdb1'
alias m_data='udisksctl mount -b /dev/sda1'  # use lsblk to find disk names
alias um_data='udisksctl unmount -b /dev/sda1'

# Opening youtube videos using vlc and specific resolutions
alias y240='cvlc --preferred-resolution 240'
alias y360='cvlc --preferred-resolution 360'
alias y480='cvlc --preferred-resolution 480'
alias y720='cvlc --preferred-resolution 720'
alias y1080='cvlc --preferred-resolution 1080'

# Alias for machine connection
alias ssh_abi_linux='ssh -i ~/Documents/crawlers crawler@35.204.0.72'
alias ssh_tableau_linux='ssh -i ~/Documents/crawlers user@35.198.171.3'
alias ssh_web_services_ws='ssh -i ~/Documents/crawlers crawler@35.242.229.152'
alias ssh_pricing_gba='ssh -i ~/Documents/crawlers crawler@35.234.125.251'
alias sp='ssh -i ~/Documents/crawlers crawler@35.234.125.251'
alias ssh_pricing_vs='ssh -i ~/Documents/crawlers crawler@35.207.89.160'
alias ssh_mount_pricing_gba='sudo mkdir /mnt/pricing_gba && sudo sshfs crawler@35.234.125.251:/home/crawler/ /mnt/pricing_gba/ -o IdentityFile=~/Documents/crawlers'
alias ssh_umount_pricing_gba='sudo fusermount -u /mnt/pricing_gba && sudo rm -r /mnt/pricing_gba'


# Alias for config files
alias cfi='nvim ~/.i3/config'            # Config i3
alias cfc='nvim ~/.config/compton.conf'         # Config i3
alias cfb='nvim ~/.bashrc'                      # Config bashrc
alias cfq='nvim ~/.config/qutebrowser/config.py' # Config qutebrowser
alias cfr='nvim .config/ranger/rc.conf'         # Config ranger
alias cfrr='nvim .config/ranger/rifle.conf'     # Config ranger-rifle
alias cfrc='nvim ~/.config/ranger/commands.py'  # Config ranger-commands
alias cff='nvim ~/.config/fish/config.fish'     # Config fish shell
# alias cfv='nvim ~/.vimrc'               # Config vim
alias cfv='nvim ~/.config/nvim/init.vim'        # Config nvim
alias restart='sudo shutdown -r now'
alias low_light='xbacklight -set 0.01'
alias reload_term='xrdb ~/.Xresources'
alias ip='ipython --no-autoindent'

# Modified default Text editor:
VISUAL=nvim; export VISUAL EDITOR=nvim; export EDITOR
# Activate vi mode in terminal:
set -o vi

# Added for using fuzzy search: fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/diego/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/diego/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/diego/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/diego/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# Testing note searching with parameter input, call it like "n text_to_search"
n() {
    rg -i "$1" | fzf --preview 'file {}' && nvim
}


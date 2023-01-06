# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/ben/.oh-my-zsh"

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

POWERLEVEL9K_MODE="nerdfont-complete"
plugins=(zsh-syntax-highlighting git archlinux man golang kubectl zsh-autosuggestions colored-man-pages taskwarrior npm systemd docker docker-compose emacs helm sudo kubectx)

source $ZSH/oh-my-zsh.sh

# Common alias
alias l='colorls --sd'
alias la='colorls --sd -Al'
alias ll='colorls --sd -l'
alias lrt='ls -1Fcrt'

alias zshrc='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias fdi='find . -type d -name'
alias ff='find . -type f -name'
alias ffi='find . -type f -iname'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# extra git aliases
alias gitcommitempty='git commit --allow-empty -m "chore(): rebuild 👀"'

# golint alias
alias golint="golangci-lint run -E bodyclose -E dupl -E funlen -E gocognit -E goconst -E gocritic -E gocyclo -E godox -E gofmt -E interfacer -E prealloc"

# alias dual screen
alias x_dualscreen_left="xrandr --output eDP1 --auto --output $(xrandr | grep " connected " | grep -v primary | awk '{print $1}') --auto --left-of eDP1 && ~/.polybar/launch_polybar.sh"
alias x_dualscreen_right="xrandr --output eDP1 --auto --output $(xrandr | grep " connected " | grep -v primary | awk '{print $1}') --auto --right-of eDP1 && ~/.polybar/launch_polybar.sh"
alias x_dualscreen_off="xrandr --output  $(xrandr | grep " connected " | grep -v primary | awk '{print $1}') --off && ~/.polybar/launch_polybar.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

export TERM=rxvt-unicode-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

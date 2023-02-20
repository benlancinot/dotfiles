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
alias ls='lsd'
alias ll='ls -al'

alias prev="fzf --preview 'bat --style=numbers --color=always {}'"
export FZF_PREVIEW_COMMAND="bat --style=numbers,changes --wrap never --color always {} || cat {} || tree -C {}"
export FZF_CTRL_T_OPTS="--min-height 30 --preview-window down:60% --preview-window noborder --preview '($FZF_PREVIEW_COMMAND) 2> /dev/null'"

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

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt extended_history         # Also record time and duration of commands.
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
setopt hist_ignore_dups         # Ignore consecutive duplicates.
setopt hist_save_no_dups        # Omit older commands in favor of newer ones.
setopt hist_ignore_space        # Ignore commands that start with space.
setopt hist_ignore_dups

HISTSIZE=1000
SAVEHIST=1000
HISTORY_IGNORE='([bf]g *|cd ..*|l[a,l,s,h,]*|less *|nmcli device wifi connect*)'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

POWERLEVEL9K_MODE="nerdfont-complete"
plugins=(
    colorize
    zsh-autosuggestions
    zsh-syntax-highlighting
    # zsh-autocomplete
    kubectl
    colored-man-pages
)

export ZSH="/home/ben/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

alias ls='lsd'
alias ll='ls -al'

alias zshrc='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

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

alias cat='bat'
alias rcat='\cat'

alias gaa='git add --all'
alias gam='git am'
alias gco='git checkout'
alias gcam='git commit --all --message'
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gca!='git commit --verbose --all --amend'
alias gcan!='git commit --verbose --all --no-edit --amend'
alias gd='git diff'
alias gupv='git pull --rebase -v'
alias gpv='git push --verbose'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'
alias gst='git status'
alias gss='git status --short'
alias gcb='git checkout -b'
alias gpf='git push --force-with-lease'
# extra git aliases
alias gitcommitempty='git commit --allow-empty -m ":see_no_evil: empty deploy"'
alias gitcommitpirate='gcam ":see_no_evil: pirate deploy" --no-verify'


alias dmesg='sudo dmesg --color=always -T'

alias e='emacs'
alias te='emacs -nw'

alias task='go-task'

HISTSIZE=1000
SAVEHIST=1000
HISTORY_IGNORE='([bf]g *|cd ..*|l[a,l,s,h,]*|less *|nmcli device wifi connect*)'
HISTFILE=~/.histfile

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

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

unsetopt beep
bindkey -e
autoload -Uz compinit
compinit

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

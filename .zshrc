# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# some keybindings, as 'del'-key outputs ~
bindkey '^[[3~' delete-char
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/adrian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# default editor
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# starhip pormpt
eval "$(starship init zsh)"

# alias general
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias ..="cd .."
alias ls='ls -la --color=auto'
alias grep="grep --color=auto"
alias myip='curl http://ipecho.net/plain; echo'
# alias programs
alias vim="nvim"
# alias suffix: e.g. open txt files with nvim
alias -s txt=nvim

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

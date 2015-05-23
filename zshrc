# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

source ~/dotfiles/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
    cabal
    catimg
    colored-man
    colorize
    common-aliases
    copyfile
    git
    history-substring-search
    sudo
    vi-mode
    vundle

    laMudri/zsh-yum-aliases
    # Not working:
    #tarruda/zsh-autosuggestions
    zsh-users/zsh-syntax-highlighting
    zsh_reload
EOBUNDLES

antigen theme agnoster

antigen apply

# User configuration

export PATH="/home/james/bin:/home/james/bin:/home/james/.cabal/bin:/home/james/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

export EDITOR=emacsclient
export VISUAL=emacsclient

export KEYTIMEOUT=1

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias oldvim="vim"
alias vim="vimx"
alias hoogle="nocorrect hoogle"

# Setup zsh-autosuggestions
source /home/home/james/.zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
bindkey '^T' autosuggest-toggle

zmodload zsh/terminfo

# vi bindings
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^r' redo
bindkey '^h' backward-delete-char
bindkey "${terminfo[kcuu1]}" history-substring-search-up
bindkey '^[[A' history-substring-search-up
bindkey "${terminfo[kcud1]}" history-substring-search-down
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'h' history-substring-search-up
bindkey -M vicmd 'k' history-substring-search-down
bindkey -M vicmd 'j' vi-backward-char
bindkey '^f' vi-forward-word
bindkey '^s' vi-end-of-line
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kich1]}" overwrite-mode
bindkey "${terminfo[kdch1]}" delete-char

setopt hist_ignore_dups

# vi mode indicator
precmd() {
    RPROMPT=""
}
zle-keymap-select() {
    RPROMPT=""
    [[ $KEYMAP = vicmd ]] && RPROMPT="(CMD)"
    () { return $__prompt_status }
    zle reset-prompt
}
zle-line-init() {
    typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init

eval `dircolors ~/Documents/misc/dircolors-solarized/dircolors.ansi-universal`

PERL_MB_OPT="--install_base \"/home/james/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/james/perl5"; export PERL_MM_OPT;

unalias rm

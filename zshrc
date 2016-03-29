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
  #colored-man
  colorize
  common-aliases
  copyfile
  git
  history-substring-search
  sudo
  vi-mode
  vundle

  hchbaw/auto-fu.zsh --branch=pu
  #laMudri/zsh-yum-aliases
  spwhitt/nix-zsh-completions
  # Not working:
  #tarruda/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting

  zsh_reload
EOBUNDLES

#antigen theme agnoster

antigen apply

# Unpackaged functions
export fpath=($HOME/.zsh/functions $fpath)

export EDITOR=nvim
export VISUAL=nvim

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

alias sudo='sudo '
alias hoogle="nocorrect hoogle"
alias hoqc="echo -n | hoq"

donohup () { nohup $1 > /dev/null >& /dev/null & }

# Setup zsh-autosuggestions
#source /home/james/.zsh-autosuggestions/autosuggestions.zsh

# use ctrl+t to toggle autosuggestions(hopefully this wont be needed as
# zsh-autosuggestions is designed to be unobtrusive)
#bindkey '^T' autosuggest-toggle

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

setopt histignorealldups histreduceblanks histignorespace listpacked

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
  # Enable autosuggestions automatically
  #zle autosuggest-start
  typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init

ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;'

eval `dircolors $HOME/dotfiles/dircolors-solarized/dircolors.ansi-universal`

export PERL_MB_OPT="--install_base \"/home/james/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/james/perl5"

unalias rm

# OPAM configuration
. /home/james/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Stop `nix-env` using `less`
export NIX_PAGER=cat

alias nixpaste="curl -F 'text=<-' http://nixpaste.lbr.uno"

# Use the local package list
#export NIX_PATH=nixpkgs=$HOME/nixpkgs:$NIX_PATH
#alias mynix-env="nix-env -f \$HOME/nixpkgs"
alias mynixos-rebuild="sudo nixos-rebuild -I nixpkgs=/home/james/nixpkgs"
#alias mynix-shell="nix-shell -I \$HOME/nixpkgs"
alias ns="nix-env -qaPs"
alias nu="nix-env -iA g.everything"

if [ -e ~/.nix-profile/bin/ghc ]; then
  eval $(grep export ~/.nix-profile/bin/ghc)
fi

fancy-ctrl-z () {
  emulate -LR zsh
  if [[ $#BUFFER -eq 0 ]]; then
    # Normal ctrl+z
    bg
    zle redisplay
  else
    # Save current command
    zle push-input
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

alias note-dequeue="tail -n+2 ~/notes.txt > ~/.notes.txt && mv -f ~/.notes.txt ~/notes.txt"

function new-terminal {
  urxvtc >&/dev/null &!
}
zle -N new-terminal
bindkey '\e^e' new-terminal
alias t=new-terminal

if [ -e /run/current-system/sw/share/terminfo/x/xterm-256color ]; then
  export TERM=xterm-256color
else
  export TERM=xterm-color
fi

mkcd () { mkdir $* && cd ${@[-1]} }

zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true
zstyle ':completion:*:man:*' menu yes select

function whichnix {
  ll $(which $1) | sed 's/.*-> //' | grep -o '/nix/store/[^/]*/' --colour=never
}

# Hunspell setup
export DICPATH=$HOME/.nix-profile/share/hunspell

test /etc/ssl/certs/ca-certificates.crt && \
  export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt

# Hide username in agnoster
export DEFAULT_USER=james

# Concatenation to work around not being able to have single quotes in a
# non-expanding string literal
alias nix-zsh='nix-shell --command zsh'

GIT_PROMPT_EXECUTABLE=haskell
source $HOME/.zsh/zsh-git-prompt/zshrc.sh
function nix-shell-prefix {
  if test -n "$IN_NIX_SHELL"; then
    echo "%F{yellow}nix-shell%f|"
  fi
}
export PROMPT='$(nix-shell-prefix)%(?..%B%F{red}?%?%f%b|)%(1j.%B%F{green}j%j%f%b|.)%F{blue}%n@%m%f|%F{cyan}%~%f$(git_super_status)%(60l.
.)%(!.⇒.→) '

# Used by termite
export BROWSER=firefox

# Skip the verification of insecure directories
ZSH_DISABLE_COMPFIX="true"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE="nerdfont-complete"

#POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true

POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_DIR_PATH_SEPARATOR='  '

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator)
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='blue'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='green'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='black'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_with_package_name"
POWERLEVEL9K_SHORTEN_DELIMITER=".."

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▶ "

#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0C6'
#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0C7'

POWERLEVEL9K_VCS_GIT_ICON=''

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  aws
)

source $ZSH/oh-my-zsh.sh

# User configuration
# Hide user@host from the prompt
prompt_context() {}

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll='ls --color -lh --group-directories-first'

# Fix ls colors
LS_COLORS="ow=01;36;40" && export LS_COLORS

# Make cd use the ls colours
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -z compinit
compinit -u

# This is needed in order to run tools installed with pip --user
export PATH=$PATH:~/.local/bin

###########################################################
#                  fzf                                    #
###########################################################

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
# Setting rg as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}"'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Enable fuzzy finder (fzf) key bindings
[ -f /usr/share/fzf/key-bindings.zsh ] && set -o vi && source /usr/share/fzf/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###########################################################

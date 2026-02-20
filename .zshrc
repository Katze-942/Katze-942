# !!! This configuration is several years old, I still have no idea how it works. !!!



# Hi! This is my config for oh-my-zsh. Oh-my-zsh and plugins are automatically downloaded and installed.
# Let me know if there are any problems.
# Permission is granted to copy and modify this config in peace.
#
# After installing oh-my-zsh, please type "exit" or press Ctrl + D to continue the installation process.
#
# Please note: the autocomplete for your batch manager will not work unless you activate the right plugin for it.
# For example to activate the autocomplete command "pacman" you need to enable the plugin "archlinux"
#
# It requires git and curl/wget installed on the system.
# Note also that an alias for the cat command is set in the config.
#
# Enjoy your use!
#

# shellcheck disable=SC2034
# shellcheck disable=SC1091

# With a value of 1 you will use the ccat command instead of cat
# You must download "chroma" or "pygments" to work
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colorize
COLORED_CAT=0

# Storing path information for oh-my-zsh.
ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# Check if oh-my-zsh is installed.
# Check if the folder .oh-my-zsh exists.
if ! [ -d "$ZSH" ]; then
  echo 'INSTALLING oh-my-zsh...'
  # Repeat the message 5 times, it is necessary that the user noticed.
  for (( i=1; i <= 5; i++ )); do
    echo 'WARNING: The installation of oh-my-zsh will now start. When the installation is finished, please type "exit" or press Ctrl + D to continue the installation process.'
  done

  echo

  # Check for the sh command.
  if ! command -v sh &> /dev/null; then
    echo 'The command sh could not be found! Install sh and restart the console.'
    exit
  fi

  # oh-my-zsh will overwrite our configuration file, so back it up.
  cp "$HOME/.zshrc" "$HOME/.zshrc.new"

  # Install oh-my-zsh in one of the following ways.
  if command -v curl &> /dev/null; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  elif command -v wget &> /dev/null; then
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
  else
    echo 'No "curl" or "wget" command found. Please install one of them and restart the console.'
    exit
  fi

  # After installing oh-my-zsh, return our config and continue the installation.
  cp "$HOME/.zshrc.new" "$HOME/.zshrc"
  rm "$HOME/.zshrc.new"
  echo
  echo 'Continuing the installation...'
  echo
fi

# Installing all plugins and themes...
function scriptZshrcCheckTheme {
  if ! [ -d "$ZSH_CUSTOM/$1" ]; then
    echo "Install $1..."
    git clone "$2" "$ZSH_CUSTOM/$1" --depth=1
    echo
  fi
}

scriptZshrcCheckTheme plugins/zsh-autosuggestions https://github.com/zsh-users/zsh-autosuggestions
scriptZshrcCheckTheme plugins/zsh-history-substring-search https://github.com/zsh-users/zsh-history-substring-search
scriptZshrcCheckTheme plugins/zsh-syntax-highlighting https://github.com/zsh-users/zsh-syntax-highlighting
scriptZshrcCheckTheme plugins/wakatime https://github.com/sobolevn/wakatime-zsh-plugin.git
scriptZshrcCheckTheme themes/powerlevel10k/ https://github.com/romkatv/powerlevel10k.git

# Just displaying uptime :)
uptime

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# shellcheck source=/dev/null
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${%:-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${%:-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
COMPLETION_WAITING_DOTS="%F{yellow}[Wait! I'm looking... :0]%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # --- Support for various commands ---
  git                          #                                                                     -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
  gh                           # GitHub CLI                                                          -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gh
  fd                           # fs-find                                                             -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fd
  rsync                        #                                                                     -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rsync
  systemd                      #                                                                     -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/systemd
  ufw                          #                                                                     -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/ufw
  vscode                       #                                                                     -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vscode
  python                       #                                                                     -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/python
  pip                          # Python package manager                                              -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/pip
  pylint                       # Python Code Analyzer                                                -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/pylint
  docker                       #                                                                     -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker
  docker-compose               #                                                                     -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker-compose
  npm                          # Node.js package manager                                             -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/npm
  yarn                         # Node.js package manager                                             -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/yarn
# archlinux                    # Support for pacman, yay and other Arch Linux package managers       -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux
# debian                       # Support for apt-get and other Debian related commands               -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/debian
# ubuntu                       # Support for apt-get and other Ubuntu related commands               -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/ubuntu
# dnf                          # Support for the "dnf" package manager                               -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dnf
# suse                         # Support for the "zypper" package manager                            -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/suse
# yum                          # Support for the "yum" package manager                               -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/yum
# brew                         # Support for the "brew"package manager                               -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew

  # --- Adding third-party commands ---
  aliases                      # Command acs - show all aliases by group                             -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/aliases
  catimg                       # Command catimg - displays a picture                                 -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/catimg
  colorize                     # Colors the output of the cat command                                -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colorize
  copyfile                     # The "copyfile" command to copy a file to the clipboard              -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copyfile
  copypath                     # The "copypath" command to copy the global path                      -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copypath
  extract                      # The "extract" command to unpack an archive                          -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract
  universalarchive             # Command "ua" to create any archive                                  -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/universalarchive
  genpass                      # The command "genpass-*" to generate a password                      -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/genpass
  gitignore                    # The "gi" command to retrieve data from gitignore.io                 -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gitignore
  jsontools                    # Various json utilities                                              -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jsontools
  web-search                   # Commands for web search. Example: "yandex", "google"                -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search

  # --- Keyboard combinations ---
  dirhistory                   # Keys for navigating directories (on Alt)                            -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dirhistory
  copybuffer                   # Ctrl + O copies the current command                                 -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copybuffer
  sudo                         # Double-clicking on ESC adds "sudo" to the command                   -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo
# thefuck                      # Double-clicking on the ESC invokes the "fuck" command               -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/thefuck
  zsh-autosuggestions          # A simple autofill tool by clicking on the right arrow               -> https://github.com/zsh-users/zsh-autosuggestions
  zsh-history-substring-search # By clicking on the up/down arrows, changes the auto-completion      -> https://github.com/zsh-users/zsh-history-substring-search

  # --- Other improvements ---
  colored-man-pages            # Colors man pages                                                    -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages
  command-not-found            # If the command does not exist, it will search the repositories      -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found
  safe-paste                   # Protection against command execution after insertion                -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/safe-paste
# zbell                        # Notifies you that the command has been executed                     -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/zbell
  zsh-syntax-highlighting      # Illuminates the team in green                                       -> https://github.com/zsh-users/zsh-syntax-highlighting
  wakatime                     # wakatime.com                                                        -> https://github.com/sobolevn/wakatime-zsh-plugin.git
# lol                          # Changes the basic to cute analogies :0
# nvm                          # Automatically installs and configures nvm (Node Version Manager)    -> https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm
)

source "$ZSH/oh-my-zsh.sh"

# Use the "ccat" command from the "colorize" plugin
if [ "$COLORED_CAT" -eq 1 ]; then
  alias cat=ccat
fi


# For the "zsh-history-substring-search" plugin to work
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Comment if you need thefuck support

# if command -v fuck &> /dev/null; then
#   eval "thefuck --alias"
# fi

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# shellcheck source=/dev/null
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# curl
# https://everything.curl.dev/install/macos.html
export PATH="$(brew --prefix)/opt/curl/bin:$PATH"

# fnm
# https://github.com/Schniz/fnm?tab=readme-ov-file#zsh
eval "$(fnm env --use-on-cd --shell zsh)"

# nvm
# https://github.com/nvm-sh/nvm#install--update-script
# https://github.com/nvm-sh/nvm?tab=readme-ov-file#manual-install
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm

# Java
JAVA_VERSION=21
#JAVA_VERSION=14
#JAVA_VERSION=11
#JAVA_VERSION=1.8
export JAVA_HOME=`/usr/libexec/java_home -v "${JAVA_VERSION}"`
export PATH="$JAVA_HOME/bin:$PATH"

# IDEA
export PATH=$PATH:"/Applications/IntelliJ IDEA.app/Contents/MacOS"

# Android SDK
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools

# google cloud sdk
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# https://github.com/pyenv/pyenv?tab=readme-ov-file#set-up-your-shell-environment-for-pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# rancher desktop
# https://docs.rancherdesktop.io/ui/preferences/application/environment/
export PATH=$PATH:$HOME/.rd/bin

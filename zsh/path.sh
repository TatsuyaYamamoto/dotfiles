# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export PATH=$NVM_BIN:$PATH
nvm use lts/erbium

# Java
#JAVA_VERSION="14"
#JAVA_VERSION="11"
JAVA_VERSION="1.8"
export JAVA_HOME=`/usr/libexec/java_home -v "${JAVA_VERSION}"`
export PATH=${JAVA_HOME}/bin:${PATH}

# Android SDK
export PATH=$PATH:$HOME/Library/Android/sdk/platform-tools

# google cloud sdk
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

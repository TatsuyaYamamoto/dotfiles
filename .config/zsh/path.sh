# nvm
# https://github.com/nvm-sh/nvm#install--update-script
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Java
JAVA_VERSION="17"
# JAVA_VERSION="14"
# JAVA_VERSION="11"
# JAVA_VERSION="1.8"
export JAVA_HOME=`/usr/libexec/java_home -v "${JAVA_VERSION}"`
export PATH=${JAVA_HOME}/bin:${PATH}

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

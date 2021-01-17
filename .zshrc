# zsh no matches found
# https://eitya.hatenadiary.org/entry/20110707/1310023383
setopt nonomatch

# autoload -U compinit && compinit

# 補完
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'

ACTUAL_ZSHRC_PATH=$(readlink "$(pwd)/.zshrc")
ACTUAL_DOTFILE_DIR_PATH=$(dirname $ACTUAL_ZSHRC_PATH)
source "$ACTUAL_DOTFILE_DIR_PATH/zsh/aliase.sh"
source "$ACTUAL_DOTFILE_DIR_PATH/zsh/npm_completion.sh"
source "$ACTUAL_DOTFILE_DIR_PATH/zsh/path.sh"
source "$ACTUAL_DOTFILE_DIR_PATH/zsh/prompt.sh"

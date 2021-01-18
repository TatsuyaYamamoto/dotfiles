# 文字コードの指定
export LANG=ja_JP.UTF-8

# 補完 (「⁠大文字小文字を同一視」をONにしたときも，検索文字列としてわざわざ大文字をあらかじめ入れた場合は大文字にだけマッチして欲しい)
# https://gihyo.jp/dev/serial/01/zsh-book/0005
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'

# zsh-completions
# https://rcmdnk.com/blog/2015/05/15/computer-linux-mac-zsh/#compinit
autoload -U compinit && compinit -u

# zsh no matches found
# https://eitya.hatenadiary.org/entry/20110707/1310023383
setopt nonomatch

# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


ACTUAL_ZSHRC_PATH=$(readlink "$(pwd)/.zshrc")
ACTUAL_DOTFILE_DIR_PATH=$(dirname $ACTUAL_ZSHRC_PATH)

source "$ACTUAL_DOTFILE_DIR_PATH/zsh/aliase.sh"
source "$ACTUAL_DOTFILE_DIR_PATH/zsh/npm_completion.sh"
source "$ACTUAL_DOTFILE_DIR_PATH/zsh/path.sh"
source "$ACTUAL_DOTFILE_DIR_PATH/zsh/prompt.sh"

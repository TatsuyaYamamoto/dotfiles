#!/usr/bin/env bash

# -e: パイプやサブシェルで実行したコマンドが1つでもエラーになったら直ちにシェルを終了する
# -u: パラメーター展開中に、設定していない変数があったらエラーとする
# -x: 実行時、通常表示されないシェルスクリプトを表示する
set -eux

DOTFILE_DIR="$(cd "$(dirname "$0")/.." || exit 1; pwd)"

# Setup XDG
source "${DOTFILE_DIR}/.config/zsh/xdg.bash"
mkdir -p  "${XDG_CONFIG_HOME}"
mkdir -p  "${XDG_CACHE_HOME}"
mkdir -p  "${XDG_DATA_HOME}"
mkdir -p  "${XDG_STATE_HOME}"

# Setup symlinks
ln -sfnv "$DOTFILE_DIR/.config/"* "$XDG_CONFIG_HOME"
ln -sfnv "$XDG_CONFIG_HOME/zsh/.zshenv" "$HOME/.zshenv"
ln -sfnv "$DOTFILE_DIR/.vimrc" "$HOME/.vimrc"

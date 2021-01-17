#!/usr/bin/env bash
set -ue

IGNORE_PATTERN="^\.(git|gitignore)$"
SCRIPT_FILE_PATH=`dirname "$0"`
PROJECT_ROOT_DIR_PATH="$( cd "$SCRIPT_FILE_PATH/.." && pwd -P )"

cd $PROJECT_ROOT_DIR_PATH

for dotfile in .??*
do
    if [[ $dotfile =~ $IGNORE_PATTERN ]];then
        echo "ignore $dotfile"
        continue;
    fi

    ln -snfv "$PROJECT_ROOT_DIR_PATH/$dotfile" "$HOME"/"$dotfile"
done

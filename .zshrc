# zsh no matches found
# https://eitya.hatenadiary.org/entry/20110707/1310023383
setopt nonomatch

# autoload -U compinit && compinit

# ll
# https://qiita.com/miriwo/items/a1bf6917dc630fb6d24f
alias ll='ls -laF'

# tig
alias tig-all='tig --all'

# 補完
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'

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

# kawaii
# https://scrapbox.io/jiro4989/zsh%E3%81%AE%E3%83%97%E3%83%AD%E3%83%B3%E3%83%97%E3%83%88%E3%82%92%E3%81%8B%E3%82%8F%E3%81%84%E3%81%8F%E3%81%97%E3%81%9F
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

status_code () {
    local ok="( '8'%)  "
    local ng="(;'8'%)?!"

    local color face reset
    color="%{%(?.${fg[green]}.${fg[blue]})%}"
    face="%(?.$ok.$ng)"
    reset="%{$reset_color%}"

    echo "$color$face$reset"
}

# %F{色} 任意のテキスト %fで、%fまで色を変更できる
# PROMPT='%F{003}%*%f %F{magenta}%n%f@%F{blue}%M%f %F{200}[%~]%f${vcs_info_msg_0_}
# PROMPT='%F{003}%*%f %F{magenta}%n%f@%F{200}[%~]%f${vcs_info_msg_0_}
PROMPT='%F{003}%*%f %F{magenta}kotori%f@%F{200}[%~]%f${vcs_info_msg_0_}
`status_code` < %# '

show_zsh_prompt_colors() {
    for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/JP27479/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/JP27479/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/JP27479/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/JP27479/google-cloud-sdk/completion.zsh.inc'; fi

# nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

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

fh() {
local cmd
cmd=$(history | sed 's/^[ ]*[0-9]\+[ ]*//' | fzf --tac --height 40% --border) || return
eval "$cmd"
}


__fzf_history() {
local cmd

cmd=$(
    history |
    sed 's/^[ ]*[0-9]\+[ ]*//' |
    awk '!seen[$0]++' |
    fzf \
    --tac \
    --height 40% \
    --border \
    --preview 'echo {}' \
    --preview-window up:1:wrap
) || return

READLINE_LINE="$cmd"
READLINE_POINT=${#cmd}
}

bind -x '"\C-r": __fzf_history'
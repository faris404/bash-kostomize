cdff() {
local dir

dir=$(
    find . -maxdepth 5 -type d 2>/dev/null |
    sed 's#^\./##' |
    fzf \
    --height 100% \
    --border \
    --preview '
        tree -C -L 2 --dirsfirst {}
    ' \
    --preview-window right:60%:wrap
) || return

cd "$dir"
}


cdf() {
local dir

dir=$(
    find . -maxdepth 1 -type d 2>/dev/null |
    sed 's#^\./##' |
    fzf \
    --height 100% \
    --border \
    --preview '
        tree -C -L 2 --dirsfirst {}
    ' \
    --preview-window right:60%:wrap
) || return

cd "$dir"
}

 __fzf_file_path_paste() {
   local selected
 
   selected=$(
     find . -mindepth 1 \
       \( -path '*/.git*' -o -name '.git' -o -name '.gitignore' -o -name '.gitmodules' \) -prune \
       -o -print 2>/dev/null |
     sed 's#^\./##' |
     fzf \
       --height 100% \
       --border \
       --multi \
       --preview '
         if [ -d {} ]; then
           ls -lah --color=always {}
         else
           batcat --color=always --style=numbers --line-range :200 {}
         fi
       ' \
       --preview-window right:60%:wrap
   ) || return
 
   # Safely escape and paste selected paths
   selected=$(printf '%q ' $selected)
   READLINE_LINE+="$selected"
   READLINE_POINT=${#READLINE_LINE}
 }
 
 
 bind -x '"\C-t": __fzf_file_path_paste'
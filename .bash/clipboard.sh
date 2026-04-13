yank() {
  if command -v xclip >/dev/null 2>&1; then
    xclip -selection clipboard
  else
    echo "No clipboard utility found; run \`apt install xclip\`" >&2
    return 1
  fi
}
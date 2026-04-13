# Load custom bash modules
for file in ~/.bash/*.sh; do
  [ -r "$file" ] && source "$file"
done
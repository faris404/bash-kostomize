cosmic-noise(){
    clear; while true;do tput cup $(shuf -i 1-$(tput lines) -n 1) $(shuf -i 1-$(tput cols) -n 1);tput setaf $(shuf -i 1-7 -n 1);echo -n $1; done;
}

# Example: cosmic-noise .
put_template() {
    # Check if the terminal supports 256 colors
    if [[ "$TERM" == "linux" || "$TERM" == "screen" ]]; then
        # For TTY or screen, use 256-color mode
        printf '\e]P%d%s' "$1" "$2"
    else
        # For graphical terminals, use RGB setting
        printf '\033]4;%d;rgb:%s\033\\' "$1" "$2"
    fi
}

# Set all 16 colors
put_template 0 "181c30"  # Color index 0 - Black
put_template 1 "f92672"  # Color index 1 - Red
put_template 2 "82b414"  # Color index 2 - Green
put_template 3 "fd971f"  # Color index 3 - Yellow
put_template 4 "0066cc"  # Color index 4 - Blue
put_template 5 "8c54fe"  # Color index 5 - Magenta
put_template 6 "465457"  # Color index 6 - Cyan
put_template 7 "ccccc6"  # Color index 7 - Light Gray
put_template 8 "505354"  # Color index 8 - Dark Gray
put_template 9 "ff5995"  # Color index 9 - Bright Red
put_template 10 "b6e354" # Color index 10 - Bright Green
put_template 11 "feed6c" # Color index 11 - Bright Yellow
put_template 12 "333399" # Color index 12 - Bright Blue
put_template 13 "9e6ffe" # Color index 13 - Bright Magenta
put_template 14 "899ca1" # Color index 14 - Bright Cyan
put_template 15 "f8f8f2" # Color index 15 - Bright White

# Optionally set foreground and background colors for graphical terminals
if [[ "$TERM" != "linux" && "$TERM" != "screen" ]]; then
    printf '\033]10;#feed6c\a' # Foreground color
    printf '\033]11;#000000\a' # Background color
fi

PS1="\[\e[38;2;255;140;0m\]\u@\h:\w\[\e[0m\]$ "

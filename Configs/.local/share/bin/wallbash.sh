#!/usr/bin/env bash

# Set variables
scrDir="$(dirname "$(realpath "$0")")"
source "${scrDir}/globalcontrol.sh"

# Check if pywal is installed
if ! command -v wal &> /dev/null; then
    echo "Error: pywal is not installed. Please install it with 'pip install pywal'"
    exit 1
fi

# Process wallpaper with pywal
wallbashImg="${1}"
wallbashOut="${2:-"${wallbashImg}"}.dcol"

if [ -z "${wallbashImg}" ] || [ ! -f "${wallbashImg}" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

# Generate colors with pywal
wal -i "${wallbashImg}" -n -q

# Convert pywal colors to our format
{
    # Read pywal colors
    source "$HOME/.cache/wal/colors.sh"

    # Primary colors
    echo "dcol_pry1=\"${color1#\#}\""
    echo "dcol_pry2=\"${color2#\#}\""
    echo "dcol_pry3=\"${color3#\#}\""
    echo "dcol_pry4=\"${color4#\#}\""

    # Text colors
    echo "dcol_txt1=\"${color7#\#}\""
    echo "dcol_txt2=\"${color7#\#}\""
    echo "dcol_txt3=\"${color7#\#}\""
    echo "dcol_txt4=\"${color7#\#}\""

    # Generate accent colors using pywal's colors
    for i in {1..4}; do
        for j in {1..9}; do
            color_var="color$((j))"
            eval color_val=\$$color_var
            echo "dcol_${i}xa${j}=\"${color_val#\#}\""
            echo "dcol_${i}xa${j}_rgba=\"rgba($(printf "%d,%d,%d,1" 0x${color_val:1:2} 0x${color_val:3:2} 0x${color_val:5:2}))\""
        done
    done
} > "${wallbashOut}"


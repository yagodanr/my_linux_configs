#!/usr/bin/env bash

# Set variables
scrDir="$(dirname "$(realpath "$0")")"
source "${scrDir}/globalcontrol.sh"

# Wallust
# Templates for apps defined in ~/.config/wallust/config.toml
if [[ "$1" =~ .(jpg|jpeg|png|gif)$ ]]; then
    wallust run "$1" -s --backend wal
    source "$HOME/.cache/wallust/generated/colors.sh"
    # kitty @ set-colors ~/.config/kitty/wallust_colors.conf
    kitten themes --reload-in=all wallust
else
    echo "Error: Invalid image file"
    exit 1
fi
# # Generate colors using pywal
# if [[ "$1" =~ .(jpg|jpeg|png|gif)$ ]]; then
#     wal -i "$1" -n -q --backend "wal"
#     source "$HOME/.cache/wal/colors.sh"
# else
#     echo "Error: Invalid image file"
#     exit 1
# fi


# # Create Hyprland colors config with correct syntax
# cat > "$confDir/hypr/themes/colors.conf" << EOF
# # Auto generated color theme for Hyprland by pywal
# general {
#     col.active_border = rgba(${color2:1}ff) rgba(${color4:1}ff) 45deg
#     col.inactive_border = rgba(${color8:1}cc) rgba(${color7:1}cc) 45deg
# }

# group {
#     col.border_active = rgba(${color2:1}ff) rgba(${color4:1}ff) 45deg
#     col.border_inactive = rgba(${color8:1}cc) rgba(${color7:1}cc) 45deg
#     col.border_locked_active = rgba(${color2:1}ff) rgba(${color4:1}ff) 45deg
#     col.border_locked_inactive = rgba(${color8:1}cc) rgba(${color7:1}cc) 45deg
# }

# decoration {
#     rounding = 10

#     blur {
#         enabled = yes
#         size = 6
#         passes = 3
#         new_optimizations = on
#         ignore_opacity = on
#         xray = false
#     }
# }
# EOF

# # Generate waybar theme from pywal colors

# # Convert hex to rgb function
# hex_to_rgb() {
#     hex=$1
#     r=$((16#${hex:1:2}))
#     g=$((16#${hex:3:2}))
#     b=$((16#${hex:5:2}))
#     echo "$r $g $b"
# }
# read -r r g b <<< "$(hex_to_rgb "${color1}")"


# # @define-color main-bg ${color2};
# cat > "$confDir/waybar/theme.css" << EOF
# /* Auto generated color theme for waybar using pywal */
# @define-color bar-bg rgba(0, 0, 0, 0);

# @define-color main-bg rgba(${r}, ${g}, ${b}, 0.75);
# @define-color main-fg ${color4};

# @define-color wb-act-bg ${color1};
# @define-color wb-act-fg ${color7};

# @define-color wb-hvr-bg ${color4};
# @define-color wb-hvr-fg ${color7};
# EOF


# Reload applications to apply new colors
hyprctl reload
restart waybar
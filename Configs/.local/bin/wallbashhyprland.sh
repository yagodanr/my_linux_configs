#!/usr/bin/env bash

# Set variables
scrDir="$(dirname "$(realpath "$0")")"
source "${scrDir}/globalcontrol.sh"
source "$HOME/.cache/wal/colors.sh"

# Create Hyprland color config
cat > "$confDir/hypr/themes/colors.conf" << EOF
# Auto generated color theme for Hyprland by pywal
general {
    col.active_border = rgba(${color2:1}ff) rgba(${color4:1}ff) 45deg
    col.inactive_border = rgba(${color8:1}cc) rgba(${color7:1}cc) 45deg
}

group {
    col.border_active = rgba(${color2:1}ff) rgba(${color4:1}ff) 45deg
    col.border_inactive = rgba(${color8:1}cc) rgba(${color7:1}cc) 45deg
    col.border_locked_active = rgba(${color2:1}ff) rgba(${color4:1}ff) 45deg
    col.border_locked_inactive = rgba(${color8:1}cc) rgba(${color7:1}cc) 45deg
}

decoration {
    col.shadow = rgba(${color0:1}ee)
    col.shadow_inactive = rgba(${color8:1}ee)
}
EOF

# Reload Hyprland config
hyprctl reload
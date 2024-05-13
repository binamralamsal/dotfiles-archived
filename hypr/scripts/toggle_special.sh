workspace=$(hyprctl activewindow | grep "workspace: " | cut -d' ' -f2)

if [ "$workspace" -eq -98 ]; then
  hyprctl dispatch movetoworkspace e+0
else
  hyprctl dispatch movetoworkspace special:magic
fi

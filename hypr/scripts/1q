workspace=$(hyprctl activewindow | grep "workspace: " | cut -d' ' -f2)

if [ "$workspace" -eq -99 ]; then
  # hyprctl dispatch movetoworkspace $(hyprctl monitors | grep active | awk '{print $3}')
  hyprctl dispatch movetoworkspace e+0
else
  hyprctl dispatch movetoworkspace special
fi

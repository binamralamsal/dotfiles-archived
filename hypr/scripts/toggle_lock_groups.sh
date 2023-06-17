grouped=$(hyprctl activewindow | grep "grouped: " | cut -d' ' -f2)

if [ "$grouped" -eq 0 ]; then
  hyprctl dispatch movetoworkspace e+0
else
  hyprctl dispatch movetoworkspace special
fi

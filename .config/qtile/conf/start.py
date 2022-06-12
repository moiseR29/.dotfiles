import os

from .commands import detectSecondMonitor, isL15

l15Screen = "xrandr --auto --output eDP-1 --mode 1366x768 --primary --left-of HDMI-1 --output HDMI-1 --mode 2560x1080"
t430Screen = "xrandr --auto --output LVDS-1 --mode 1366x768 --primary" #--left-of HDMI-1 --output HDMI-1 --mode 2560x1080"

l15Wpp = "feh --bg-center ~/Imágenes/bosques-uw2.jpg"
t430Wpp = "feh --bg-center ~/Descargas/noche.jpg"

isl15 = isL15()

def whenStart():
  commandsToExecuteWhenStart = [
    "setxkbmap latam"
  ]

  # configure second monitor
  if detectSecondMonitor() > 1:
    commandsToExecuteWhenStart.append(
        l15Screen if isl15 else t430Screen
    )
  
  # wallpaper
  commandsToExecuteWhenStart.append(
    l15Wpp if isl15 else t430Wpp
  )

  # picom
  commandsToExecuteWhenStart.append("picom --experimental-backends -b")

  for command in commandsToExecuteWhenStart:
      os.system(command)

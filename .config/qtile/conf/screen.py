from libqtile import bar, widget
from libqtile.config import Screen

from .theme import loadTheme
from .keys import FONT
from .commands import dockerVersion, detectSecondMonitor, currentVol

COLORS = loadTheme()


def os_icon(fontsize):
    return widget.TextBox(
        **base("color3", "dark"), fontsize=fontsize, text="", padding=5
    )

def base(fg="text", bg="dark"):
    return {"foreground": COLORS[fg], "background": COLORS[bg]}


def separator(fg="text", bg="dark"):
    return widget.Sep(**base(fg, bg), linewidth=0, padding=3)


def icon(fg="text", bg="dark", fontsize=15, text="?", padding=3):
    return widget.TextBox(**base(fg, bg), fontsize=fontsize, text=text, padding=padding)


def texto(fg="text", bg="dark", fontsize=16, text="?"):
    return widget.TextBox(**base(fg, bg), fontsize=fontsize, text=text)


def powerline(fg="text", bg="dark"):
    return widget.TextBox(**base(fg, bg), text="", fontsize=40, padding=0)


def layoutSection(bg, arrowColor):
    return [
        widget.CurrentLayoutIcon(**base(bg=bg), scale=0.65),
        widget.CurrentLayout(**base(bg=bg), padding=5),
        # Docker Section
        powerline(arrowColor, bg),
    ]


def commandsSection(bg, arrowColor):
    return [
        # icon(bg=bg, text="", fontsize=35, padding=0),
        # texto(bg=bg, text=getCurrentWifi(), fontsize=14),
        # separator(bg=bg),
        icon(bg=bg, text="", fontsize=30, padding=2),
        texto(bg=bg, text=dockerVersion(), fontsize=14),
        powerline(arrowColor, bg),
    ]


def utilitiesSection(bg, fg, arrowColor, include=False):
    boths = [
        icon(bg=bg, fg=fg, text="", fontsize=23, padding=0),
        widget.Memory(**base(bg=bg, fg=fg), measure_mem="G"),
        widget.Battery(
            **base(bg=bg, fg=fg),
            format="{char} {percent:2.0%} {hour:d}:{min:02d}",
            charge_char="",
            discharge_char="",
            font="MesloLGS NF",
        ),
        icon(bg=bg, fg=fg, text="", fontsize=18),
        texto(bg=bg, fg=fg, text=currentVol(), fontsize=12),
        #widget.PulseVolume(**base(bg=bg, fg=fg)),
    ]

    if include:
        boths.append(widget.Systray(**base(bg=bg, fg=fg)))

    boths.append(powerline(arrowColor, bg))
    return boths


def calendarSection(bg):
    return [
        icon(bg=bg, text="", fontsize=20),
        widget.Clock(**base(bg=bg), format="%d/%m/%Y - %H:%M "),
    ]


def groupSpace():
    return [
        separator(),
        widget.GroupBox(
            **base(fg="light"),
            font=FONT,
            fontsize=23,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=2,
            active=COLORS["active"],
            inactive=COLORS["inactive"],
            rounded=True,
            highlight_method="line",
            urgent_alert_method="block",
            urgent_border=COLORS["urgent"],
            this_current_screen_border=COLORS["focus"],
            this_screen_border=COLORS["grey"],
            other_current_screen_border=COLORS["dark"],
            other_screen_border=COLORS["dark"],
            disable_drag=True,
        ),
        separator(),
        widget.WindowName(
            **base(fg="light"), format="{name}", max_chars=50, fontsize=14, padding=5
        ),
        separator(),
    ]


primaryScreenBar = [
    # SO Log Section
    os_icon(fontsize=30),
    separator(),
    # Group Section
    *groupSpace(),
    separator(),
    # ---------------------------
    powerline("color3", "dark"),
    *commandsSection("color3", "dark"),
    *utilitiesSection("dark", "color3", "color1", True),
    *calendarSection("color1"),
]

secondaryScreenBar = [
    # SO Log Section
    os_icon(fontsize=35),
    separator(),
    # Group Section
    *groupSpace(),
    separator(),
    # ---------------------------
    powerline("color1", "dark"),
    *layoutSection("color1", "color3"),
    *commandsSection("color3", "dark"),
    *utilitiesSection("dark", "color3", "color1"),
    *calendarSection("color1"),
]

screens = [
    Screen(
        top=bar.Bar(primaryScreenBar, 24, opacity=0.92),
    )
]

if detectSecondMonitor() > 1:
    screens.append(
        Screen(
            top=bar.Bar(secondaryScreenBar, 27, opacity=0.92),
        )
    )

from libqtile import bar, widget
from libqtile.config import Screen
import subprocess

from .theme import loadTheme
from .keys import FONT
from .commands import dockerVersion, detectSecondMonitor

COLORS = loadTheme()

# FUNCTIONS

def base(fg='text', bg='dark'):
    return { 'foreground': COLORS[fg], 'background': COLORS[bg] }

def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)

def icon(fg='text', bg='dark', fontsize=15, text="?", padding=3):
    return widget.TextBox(**base(fg, bg), fontsize=fontsize, text=text, padding=padding)

def texto(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(**base(fg, bg), fontsize=fontsize, text=text)

def powerline(fg='text', bg='dark'):
    return widget.TextBox(**base(fg, bg), text="", fontsize=50, padding=-8.1)

def groupSpace():
    return [
        separator(),
        widget.GroupBox(
            **base(fg='light'),
            font=FONT,
            fontsize=25,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=2,
            active=COLORS["active"],
            inactive=COLORS["inactive"],
            rounded=True,
            highlight_method='block',
            urgent_alert_method='block',
            urgent_border=COLORS["urgent"],
            this_current_screen_border=COLORS["focus"],
            this_screen_border=COLORS["grey"],
            other_current_screen_border=COLORS["dark"],
            other_screen_border=COLORS["dark"],
            disable_drag=True
        ),
        separator(),
        widget.WindowName(**base(fg='focus'), format='{name}', max_chars=50,fontsize=14, padding=5),
        #widget.Spacer(**base(fg='focus'), length=650),
        separator(),
    ]

primaryScreenBar = [
        # Ubuntu Log Section
        icon(bg='color1',fg='dark', fontsize=30, text=""),
        separator(),

        # Group Section
        *groupSpace(),
        separator(),

        # RAM Section
        #powerline('color4', 'dark'),
        #icon(bg='color4', text='', fontsize=30, padding=0),
        #widget.Memory(**base(bg="color4"), measure_mem='G'),
        
        # Docker Section
        powerline('color3', 'dark'),
        icon(bg='color3', text='', fontsize=35, padding=0),
        texto(bg='color3', text=dockerVersion(), fontsize=14),

        # Layout Section
        #powerline('color2', 'color3'),
        #widget.CurrentLayoutIcon(**base(bg="color2"), scale=0.65),
        #widget.CurrentLayout(**base(bg="color2"), padding=5),

        # Hour Section
        powerline('dark', 'color3'),
        icon(bg="dark", fg="light", text='', fontsize=30, padding=0),
        widget.Memory(**base(bg="dark", fg="light"), measure_mem='G'),
        #icon(bg="dark", fg="light", text='', fontsize=18, padding=0),
        widget.Battery(**base(bg="dark", fg="light"),
            format='{char} {percent:2.0%} {hour:d}:{min:02d}',
            charge_char='',
            discharge_char='',
            font="MesloLGS NF"),

        # Utils Sections
        powerline('color1', 'dark'),
        icon(bg='color1', text='', fontsize=25),
        widget.Clock(**base(bg="color1"), format='%d/%m/%Y - %H:%M ')
]

secondaryScreenBar = [
        # Ubuntu Log Section
        icon(bg='color1',fg='dark', fontsize=30, text=""),
        separator(),

        # Group Section
        *groupSpace(),
        separator(),

        # RAM Section
        #powerline('color4', 'dark'),
        #icon(bg='color4', text='', fontsize=30, padding=0),
        #widget.Memory(**base(bg="color4"), measure_mem='G'),

        # Layout Section
        powerline('color1', 'dark'),
        widget.CurrentLayoutIcon(**base(bg="color1"), scale=0.65),
        widget.CurrentLayout(**base(bg="color1"), padding=5),
        
        # Docker Section
        powerline('color3', 'color1'),
        icon(bg='color3', text='', fontsize=40, padding=0),
        texto(bg='color3', text=dockerVersion(), fontsize=14),

        # Hour Section
        powerline('dark', 'color3'),
        icon(bg="dark", fg="light", text='', fontsize=30, padding=0),
        widget.Memory(**base(bg="dark", fg="light"), measure_mem='G'),
        #icon(bg="dark", fg="light", text='', fontsize=18, padding=0),
        widget.Battery(**base(bg="dark", fg="light"),
            format='{char} {percent:2.0%} {hour:d}:{min:02d}',
            charge_char='',
            discharge_char='',
            font="MesloLGS NF"),

        # Utils Sections
        powerline('color1', 'dark'),
        icon(bg='color1', text='', fontsize=25),
        widget.Clock(**base(bg="color1"), format='%d/%m/%Y - %H:%M ')
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

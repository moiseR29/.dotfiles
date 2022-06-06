from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
#from libqtile.utils import guess_terminal
import subprocess
import os

# ================================ CONSTANTES SECTIONS ===================================================

# CONSTANTS
mod = "mod4" # key to use mod (mod4 is a windows key)
terminal = 'terminator'#guess_terminal() # guess_terminal use default terminal
SHIFT_KEY="shift"
CONTROL_KEY="control"
FONT="MesloLGS NF"

COLORS = {
        "dark": ["#292d3e", "#292d3e"],
        "grey": ["#434758", "#434758"],
        "light": ["#ffffff", "#ffffff"],
        "text": ["#292d3e", "#292d3e"],
        "focus": ["#A77AC4", "#A77AC4"],
        "urgent": ["#ff5555", "#ff5555"],
        "active": ["#f1ffff", "#f1ffff"],
        "inactive": ["#4c566a", "#4c566a"],
        "color1": ["#ff5555", "#ff5555"],
        "color2": ["#A77AC4", "#A77AC4"],
        "color3": ["#7197E7", "#7197E7"],
        "color4": ["#ffb86c", "#ffb86c"]
}

# ========================================================================================================

# ================================ KEYS SECTIONS =========================================================

# SHORTCUTS
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    Key([mod, SHIFT_KEY], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, SHIFT_KEY], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, SHIFT_KEY], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, SHIFT_KEY], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    Key([mod, CONTROL_KEY], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, CONTROL_KEY], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, CONTROL_KEY], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, CONTROL_KEY], "k", lazy.layout.grow_up(), desc="Grow window up"),

    # RESET ALL WINDOWS
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    Key(
        [mod, SHIFT_KEY],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, CONTROL_KEY], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, CONTROL_KEY], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # Custom
    Key([mod], "b", lazy.spawn("brave-browser"), desc="Launch Brave Browser"),

    Key([mod], "m", lazy.spawn("rofi -show drun"), desc="Launch Application Explorer"),
    Key([mod, SHIFT_KEY], "m", lazy.spawn("rofi -show"), desc="Launch Application Explorer Current Group"),

    # Hardware
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
    Key([mod], "o", lazy.spawn("shutdown now")),

    # Screens
    Key([mod, SHIFT_KEY], "comma", lazy.prev_screen()),
    Key([mod], "comma", lazy.next_screen()),
]

# ========================================================================================================

# ================================ GROUPS SECTIONS =======================================================

# ORDERS
# (nf-dev-terminal) Terminal
# (nf-fa-code) Code
# (nf-fa-code) Rest
# (nf-fa-code) Navigator 
# (nf-fa-code) Databases - Others
# (nf-fa-code) Databases - Others
group_configure = [
    ("1", { 'label': '', 'layout': 'columns', 'matches': [Match(wm_class=["terminator"])], 'init': True }),
    ("2", { 'label': '', 'layout': 'columns', 'matches': [Match(wm_class=["code"])] }),
    ("3", { 'label': 'ﱲ', 'layout': 'columns', 'matches': [] }),
    ("4", { 'label': '', 'layout': 'columns', 'matches': [Match(wm_class=["brave-browser"])] }),
    ("5", { 'label': '', 'layout': 'columns', 'matches': [Match(wm_class=["Archivos", "beekeeper-studio"])] }),
    ("6", { 'label': 'ﭮ', 'layout': 'columns', 'matches': [Match(wm_class=["discord", "slack"])] })
]

groups = [Group(name, **args) for name, args in group_configure]

for i, (name, args) in enumerate(group_configure, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, SHIFT_KEY], str(i), lazy.window.togroup(name, switch_group=True)))

# ========================================================================================================

# ================================ LAYOUT SECTIONS =======================================================

layout_general_configure = {
    'border_focus_stack': ["#d75f5f", "#8f3d3d"],
    'border_width': 0.2,
    'margin': 10
}

# LAYOUTS | FORM TO WINDOWS SPLITTER
layouts = [
    layout.Columns(**layout_general_configure),
    #layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    #layout.MonadTall(**layout_general_configure),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)

# ========================================================================================================

widget_defaults = dict(
    font=FONT,
    fontsize=14,
    padding=7,
)
extension_defaults = widget_defaults.copy()

# ================================ SCREEN SECTIONS =======================================================

def base(fg='text', bg='dark'):
    return { 'foreground': COLORS[fg], 'background': COLORS[bg] }

def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)

def icon(fg='text', bg='dark', fontsize=16, text="?", padding=3):
    return widget.TextBox(**base(fg, bg), fontsize=fontsize, text=text, padding=padding)

def texto(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(**base(fg, bg), fontsize=fontsize, text=text)

def powerline(fg='text', bg='dark'):
    return widget.TextBox(**base(fg, bg), text="", fontsize=40, padding=0)

def dockerVersion():
    command = subprocess.run('docker version --format "{{.Server.Version}}"', shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if command.returncode != 0:
        error = command.stderr.decode("UTF-8")
        return error
    else :
        return command.stdout.decode("UTF-8").strip()

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

originalBarr = [
                widget.TextBox("", fontsize=30),
                #widget.CurrentLayout(),
                widget.GroupBox(fontsize=25),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("default config", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                widget.Battery(
                    charge_char='',
                    discharge_char='',
                    font="MesloLGS NF"
                )
            ]

def detectSecondMonitor():
    commandXrandr = "xrandr | grep -w 'connected' | cut -d ' ' -f 2 | wc -l"
    command = subprocess.run(commandXrandr, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if command.returncode != 0:
        error = command.stderr.decode("UTF-8")
        print(error)
        return 1
    else:
        return int(command.stdout.decode("UTF-8"))

monitors = detectSecondMonitor()

screens = [
    Screen(
        top=bar.Bar(primaryScreenBar, 27, opacity=0.92),
    )
]

if monitors > 1:
    screens.append(
        Screen(
            top=bar.Bar(secondaryScreenBar, 27, opacity=0.92),
        )
    )

# ========================================================================================================

# ================================ MOUSE SECTIONS ========================================================

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# ========================================================================================================

# ================================ GENERAL SECTIONS ======================================================

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None

wmname = "LG3D"

# ========================================================================================================

commandsToExecuteWhenStart = []

if monitors > 1:
    commandsToExecuteWhenStart.append(
        "xrandr --auto --output eDP-1 --mode 1366x768 --primary --left-of HDMI-1 --output HDMI-1 --mode 2560x1080"
    )

commandsToExecuteWhenStart.append("feh --bg-center ~/Imágenes/bosques-uw2.jpg")

#commandsToExecuteWhenStart = [
    #"xrandr --auto --output HDMI-1 --mode 2560x1080 --primary --right-of eDP-1 --output eDP-1 --mode 1366-768"
    #"feh --bg-center ~/Imagenes/luces_noche.jpg",
    #"xrandr --auto --output HDMI-1 --mode 1920x1080 --primary --right-of LVDS-1 --output LVDS-1 --mode 1366x768",
    #"xrandr --auto --output eDP-1 --mode 1366x768 --primary --right-of HDMI-1 --output HDMI-1 --mode 2560x1080",
    #"xrandr --auto --output HDMI-1 --mode 1920x1080 --primary --right-of LVDS-1"
    #"xrandr --auto --output LVDS-1 --mode 1366x768 --right-of HDMI-1" # in case laptop primary screen
#]

for command in commandsToExecuteWhenStart:
    os.system(command)

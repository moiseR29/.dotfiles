from libqtile.config import Key
from libqtile.lazy import lazy

mod = "mod4"  # key to use mod (mod4 is a windows key)
terminal = "terminator"  # guess_terminal() # guess_terminal use default terminal
SHIFT_KEY = "shift"
CONTROL_KEY = "control"
FONT = "MesloLGS NF"

# SHORTCUTS
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    Key(
        [mod, SHIFT_KEY],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, SHIFT_KEY],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, SHIFT_KEY], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, SHIFT_KEY], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    Key(
        [mod, CONTROL_KEY], "h", lazy.layout.grow_left(), desc="Grow window to the left"
    ),
    Key(
        [mod, CONTROL_KEY],
        "l",
        lazy.layout.grow_right(),
        desc="Grow window to the right",
    ),
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
    # Browsers
    Key([mod], "b", lazy.spawn("brave"), desc="Launch brave Browser"),
    Key([mod, SHIFT_KEY], "b", lazy.spawn("firefox"), desc="Launch mozilla Browser"),
    # Finded
    Key([mod], "m", lazy.spawn("rofi -show drun"), desc="Launch Application Explorer"),
    Key(
        [mod, SHIFT_KEY],
        "m",
        lazy.spawn("rofi -show"),
        desc="Launch Application Explorer Current Group",
    ),
    # file explorer
    Key([mod], "f", lazy.spawn("thunar"), desc="Launch File Explorer"),
    # APPS
    Key([mod], "d", lazy.spawn("discord")),
    Key([mod], "s", lazy.spawn("slack")),
    Key([mod], "n", lazy.spawn("notable")),
    Key([mod, CONTROL_KEY], "b", lazy.spawn("beekeeper-studio")),
    Key([mod, CONTROL_KEY], "m", lazy.spawn("mailspring")),
    Key([mod, CONTROL_KEY], "i", lazy.spawn("insonmia")),
    Key([mod, SHIFT_KEY], "i", lazy.spawn("postman")),
    # Screenshot
    Key([mod], "p", lazy.spawn("takepic")),
    Key([mod, SHIFT_KEY], "p", lazy.spawn("takepic -s")),
    # Hardware
    # Volumen
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("changevolume up"),
    ),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("changevolume down"),
    ),
    Key([], "XF86AudioMute", lazy.spawn("changevolume mute")),
    # Bright
    Key([], "XF86MonBrightnessUp", lazy.spawn("changebright up")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("changebright down")),
    # SO
    # Key([mod], "o", lazy.spawn("shutdown now")),
    # Audio Graphical
    Key([mod, CONTROL_KEY], "a", lazy.spawn("pavucontrol")),
    # Screens
    Key([mod, SHIFT_KEY], "comma", lazy.prev_screen()),
    Key([mod], "comma", lazy.next_screen()),
]

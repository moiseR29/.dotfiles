from libqtile.config import Group, Key, Match
from libqtile.lazy import lazy

from .keys import keys, mod, SHIFT_KEY

# ORDERS
# (1) Terminal
# (2) Code
# (3) Databases
# (4) Navigator
# (5) Social
group_configure = [
    (
        "1",
        {
            "label": "",
            "layout": "columns",
            "matches": [Match(wm_class=["alacritty", "terminator"])],
            "init": True,
        },
    ),
    (
        "2",
        {
            "label": "",
            "layout": "columns",
            "matches": [Match(wm_class=["code", "code-oss", "vscodium"])],
        },
    ),
    (
        "3",
        {
            "label": "ﱲ",
            "layout": "columns",
            "matches": [
                Match(wm_class=["insomnia", "notable", "beekeeper-studio", "postman", "mongodb-compass"])
            ],
        },
    ),
    (
        "4",
        {
            "label": "",
            "layout": "columns",
            "matches": [Match(wm_class=["brave-browser", "firefox"])],
        },
    ),
    (
        "5",
        {
            "label": "ﭮ",
            "layout": "columns",
            "matches": [Match(wm_class=["discord", "slack", "mailspring", "thunar"])],
        },
    ),
]

groups = [Group(name, **args) for name, args in group_configure]

for i, (name, args) in enumerate(group_configure, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(
        Key([mod, SHIFT_KEY], str(i), lazy.window.togroup(name, switch_group=True))
    )

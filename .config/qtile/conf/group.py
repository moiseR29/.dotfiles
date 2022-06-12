from libqtile.config import Group, Key, Match
from libqtile.lazy import lazy

from .keys import keys, mod, SHIFT_KEY

# ORDERS
# (nf-dev-terminal) Terminal
# (nf-fa-code) Code
# (nf-fa-code) Rest
# (nf-fa-code) Navigator 
# (nf-fa-code) Databases - Others
# (nf-fa-code) social - Social
group_configure = [
    ("1", { 'label': '', 'layout': 'columns', 'matches': [Match(wm_class=["alacritty", "terminator"])], 'init': True }),
    ("2", { 'label': '', 'layout': 'columns', 'matches': [Match(wm_class=["code", "Code - OSS"])] }),
    ("3", { 'label': 'ﱲ', 'layout': 'columns', 'matches': [Match(wm_class=['insomnia', 'notable', 'beekeeper-studio'])] }),
    ("4", { 'label': '', 'layout': 'columns', 'matches': [Match(wm_class=["brave-browser", "firefox"])] }),
    ("5", { 'label': 'ﭮ', 'layout': 'columns', 'matches': [Match(wm_class=["discord", "slack", "mailspring"])] })
    #("6", { 'label': '', 'layout': 'columns', 'matches': [Match(wm_class=["Archivos", "beekeeper-studio"])] })
]

groups = [Group(name, **args) for name, args in group_configure]

for i, (name, args) in enumerate(group_configure, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, SHIFT_KEY], str(i), lazy.window.togroup(name, switch_group=True)))

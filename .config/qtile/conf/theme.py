from os import path
import json

DEFAULT_THEME = "onedark"
THEME = "rxyhn"


def loadTheme():
    home = path.expanduser("~")

    config = path.join(home, f".config/qtile/themes/{THEME}.json")

    if not path.isfile(config):
        config = path.join(home, f".config/qtile/themes/{DEFAULT_THEME}.json")
        return json.load(open(config))

    return json.load(open(config))

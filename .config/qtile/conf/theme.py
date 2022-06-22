from os import path
import json

DEFAULT_THEME = "rxyhn"


def getThemeConfiguration():
    home = path.expanduser("~")
    config = path.join(home, ".dotfiles/.mrc")
    if not path.isfile(config):
        return DEFAULT_THEME

    return json.load(open(config))["theme"]


def loadTheme():
    theme = getThemeConfiguration()
    home = path.expanduser("~")

    config = path.join(home, f".config/qtile/themes/{theme}.json")

    if not path.isfile(config):
        config = path.join(home, f".config/qtile/themes/{DEFAULT_THEME}.json")
        return json.load(open(config))

    return json.load(open(config))

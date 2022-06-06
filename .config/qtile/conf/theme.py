from os import path
import json

def loadTheme(theme = 'dracula'):
  home = path.expanduser('~')

  config = path.join(home, f'.config/qtile/themes/{theme}.json')

  if not path.isfile(config):
    raise Exception(f'{theme} does not exists')

  return json.load(open(config))

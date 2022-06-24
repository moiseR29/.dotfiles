from libqtile import layout

from .keys import FONT
from .theme import loadTheme

COLORS = loadTheme()

general_configure = {
    ## "border_focus_stack": ["#d75f5f", "#8f3d3d"],
    "border_focus_stack": [COLORS["color1"], COLORS["dark"]],
    "border_width": 4,
    "margin": 5,
}

layouts = [
    layout.Columns(**general_configure),
    layout.Max(),
    # layout.MonadTall(**general_configure),
    # layout.Bsp(),
    # layout.Matrix(**general_configure),
]

widget_defaults = dict(
    font=FONT,
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

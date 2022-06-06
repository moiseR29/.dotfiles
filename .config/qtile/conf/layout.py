from libqtile import layout
from libqtile.config import Match

from .keys import FONT

general_configure = {
    'border_focus_stack': ["#d75f5f", "#8f3d3d"],
    'border_width': 4,
    'margin': 5
}

layouts = [
    #layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=4, margin=10),
    layout.Columns(**general_configure),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(**general_configure),
    # layout.MonadTall(**general_configure),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font=FONT,
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

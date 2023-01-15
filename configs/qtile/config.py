# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = "alacritty"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "Tab", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod, "shift"], "t", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    #Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod, "shift"], "a", lazy.spawn(os.path.expanduser('~') + "/.config/rofi/launchers/type-1/launcher.sh")),
    Key([mod, "shift"], "f", lazy.spawn("firefox")),
    Key([mod, "shift"], "e", lazy.spawn("thunar")),
    Key([mod, "shift"], "b", lazy.spawn("brave")),
    Key([mod, "shift"], "c", lazy.spawn("google-chrome-stable")),
    Key([mod, "shift"], "v", lazy.spawn("code")),
    Key([mod, "shift"], "g", lazy.spawn("github-desktop")),
    Key([mod], "z", lazy.spawn("betterlockscreen -l dim")),

    #=-/ Multimedia keys /-=#
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 0 -5%")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 0 +5%")),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),

]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

colors = [["#282c34", "#282c34"],  #background (dark grey) [0]
			   ["#44475a", "#44475a"],  #light grey [1]
			   ["#bbc2cf", "#bbc2cf"],  #forground (white) [2]
			   ["#3071db", "#3071db"],  #dark blue) [3]
			   ["#51afef", "#51afef"],  #blue [4]
			   ["#98be65", "#98be65"],  #green [5]
			   ["#da8548", "#da8548"],  #orange [6]
			   ["#a9a1e1", "#a9a1e1"],  #pink [7]
			   ["#c678dd", "#c678dd"],  #purple [8]
			   ['#ff6c6b', '#ff6c6b'],  #red [9]
			   ["#ecbe7b", "#ecbe7b"]]  #yellow [10]
			   
backgroundColor = "#1E2029"
foregroundColor = "#bbc2cf"
workspaceColor = "#51afef"
foregroundColorTwo = "#44475a"

# Define scratchpads
groups.append(ScratchPad("scratchpad", [
    DropDown("term",terminal, width=0.6, height=0.6, x=0.2, y=0.2, opacity=1),
    DropDown("exitmenu","alacritty -e" + os.path.expanduser('~') + "/automation/logout.sh", width=0.15, height=0.20, x=0.425, y=0.35, opacity=1),
    DropDown("update","alacritty -e" + os.path.expanduser('~') + "/automation/updateSystem.sh", width=0.6, height=0.6, x=0.2, y=0.2, opacity=1),
    DropDown("rsync","alacritty -e" + os.path.expanduser('~') + "/automation/rsync.sh", width=0.6, height=0.6, x=0.2, y=0.2, opacity=1),
    DropDown("betterlock","alacritty -e" + os.path.expanduser('~') + "/betterlockSet.sh", width=0.6, height=0.6, x=0.2, y=0.2, opacity=1),
    DropDown("htop","alacritty -e htop", width=0.6, height=0.6, x=0.2, y=0.2, opacity=1)
]))

# Scratchpad keybindings
keys.extend([
    Key([mod], "Return", lazy.group['scratchpad'].dropdown_toggle('term')),
    Key([mod], "x", lazy.group['scratchpad'].dropdown_toggle('exitmenu')),
    Key([mod], "u", lazy.group['scratchpad'].dropdown_toggle('update')),
    Key([mod], "r", lazy.group['scratchpad'].dropdown_toggle('rsync')),
    Key([mod, "shift"], "z", lazy.group['scratchpad'].dropdown_toggle('betterlock')),
    Key([mod], "t", lazy.group['scratchpad'].dropdown_toggle('htop'))
])


layout_theme = {
        "margin":5,
        "border_width": 2,
        "border_focus": "#1E4C33",
        "border_normal": backgroundColor
    }

layouts = [
    #layout.Columns(border_focus_stack=["#d75f5f", "#8f3d3d"], border_width=2),
    layout.MonadTall(**layout_theme),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]



widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize = 12,
    padding = 2,
    background=backgroundColor
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper='~/OnePlace/wallpapers/wallpaper.jpg',
        wallpaper_mode='stretch',
        top=bar.Bar(
            [
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
                widget.TextBox(
                    text = " ",
                    fontsize = 18,
                    font = "JetBrainsMono Nerd Font",
                    foreground = colors[3],
                    mouse_callbacks = {"Button1": lazy.spawn(os.path.expanduser('~') + "/.config/rofi/launchers/type-1/launcher.sh"), 
                    "Button2": lazy.spawn("alacritty -e htop"), 
                    "Button3": lazy.spawn(terminal)}
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 5
                ),
                widget.GroupBox(
                    font="JetBrainsMono Nerd Font",
                    fontsize = 14,
                    margin_y = 3,
                    margin_x = 4,
                    padding_y = 6,
                    padding_x = 6,
                    borderwidth = 2,
                    disable_drag = True,
                    active = colors[4],
                    inactive = foregroundColor,
                    hide_unused = False,
                    rounded = False,
                    highlight_method = "line",
                    highlight_color = [backgroundColor, backgroundColor],
                    this_current_screen_border = colors[5],
                    this_screen_border = colors[7],
                    other_screen_border = colors[6],
                    other_current_screen_border = colors[6],
                    urgent_alert_method = "line",
                    urgent_border = colors[9],
                    urgent_text = colors[1],
                    foreground = foregroundColor,
                    background = backgroundColor,
                    use_mouse_wheel = False
                ),
                widget.TaskList(
                    icon_size = 0,
                    font = "JetBrainsMono Nerd Font",
                    foreground = colors[2],
                    background = backgroundColor,
                    borderwidth = 1,
                    border = colors[1],
                    margin = 0,
                    padding = 10,
                    highlight_method = "block",
                    title_width_method = "uniform",
                    urgent_alert_method = "border",
                    urgent_border = colors[1],
                    rounded = False,
                    txt_floating = "🗗 ",
                    txt_maximized = "🗖 ",
                    txt_minimized = "🗕 ",
                ),
                widget.Sep(
                    linewidth = 1,
                    padding = 20,
                    foreground = colors[5],
                    background = backgroundColor
                ),
                widget.TextBox(
                    text = "",
                    fontsize = 14,
                    font = "JetBrainsMono Nerd Font",
                    foreground = colors[9],
                    mouse_callbacks = {"Button1": lazy.spawn("ymuse")}
                ),
                widget.Mpd2(
                    font = "JetBrainsMono Nerd Font",
                    foreground = foregroundColor,
                    status_format = '{title} - {artist}  {play_status}',
                    mouse_buttons = {1: 'toggle', 2: 'previous', 3: 'next'},
                    update_interval = 1,
                    padding = 10,
                ),
                widget.Sep(
                    linewidth = 1,
                    padding = 10,
                    foreground = colors[5],
                    background = backgroundColor
                ),
                widget.OpenWeather(
                    app_key = "7834197c2338888258f8cb94ae14ef49",
                    location = "Pune,IN",
                    format = '{icon}  {weather_details}, {main_temp}°{units_temperature}',
                    metric = True,
                    font = "JetBrainsMono Nerd Font",
                    foreground = foregroundColor,
                    padding = 10,
                    update_interval = 600,
                ),
                widget.Sep(
                    linewidth = 1,
                    padding = 10,
                    foreground = colors[5],
                    background = backgroundColor
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
                widget.TextBox(
                    text = "",
                    fontsize = 14,
                    font = "JetBrainsMono Nerd Font",
                    foreground = colors[7],
                ),
                widget.CPU(
                    font = "JetBrainsMono Nerd Font",
                    update_interval = 1.0,
                    format = '{load_percent}%',
                    foreground = foregroundColor,
                    padding = 5
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
                widget.TextBox(
                    text = "",
                    fontsize = 14,
                    font = "JetBrainsMono Nerd Font",
                    foreground = colors[3],
                ),
                widget.Memory(
                    font = "JetBrainsMonoNerdFont",
                    foreground = foregroundColor,
                    format = '{MemUsed: .0f}{mm}',
                    measure_mem='M',
                    padding = 5,
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
                widget.TextBox(
                    text = "",
                    fontsize = 14,
                    font = "JetBrainsMono Nerd Font",
                    foreground = colors[7],
                ),
                widget.DF(
                    font = "JetBrainsMonoNerdFont",
                    foreground = foregroundColor,
                    format = ' {r:.0f}%',
                    visible_on_warn = False,
                ),
                widget.Sep(
                    linewidth = 0,
                    padding = 10
                ),
                widget.TextBox(
                    text = "",
                    fontsize = 14,
                    font = "JetBrainsMono Nerd Font",
                    foreground = colors[10],
                ),
                widget.Clock(
                    format='%I:%M %p',
                    font = "JetBrainsMono Nerd Font",
                    padding = 10,
                    fontsize = 14,
                    foreground = colors[9],
                ),
                widget.TextBox(
                    text = "",
                    fontsize = 14,
                    font = "JetBrainsMono Nerd Font",
                    foreground = colors[7],
                ),
                widget.Volume(
                    font = "JetBrainsMono Nerd Font",
                    foreground = foregroundColor,
                    padding = 5,
                    step = 1
                ),
                widget.Systray(
                    background = backgroundColor,
                    icon_size = 20,
                    padding =4,
                ),
                widget.Battery(
                    font = "JetBrainsMono Nerd Font",
                    foreground = '#378d5f',
                    padding = 5,
                    format = '{percent:2.0%}',
                    update_interval = 10,
                    show_short_text = False
                ),
                widget.CurrentLayoutIcon(
                    scale = 0.5,
                    foreground = foregroundColor,
                    background = backgroundColor
                ),

            ],
            size=30,
            background=backgroundColor,
            margin=5, 
            opacity=0.75

        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    border_focus = colors[1],
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
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qtile"

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])
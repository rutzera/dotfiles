# libraries
import os
import re
import socket
import subprocess
import psutil
from libqtile.config import Drag, Key, Screen, Group, Drag, Click, Rule, KeyChord
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook, qtile
from libqtile.widget import Spacer
import arcobattery

@lazy.function
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

@lazy.function
def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

##### Keybindings
#******************************************************************************
#mod4 or mod = super key
mod = "mod4"
mod1 = "alt"
mod2 = "control"
home = os.path.expanduser('~')
myTerm = "termite"
myBrowser = "brave"
myFileManager = "nemo"
myTextEditor = "atom"
myOfficeSuite = "libreoffice"
# myLaTeXEditor = "gnome-latex"
myMusicPlayer = "spotify"
myConfig = "/home/adrian/.config/qtile/config.py"


keys = [
### Qtile Controls
	Key([mod, "control"], "r", 
        lazy.restart()),
	Key([mod, "control"], "q", 
        lazy.shutdown()),
    Key([mod], "x", 
        lazy.spawn('arcolinux-logout')),
    # Key([mod, "shift"], "x", lazy.shutdown()),

### The Essentials
    Key([mod], "Return", 
        lazy.spawn(myTerm + " -e zsh")),
    Key([mod], "d", 
        lazy.spawn(myFileManager)),
    Key([mod], "e", 
        lazy.spawn(myTextEditor)),
 #    Key([mod], "d", 
  #       lazy.spawn("dmenu_run -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'NotoMonoRegular:bold:pixelsize=18'")),
    Key([mod], "b", 
        lazy.spawn(myBrowser)),
    Key([mod], "v", 
        lazy.spawn('pavucontrol')),
    Key([mod], "q", 
        lazy.window.kill()),
    # Key([mod], "c", lazy.spawn('conky-toggle')),

### Application launcher -- ALT
	Key([mod], "r", 
        lazy.spawn("rofi -show drun")),
	Key([mod, "mod1"], "r", 
        lazy.spawn("rofi -show run")),
	Key([mod, "mod1"], "s", 
        lazy.spawn(myMusicPlayer)),
	Key([mod, "mod1"], "o", 
        lazy.spawn(myOfficeSuite)),
	Key([mod, "mod1"], "a", 
        lazy.spawn('xfce4-appfinder')),
	Key([mod, "mod1"], "m", 
        lazy.spawn('xfce4-settings-manager')),
    Key([mod, "mod1"], "p", 
        lazy.spawn('pamac-manager')),
    Key([mod, "mod1"], "t", 
        lazy.spawn('thunderbird')),
    Key([mod2, "shift"], "Escape", 
        lazy.spawn('xfce4-taskmanager')),

### System Controls
    # INCREASE/DECREASE BRIGHTNESS
    Key([], "XF86MonBrightnessUp", 
        lazy.spawn("xbacklight -inc 10")),
    Key([], "XF86MonBrightnessDown", 
            lazy.spawn("xbacklight -dec 10")),

    # INCREASE/DECREASE/MUTE VOLUME
    Key([], "XF86AudioMute", 
            lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", 
            lazy.spawn("amixer -q set Master 5%-")),
    Key([], "XF86AudioRaiseVolume", 
            lazy.spawn("amixer -q set Master 5%+")),
    # Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    # Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    # Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    # Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),

### Window and Layout Controls
    # QTILE LAYOUT KEYS
    Key([mod], "f", 
            lazy.window.toggle_floating()),
    Key([mod], "m", 
            lazy.layout.maximize()),
    Key([mod], "n", 
            lazy.layout.normalize()),
    Key([mod], "space", 
            lazy.next_layout()),


    # CHANGE FOCUS
    Key([mod], "period", 
            lazy.next_screen()),
	Key([mod], "comma", 
            lazy.prev_screen()),
    Key([mod], "Up", 
            lazy.layout.up()),
    Key([mod], "Down", 
            lazy.layout.down()),
    Key([mod], "Left", 
            lazy.layout.left()),
    Key([mod], "Right", 
            lazy.layout.right()),
    Key([mod], "k", 
            lazy.layout.up()),
    Key([mod], "j", 
            lazy.layout.down()),
    Key([mod], "h", 
            lazy.layout.left()),
    Key([mod], "l", 
            lazy.layout.right()),

    # RESIZE UP, DOWN, LEFT, RIGHT
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),

# FLIP LAYOUT FOR MONADTALL/MONADWIDE
    Key([mod, "shift"], "f", 
            lazy.layout.flip()),

# FLIP LAYOUT FOR BSP
    Key([mod, "mod1"], "k", 
            lazy.layout.flip_up()),
    Key([mod, "mod1"], "j", 
            lazy.layout.flip_down()),
    Key([mod, "mod1"], "l", 
            lazy.layout.flip_right()),
    Key([mod, "mod1"], "h", 
            lazy.layout.flip_left()),

# MOVE WINDOWS UP OR DOWN BSP LAYOUT
    Key([mod, "shift"], "k", 
            lazy.layout.shuffle_up()),
    Key([mod, "shift"], "j", 
            lazy.layout.shuffle_down()),
    Key([mod, "shift"], "h", 
            lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", 
            lazy.layout.shuffle_right()),

# MOVE WINDOWS UP OR DOWN MONADTALL/MONADWIDE LAYOUT
    Key([mod, "shift"], "Up", 
            lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", 
            lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Left", 
            lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", 
            lazy.layout.swap_right()),

    ### IDEAS
	# Key([mod, "mod1"], "l", lazy.spawn(myLaTeXEditor)),
    # Key(["mod1"], "F3", lazy.spawn('xfce4-appfinder')),

    # SCREENSHOTS
    # Key([], "Print", lazy.spawn("scrot 'ArcoLinux-%Y-%m-%d-%s_screenshot_$wx$h.jpg' -e 'mv $f $$(xdg-user-dir PICTURES)'")),
    # Key([mod2], "Print", lazy.spawn('xfce4-screenshooter')),
    # Key([mod2, "shift"], "Print", lazy.spawn('gnome-screenshot -i')),

    # FUNCTION KEYS
    # Key([], "F12", lazy.spawn('xfce4-terminal --drop-down')),
]


##### WORKSPACES
#******************************************************************************
workspaces = [
    {"name": "", "key": "1",},
    {"name": "", "key": "2",},
    {"name": "", "key": "3",},
    {"name": "", "key": "4",},
    {"name": "", "key": "5",},
    {"name": "", "key": "6",},
    ]

# Window management in workspaces
groups = []
for workspace in workspaces:
    groups.append(Group(workspace["name"]))
    keys.append(
        Key(
            [mod],
            workspace["key"],
            lazy.group[workspace["name"]].toscreen(),
            desc="Focus this desktop",
            )
        )
    keys.append(
        Key(
            [mod, "shift"],
            workspace["key"],
            lazy.window.togroup(workspace["name"]),
            desc="Move focused window to another group",
             )
        )
    keys.append(
        Key(
            [mod], "Tab",
            lazy.screen.next_group(),
            desc="tab to next workspace ",
            )
        )
    keys.append(
        Key(
            [mod, "shift"], "Tab",
            lazy.screen.prev_group(),
            desc="tab to previous workspace",
            )
        )
    keys.append(
        Key(
            [mod, "shift"],
            workspace["key"],
            lazy.window.togroup(workspace["name"]), lazy.group[workspace["name"]].toscreen(),
            desc="move window to selected workspace and fallow moved window to workspace",
            )
        )

    keys.append(
        Key(
            ["mod1", "shift"],
            workspace["key"],
            lazy.window.togroup(workspace["name"]), 
            desc="move window to selected workspace and stay on workspace",
            )
        )


#******************************************************************************
# COLORS FOR THE BAR
def init_colors():
    return[
    ["#2e3440", "#2e3440"],  # 00 background
    ["#d8dee9", "#d8dee9"],  # 01 foreground
    ["#3b4252", "#3b4252"],  # 02 background lighter
    ["#bf616a", "#bf616a"],  # 03 red
    ["#a3be8c", "#a3be8c"],  # 04 green
    ["#ebcb8b", "#ebcb8b"],  # 05 yellow
    ["#81a1c1", "#81a1c1"],  # 06 blue
    ["#b48ead", "#b48ead"],  # 07 magenta
    ["#88c0d0", "#88c0d0"],  # 08 cyan
    ["#e5e9f0", "#e5e9f0"],  # 09 white
    ["#4c566a", "#4c566a"],  # 10 grey
    ["#d08770", "#d08770"],  # 11 orange
    ["#8fbcbb", "#8fbcbb"],  # 12 super cyan
    ["#5e81ac", "#5e81ac"],  # 13 super blue
    ["#242831", "#242831"]]  # 14 super dark background
    
colors = init_colors()

# Layout theme
#******************************************************************************
layout_theme = {
    "border_width": 2,
    "margin": 3,
    "border_focus": "#8fbcbb",
    "border_normal": "#3b4252",
    "font": "FiraCode Nerd Font",
    "grow_amount": 2,
}

layouts = [
    layout.MonadTall(**layout_theme),
    # layout.MonadWide(margin=8, border_width=2, border_focus="#5e81ac", border_normal="#4c566a"),
    # layout.Matrix(**layout_theme),
    # layout.Bsp(**layout_theme),
    layout.Floating(**layout_theme),
    # layout.RatioTile(**layout_theme),
    layout.Max(**layout_theme, fullscreen_border_width=3, max_border_width=3)
]

#####  WIDGET BAR
#******************************************************************************
# Widgets defauls - Bar
widget_defaults = dict(
    font="FiraCode Nerd Font", 
    fontsize=18, 
    padding=3, 
    background=colors[0]
)
extension_defaults = widget_defaults.copy()

# GroupBox = widget
group_box_settings = {
    "padding":5 ,
    "borderwidth": 4,
    "active": colors[9],
    "inactive": colors[10],
    "disable_drag": False,
    "rounded": True,
    "fontsize": 20,
    "highlight_color": colors[2],
    "block_highlight_text_color": colors[6],
    "highlight_method": "block",
    "this_current_screen_border": colors[2],
    "this_screen_border": colors[14],
    "other_current_screen_border": colors[14],
    "other_screen_border": colors[14],
    "foreground": colors[1],
    "background": colors[14],
    "urgent_border": colors[3],
}

### Define functions for bar
# def taskwarrior():
    # return (
        # subprocess.check_output(["~/.config/qtile/task_polybar.sh"])
        # .decode("utf-8")
        # .strip()
    # )

# def bluetooth():
    # return (
        # subprocess.check_output(["~/.config/qtile/system-bluetooth-bluetoothctl.sh"])
        # .decode("utf-8")
        # .strip()
    # )

# # Mouse_callback functions
# def kill_window():
    # qtile.cmd_spawn("xdotool getwindowfocus windowkill")

# def toggle_bluetooth():
    # qtile.cmd_spawn("./.config/qtile/system-bluetooth-bluetoothctl.sh --toggle")


### Widget list
#******************************************************************************
def init_widgets_list():
    prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
    widgets_list = [
           widget.Sep(
                    linewidth = 0,
                    padding = 6,
                    foreground = colors[2],
                    background = colors[0],
                    ),
            widget.Image(
                    filename = "~/.config/qtile/icons/qtilelogo.png",
#                     mouse_callbacks = {'Button1': lambda qtile:
                        # qtile.cmd_spawn('dmenu_run')},
                     ),
            widget.TextBox(
                    text="◢",
                    foreground=colors[14],
                    background=colors[0],
                    fontsize=75,
                    padding=-7,
                    ),
            widget.GroupBox(
                    font="Font Awesome 5 Free Solid",
                    visible_groups=["","", "", "", "", ""],
                    **group_box_settings,
                    ),
            widget.TextBox(
                    text="█",
                    foreground=colors[14],
                    background=colors[0],
                    fontsize=30,
                    padding=0,
                    ),
    # Current Layout        
            widget.CurrentLayoutIcon(
                    custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                    foreground=colors[2],
                    background=colors[14],
                    padding=0,
                    scale=0.9,
                    ),
            widget.TextBox(
                    text="▉",
                    foreground=colors[14],
                    background=colors[0],
                    fontsize=30,
                    padding=-7,
                    ),

            widget.TextBox(
                    text="◣ ",
                    foreground=colors[14],
                    background=colors[0],
                    fontsize=90,
                    padding=-9,
                    ),
    # Window Name        
            widget.TextBox(
                    text="◢",
                    foreground=colors[14],
                    background=colors[0],
                    fontsize=75,
                    padding=-7,
                    ),
            widget.TaskList(
                    borderwidth=0, 
                    highlight_method="block", 
                    background= colors[14],
                    border= colors[2], 
                    urgent_border=colors[0],
                    rounded = True,
                    #max_title_width = 100,
                    markup_floating="<i>{}</i>", 
                    markup_minimized="<s>{}</s>",
                    mouse_callbacks = {"Button2": lambda: qtile.current_window.kill()}
                    ),
            widget.TextBox(
                    text="◣ ",
                    foreground=colors[14],
                    background=colors[0],
                    fontsize=90,
                    padding=-9,
                    ),

            widget.Spacer(),

            widget.TextBox(
                    text="◢",
                    foreground=colors[14],
                    background=colors[0],
                    fontsize=75,
                    padding=-7,
                    ),
    # Systemtray    
            widget.Systray(
                    icon_size=22, 
                    background=colors[14], 
                    padding=10
                    ),
            widget.TextBox(
                    text="◢",
                    foreground=colors[0],
                    background=colors[14],
                    fontsize=75,
                    padding=-7,
                    ),
    # Battery and Temperature        
            # do not activate in Virtualbox - will break qtile
            # battery option 1  ArcoLinux Horizontal icons do not forget to import arcobattery at the top
            arcobattery.BatteryIcon(
                    padding=0,
                    scale=0.7,
                    y_poss=2,
                    theme_path=home + "/.config/qtile/icons/battery_icons_horiz",
                    update_interval = 5,
                    background = colors[0]
                    ),
            widget.TextBox(
                    font="Font Awesome 5 Free Solid",
                    text="   ",
                    foreground=colors[1],
                    background=colors[0],
                    padding = 2,
                    fontsize=20,
                    ),
            widget.ThermalSensor(
                    foreground = colors[1],
                    foreground_alert = colors[3],
                    background = colors[0],
                    metric = True,
                    padding = 3,
                    threshold = 80
                    ),
    # Memory
              widget.TextBox(
                       font="Font Awesome 5 Free Solid",
                       text="  ",
                       foreground=colors[1],
                       background=colors[0],
                       padding = 0,
                       fontsize=16
                       ),
              widget.Memory(
                       font="Noto Sans",
                       format = '{MemUsed}/{MemTotal}M',
                       update_interval = 1,
                       fontsize = 16,
                       foreground = colors[1],
                       background = colors[0],
                      ),
    # Volume-Widget    
            widget.TextBox(
                    text="◢",
                    foreground=colors[14],
                    background=colors[0],
                    fontsize=75,
                    padding=-7,
                    ),
            widget.TextBox(
                    text=" ",
                    foreground=colors[8],
                    background=colors[14],
                    font="Font Awesome 5 Free Solid",
                    mouse_callbacks={"Button3": lambda: qtile.cmd_spawn("pavucontrol")},
                    ),
            widget.PulseVolume(
                    foreground=colors[8],
                    background=colors[14],
                    limit_max_volume="True",
                    mouse_callbacks={"Button3": lambda: qtile.cmd_spawn("pavucontrol")},
                    ),
    # Time 
            widget.TextBox(
                    text="◢",
                    foreground=colors[0],
                    background=colors[14],
                    fontsize=75,
                    padding=-7,
                    ),
            widget.TextBox(
                    text=" ",
                    font="Font Awesome 5 Free Solid",
                    foreground=colors[4],  # fontsize=38
                    background=colors[0],
                    ),
            widget.Clock(
                    format="%H:%M",
                    foreground=colors[4],
                    background=colors[0],
                    # mouse_callbacks={"Button1": todays_date},
                    ),
    # Day and Month        
            widget.TextBox(
                    text="◢",
                    foreground=colors[14],
                    background=colors[0],
                    fontsize=75,
                    padding=-7,
                    ),
            widget.TextBox(
                    text=" ",
                    font="Font Awesome 5 Free Solid",
                    foreground=colors[5],
                    background=colors[14],
                    ),
            widget.Clock(
                    format="%a, %d %b",
                    background=colors[14],
                    foreground=colors[5],
                    ),
    # Shutdown
            widget.TextBox(
                    text="◢",
                    foreground=colors[0],
                    background=colors[14],
                    fontsize=75,
                    padding=-7,
                    ),
            widget.TextBox(
                    text="⏻",
                    foreground=colors[13],
                    background=colors[0],
                    font="Font Awesome 5 Free Solid",
                    fontsize=20,
                    padding=20,
                    mouse_callbacks={"Button1": lambda: qtile.cmd_spawn('arcolinux-logout')},
                    ),
    ]

    return widgets_list

widgets_list = init_widgets_list()


# Initialize Screens
#******************************************************************************
def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2

widgets_screen1 = init_widgets_screen1()
widgets_screen2 = init_widgets_screen2()


def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), size=26, opacity = 0.9)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), size=26, opacity = 0.9))]
screens = init_screens()


# MOUSE CONFIGURATION
#******************************************************************************
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size())
]

dgroups_key_binder = None
dgroups_app_rules = []

# ASSIGN APPLICATIONS TO A SPECIFIC GROUPNAME
# BEGIN

# @hook.subscribe.client_new
# def assign_app_group(client):
#     d = {}
#     #########################################################
#     ################ assgin apps to groups ##################
#     #########################################################
#     d["1"] = ["Navigator", "Firefox", "Vivaldi-stable", "Vivaldi-snapshot", "Chromium", "Google-chrome", "Brave", "Brave-browser",
#               "navigator", "firefox", "vivaldi-stable", "vivaldi-snapshot", "chromium", "google-chrome", "brave", "brave-browser", ]
#     d["2"] = [ "Atom", "Subl3", "Geany", "Brackets", "Code-oss", "Code", "TelegramDesktop", "Discord",
#                "atom", "subl3", "geany", "brackets", "code-oss", "code", "telegramDesktop", "discord", ]
#     d["3"] = ["Inkscape", "Nomacs", "Ristretto", "Nitrogen", "Feh",
#               "inkscape", "nomacs", "ristretto", "nitrogen", "feh", ]
#     d["4"] = ["Gimp", "gimp" ]
#     d["5"] = ["Meld", "meld", "org.gnome.meld" "org.gnome.Meld" ]
#     d["6"] = ["Vlc","vlc", "Mpv", "mpv" ]
#     d["7"] = ["VirtualBox Manager", "VirtualBox Machine", "Vmplayer",
#               "virtualbox manager", "virtualbox machine", "vmplayer", ]
#     d["8"] = ["Thunar", "Nemo", "Caja", "Nautilus", "org.gnome.Nautilus", "Pcmanfm", "Pcmanfm-qt",
#               "thunar", "nemo", "caja", "nautilus", "org.gnome.nautilus", "pcmanfm", "pcmanfm-qt", ]
#     d["9"] = ["Evolution", "Geary", "Mail", "Thunderbird",
#               "evolution", "geary", "mail", "thunderbird" ]
#     d["0"] = ["Spotify", "Pragha", "Clementine", "Deadbeef", "Audacious",
#               "spotify", "pragha", "clementine", "deadbeef", "audacious" ]
#     ##########################################################
#     wm_class = client.window.get_wm_class()[0]
#
#     for i in range(len(d)):
#         if wm_class in list(d.values())[i]:
#             group = list(d.keys())[i]
#             client.togroup(group)
#             client.group.cmd_toscreen()

# END
# ASSIGN APPLICATIONS TO A SPECIFIC GROUPNAME



# HOOKs 
#******************************************************************************
main = None

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/scripts/autostart.sh'])

@hook.subscribe.startup
def start_always():
    # Set the cursor to something sane in X
    subprocess.Popen(['xsetroot', '-cursor_name', 'left_ptr'])

@hook.subscribe.client_new
def set_floating(window):
    if (window.window.get_wm_transient_for()
            or window.window.get_wm_type() in floating_types):
        window.floating = True

floating_types = ["notification", "toolbar", "splash", "dialog"]


follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'Arcolinux-welcome-app.py'},
    {'wmclass': 'Arcolinux-tweak-tool.py'},
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},
    {'wmclass': 'makebranch'},
    {'wmclass': 'maketag'},
    {'wmclass': 'Arandr'},
    {'wmclass': 'feh'},
    {'wmclass': 'Galculator'},
    {'wmclass': 'arcolinux-logout'},
    {'wmclass': 'xfce4-terminal'},
    {'wname': 'branchdialog'},
    {'wname': 'Open File'},
    {'wname': 'pinentry'},
    {'wmclass': 'ssh-askpass'},
], fullscreen_border_width = 0, border_width = 0)
auto_fullscreen = True

focus_on_window_activation = "focus" # or smart

wmname = "LG3D"

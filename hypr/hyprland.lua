-- Hyprland Lua configuration
-- Migrated from hyprland.conf

-- Hyprland 0.55+ uses Lua configuration.
-- This file should be ~/.config/hypr/hyprland.lua

-- Variables

local mainMod = "SUPER"

local terminal = "kitty"
local fileManager = "thunar"
local menu = "fuzzel"
local browser = "firefox"
local notifications = "swaync-client -t"

-- Monitors

hl.monitor({
	output = "DP-2",
	mode = "2560x1440@180",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60",
	position = "2560x0",
	scale = 1,
})

hl.monitor({
	output = "HDMI-A-2",
	mode = "1920x1080@60",
	position = "4480x0",
	scale = 1,
})

-- Workspaces

-- AOC — MAIN / LEFT

hl.workspace_rule({
	workspace = "1",
	monitor = "DP-2",
})

hl.workspace_rule({
	workspace = "2",
	monitor = "DP-2",
})

hl.workspace_rule({
	workspace = "3",
	monitor = "DP-2",
})

hl.workspace_rule({
	workspace = "4",
	monitor = "DP-2",
})

hl.workspace_rule({
	workspace = "5",
	monitor = "DP-2",
})

-- DSGR — SECONDARY / MIDDLE

hl.workspace_rule({
	workspace = "6",
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = "7",
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = "8",
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = "9",
	monitor = "HDMI-A-1",
})

hl.workspace_rule({
	workspace = "10",
	monitor = "HDMI-A-1",
})

-- PHILIPS — LEFTOVER / RIGHT

hl.workspace_rule({
	workspace = "11",
	monitor = "HDMI-A-2",
})

hl.workspace_rule({
	workspace = "12",
	monitor = "HDMI-A-2",
})

hl.workspace_rule({
	workspace = "13",
	monitor = "HDMI-A-2",
})

hl.workspace_rule({
	workspace = "14",
	monitor = "HDMI-A-2",
})

hl.workspace_rule({
	workspace = "15",
	monitor = "HDMI-A-2",
})

-- Input

hl.config({
	input = {
		accel_profile = "flat",
		sensitivity = 0,
		repeat_delay = 200,
		repeat_rate = 50,
		kb_layout = "no",
	},

	cursor = {
		no_warps = true,
		hide_on_key_press = true,
	},
	animations = {
		enabled = true,

		bezier = {
			"snappy, 0.2, 0.8, 0.2, 1.0",
		},

		animation = {
			"windows, 1, 3, snappy",
			"windowsIn, 1, 3, snappy, popin 80%",
			"windowsOut, 1, 3, snappy, popin 80%",
			"windowsMove, 1, 3, snappy",
		},
	},
})

-- General

hl.config({
	general = {
		border_size = 3,
		gaps_in = 3,
		gaps_out = 5,
		layout = "scrolling",

		col = {
			active_border = "rgba(a78bfaff)",
			inactive_border = "rgba(0f0a1aff)",
		},
	},
})

-- Layout
hl.config({
	scrolling = {
		direction = "right",
		column_width = 0.5,
		follow_focus = true,
	},
})

-- Animations

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = 1,
	bezier = "default",
	style = "slidefade 20%",
})

hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = 1,
	bezier = "default",
	style = "slidefade 20%",
})

hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = 1,
	bezier = "default",
	style = "slidefade 20%",
})

hl.animation({
	leaf = "windowsMove",
	enabled = true,
	speed = 1,
	bezier = "default",
	style = "slidefade 20%",
})

hl.animation({
	leaf = "global",
	enabled = true,
	speed = 0.001,
	bezier = "default",
})

-- Autostart

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("swaync")

	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("udiskie --tray")

	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

-- Applications

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))

-- Window management

hl.bind(mainMod .. " + ESCAPE", hl.dsp.window.close())

-- Toggle floating
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))

-- Center floating window
hl.bind(mainMod .. " + V", hl.dsp.window.center())

-- Fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Window center / resize

hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))

hl.bind(
	mainMod .. " + SHIFT + V",
	hl.dsp.window.resize({
		x = 1440,
		y = 900,
		relative = false,
	})
)

hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.center())

-- Hyprland reload

-- hl.bind(mainMod .. " + SHIFT + R", hl.dsp.reload_config())

-- Notifications

hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notifications))

-- Custom scripts

-- Toggle gaps
-- This does not work
-- hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-gaps.sh"))
-- hl.bind(mainMod .. " + G", hl.dsp.pseudo())

-- Set wallpaper folder and relaunch hyprpaper
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(".config/hypr/scripts/select-wallpaper-folder.sh"))

-- Set audio output
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd(".config/hypr/scripts/select-audio-output.sh"))

-- Screen temperature

hl.bind(
	mainMod .. " + SHIFT + N",
	hl.dsp.exec_cmd(
		[[sh -c 'choice=$(printf "6500\n4000\n3000\n2500\n2000\n1500\n1000" | fuzzel --dmenu --prompt="Temp"); [ -n "$choice" ] && hyprctl hyprsunset temperature "$choice"']]
	)
)

-- Screenshot

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | wl-copy]]))

-- btop

hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("kitty -e btop"))

-- Window focus

-- Swap tiled windows

hl.bind(mainMod .. " + SHIFT + CTRL + H", hl.dsp.window.swap({ direction = "l" }))

hl.bind(mainMod .. " + SHIFT + CTRL + L", hl.dsp.window.swap({ direction = "r" }))

hl.bind(mainMod .. " + SHIFT + CTRL + K", hl.dsp.window.swap({ direction = "u" }))

hl.bind(mainMod .. " + SHIFT + CTRL + J", hl.dsp.window.swap({ direction = "d" }))

-- Move focus using HJKL

hl.bind(mainMod .. " + H", hl.dsp.layout("focus l"))

hl.bind(mainMod .. " + L", hl.dsp.layout("focus r"))

hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))

hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

-- Move windows

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.layout("swapcol l"))

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.layout("swapcol r"))

hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))

hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Resize windows

hl.bind(
	mainMod .. " + CTRL + H",
	hl.dsp.window.resize({
		x = -100,
		y = 0,
		relative = true,
	})
)

hl.bind(
	mainMod .. " + CTRL + L",
	hl.dsp.window.resize({
		x = 100,
		y = 0,
		relative = true,
	})
)

hl.bind(
	mainMod .. " + CTRL + K",
	hl.dsp.window.resize({
		x = 0,
		y = -100,
		relative = true,
	})
)

hl.bind(
	mainMod .. " + CTRL + J",
	hl.dsp.window.resize({
		x = 0,
		y = 100,
		relative = true,
	})
)

-- Mouse binds

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"))

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"))

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"))

-- Workspaces

-- SUPER + 1..9,0 -> workspaces 1..10

for i = 1, 9 do
	hl.bind(mainMod .. " + " .. tostring(i), hl.dsp.focus({ workspace = tostring(i) }))
end

hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))

-- Move windows to workspaces

for i = 1, 9 do
	hl.bind(
		mainMod .. " + SHIFT + " .. tostring(i),
		hl.dsp.window.move({
			workspace = tostring(i),
		})
	)
end

hl.bind(
	mainMod .. " + SHIFT + 0",
	hl.dsp.window.move({
		workspace = "10",
	})
)

-- Swap workspaces scripts

for i = 1, 9 do
	hl.bind(
		mainMod .. " + SHIFT + CTRL + " .. tostring(i),
		hl.dsp.exec_cmd("~/.config/hypr/scripts/swap-workspaces.sh " .. tostring(i))
	)
end

hl.bind(mainMod .. " + SHIFT + CTRL + 0", hl.dsp.exec_cmd("~/.config/hypr/scripts/swap-workspaces.sh 10"))

-- Cycle workspaces

hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "+1" }))

hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "-1" }))

hl.bind(
	mainMod .. " + CTRL + TAB",
	hl.dsp.window.move({
		workspace = "+1",
	})
)

hl.bind(
	mainMod .. " + SHIFT + CTRL + TAB",
	hl.dsp.window.move({
		workspace = "-1",
	})
)

-- Window search

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/search-window.sh"))

-- Clipboard

hl.bind(mainMod .. " + C", hl.dsp.exec_cmd([[wl-copy "$(wl-paste)"]]))

hl.bind(mainMod .. " + V", hl.dsp.exec_cmd([[wtype "$(wl-paste)"]]))

hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))

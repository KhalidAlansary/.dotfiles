local programs = require("hyprland.programs")
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Apps and core actions
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd(programs.terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprshutdown"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(programs.fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(programs.browser))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | fuzzel -d | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprshutdown -t 'Restarting...' --post-cmd 'reboot'"))
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.exec_cmd("hyprshutdown -t 'Shutting down...' --post-cmd 'poweroff'"))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("normcap"))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(programs.menu))
hl.bind("ALT + Print", hl.dsp.exec_cmd("hyprshot --mode active --mode window --clipboard-only"))
hl.bind("Print", hl.dsp.exec_cmd("hyprshot --mode region --clipboard-only"))

-- Move focus with vim keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Move windows with vim keys
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Keyboard layout switchers
local home = os.getenv("HOME")
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/qwerty.sh"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd(home .. "/.config/hypr/scripts/dvp.sh"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]

-- Workspaces on the programmer-dvorak number row
local dvorakWorkspaceKeys = {
	"parenleft", -- 1
	"parenright", -- 2
	"braceright", -- 3
	"plus", -- 4
	"braceleft", -- 5
	"bracketright", -- 6
	"bracketleft", -- 7
	"exclam", -- 8
	"equal", -- 9
	"asterisk", -- 10
}
for i, key in ipairs(dvorakWorkspaceKeys) do
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll workspaces (jumps by 2; odd = left monitor, even = right monitor)
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+2" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-2" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Global keybinds
hl.bind(mainMod .. " + F9", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))
hl.bind(mainMod .. " + F10", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))
hl.bind("SHIFT + F12", hl.dsp.pass({ window = "class:.*" }))
hl.bind("Scroll_Lock", hl.dsp.global(":toggle_mute"))
hl.bind("Pause", hl.dsp.global(":toggle_deafen"))

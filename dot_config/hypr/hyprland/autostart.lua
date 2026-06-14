-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
local programs = require("hyprland.programs")

hl.on("hyprland.start", function()
	local autostart_cmds = { "waybar", "hyprpaper", "steam -silent", "heroic", "qbittorrent" }
	for i = 1, #autostart_cmds do
		hl.exec_cmd(autostart_cmds[i])
	end
	hl.exec_cmd("discord", { workspace = "2 silent", monitor = 1 })
	hl.exec_cmd(programs.browser, { workspace = "3 silent", monitor = 2 })
	hl.exec_cmd("spotify", { workspace = "4 silent", monitor = 1 })
	hl.exec_cmd("thunderbird", { workspace = "5 silent", monitor = 2 })
end)

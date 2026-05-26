hl.config({
	input = {
		kb_layout = "us,eg",
		kb_variant = "dvp",
		kb_options = "caps:swapescape,grp:alt_shift_toggle",

		follow_mouse = 2,

		sensitivity = -0.3, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

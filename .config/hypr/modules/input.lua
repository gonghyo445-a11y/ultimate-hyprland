---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 0,

		sensitivity = -1.0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "vertical",
	action = "workspace",
})


hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "scroll_move",
})

hl.device({
	name = "dell09c3:00-0488:120a-touchpad",
	sensitivity = 0,
	accel_profile = "adaptive",
})

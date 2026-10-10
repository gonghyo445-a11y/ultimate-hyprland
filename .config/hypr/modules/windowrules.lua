--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

-- Window-Rules --
local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "open-file",
	match = {
		title = "^(Open File|Open|Save|Save as|Export|Import|Choose File|Rename)",
		class = "^(.*)$",
	},

	float = true,
	center = true,
})

hl.window_rule({
	name = "satty",
	match = { class = "com.gabm.satty" },

	float = true,
	center = true,
})

hl.window_rule({
	name = "prism-launcher",
	match = { class = "org.prismlauncher.PrismLauncher" },

	float = true,
	center = true,
	size = { 800, 600 },
})

hl.window_rule({
	name = "xdg-desktop-portal-hyprland",
	match = { class = "hyprland-share-picker" },

	float = true,
	center = true,
})

hl.window_rule({
	name = "nm-connection-editor",
	match = { class = "nm-connection-editor" },

	float = true,
	center = true,
})

hl.window_rule({
	name = "pulseaudiio.pavucontrol",
	match = { class = "org.pulseaudio.pavucontrol" },

	float = true,
	center = true,
})
hl.window_rule({
	name = "nautilus",
	match = { class = "org.gnome.Nautilus" },

	float = true,
	center = true,
})

hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

-- Layer Rules --
hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})


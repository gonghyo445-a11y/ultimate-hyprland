local function layout_bind(bind_table)
    return function ()
        local workspace = hl.get_active_special_workspace() or
                          hl.get_active_workspace()

        if not workspace then
            return
        end

        local layout = workspace.tiled_layout

        if bind_table[layout] then
            hl.dispatch(bind_table[layout])
        end
    end
end

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "alacritty"
local fileManager = "nautilus"
local browser = "helium-browser"
---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local secondMod = "SUPER + SHIFT" -- Sets "Windows" key as main modifier
local thirdMod = "SUPER + CTRL" -- Sets "Windows" key as main modifier
-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
--
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal, { float = true, center = true, size = { 800, 600 } }))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(
	mainMod .. " + M",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(secondMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(secondMod .. " + E", hl.dsp.exec_cmd(terminal .." -e yazi", { float = true, center = true, size = { 800, 600 } }))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(terminal .." -e nvim", { float = true, center = true, size = { 800, 600 } }))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("pkill -x rofi || rofi -show drun -show-icons"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(thirdMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + H", layout_bind({
    scrolling = hl.dsp.layout("focus l"),  
    dwindle = hl.dsp.focus({ direction = "left" }),
    master = hl.dsp.focus({ direction = "left" }),
}))


hl.bind(mainMod .. " + L", layout_bind({
    scrolling = hl.dsp.layout("focus r"),  
    dwindle = hl.dsp.focus({ direction = "right" }),
    master = hl.dsp.focus({ direction = "right" }),
}))


hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))



hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))


hl.bind(secondMod .. " + mouse_up", hl.dsp.layout("focus r"))
hl.bind(secondMod .. " + mouse_down", hl.dsp.layout("focus l"))

hl.bind("CTRL + SHIFT + S", hl.dsp.exec_cmd("pkill -x slurp || hyprshot -m region"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- UTILS SETTINGS --
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("pkill -x || hyprsunset"))
hl.bind(secondMod .. "+ W", hl.dsp.exec_cmd("pkill -x rofi || ~/.config/hypr/scripts/walchange-rofi.sh"))
hl.bind(mainMod .. "+ X", hl.dsp.exec_cmd("pkill -x wlogout || wlogout"))
hl.bind(secondMod .. "+ S ", hl.dsp.exec_cmd("pkill -x rofi || cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind(secondMod .. "+R", hl.dsp.exec_cmd("~/.config/hypr/scripts/wbrestart.sh"))


-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move/resize windows with mainMod + vim motions
hl.bind(secondMod .. " + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(secondMod .. " + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(secondMod .. " + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(secondMod .. " + down", hl.dsp.window.move({ direction = "down" }))

hl.bind(secondMod .. " + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(secondMod .. " + J", hl.dsp.window.move({ direction = "down" }))

hl.bind(secondMod .. " + H", hl.dsp.layout("swapcol l"))
hl.bind(secondMod .. " + L", hl.dsp.layout("swapcol r"))

hl.bind(mainMod .. " + F", hl.dsp.layout("colresize +conf"))

hl.bind(secondMod .. " + equal", hl.dsp.layout("colresize +0.2"))
hl.bind(secondMod .. " + minus", hl.dsp.layout("colresize -0.2"))

-- audio and brightness keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -n20 set 5%-"))

-- Waybar theme switcher --
hl.bind(secondMod .. "+B", hl.dsp.exec_cmd("~/.config/hypr/scripts/waybar-switch.sh"))

hl.bind("SUPER + tab", function ()
    local layouts   = { "scrolling", "dwindle", "master" }
    local workspace = hl.get_active_workspace()
    if hl.get_active_special_workspace() then
        workspace = hl.get_active_special_workspace()
    end

    local next_layout = "dwindle"

    if not workspace then
        return
    end

    for i = 1, #layouts do
        if layouts[i] == workspace.tiled_layout then
            local next_layout_idx = (i % #layouts) + 1
            next_layout = layouts[next_layout_idx]
            break
        end
    end

    if workspace.special then
        hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
    else
        hl.workspace_rule({ workspace = "name:" .. tostring(workspace.name), layout = next_layout })
    end
end)


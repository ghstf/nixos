-- Monitor
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

-- Look and feel
hl.config({
    general = {
        gaps_out = 10,
        gaps_in  = 5,
    },

    misc = {
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
        background_color         = 0xff191724,
    },
})

-- Keybinds
local mod = "SUPER"

hl.bind(mod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mod .. " + Q",         hl.dsp.window.close())

hl.bind(mod .. " + Return",    hl.dsp.exec_cmd("ghostty"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("grim - | wl-copy"))
hl.bind(mod .. " + SPACE",     hl.dsp.exec_cmd("fuzzel"))
hl.bind(mod .. " + period",    hl.dsp.exec_cmd("rofimoji --action clipboard"))
hl.bind(mod .. " + T",         hl.dsp.exec_cmd("mpv --mute=yes 'http://api.toonamiaftermath.com:3000/est/playlist.m3u8'"))

for i = 1, 5 do
    hl.bind(mod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

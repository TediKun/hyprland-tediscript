-- MEDIA KEYS

local home = os.getenv("HOME")
local scrDir = home .. "/.config/hypr/scripts"
local monitor = hl.get_active_monitor()
local osdclient = "swayosd-client --monitor " .. ((monitor and monitor.name) or "eDP-1")

-- Volume and LCD brightness (with OSD)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(osdclient .. " --output-volume raise"), {
    repeating = true, locked = true, description = "Tambah volume",
})
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(osdclient .. " --output-volume lower"), {
    repeating = true, locked = true, description = "Kurangi volume",
})
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(osdclient .. " --output-volume mute-toggle"), {
    repeating = true, locked = true, description = "Bisukan suara",
})
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(osdclient .. " --input-volume mute-toggle"), {
    repeating = true, locked = true, description = "Bisukan mikrofon",
})
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(osdclient .. " --brightness raise"), {
    repeating = true, locked = true, description = "Tambah kecerahan layar",
})
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(osdclient .. " --brightness lower"), {
    repeating = true, locked = true, description = "Kurangi kecerahan layar",
})

-- Precise 1% multimedia adjustments with Alt modifier
hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(osdclient .. " --output-volume +1"), {
    repeating = true, locked = true, description = "Volume +1%",
})
hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd(osdclient .. " --output-volume -1"), {
    repeating = true, locked = true, description = "Volume -1%",
})
hl.bind("ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd(osdclient .. " --brightness +1"), {
    repeating = true, locked = true, description = "Kecerahan +1%",
})
hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd(osdclient .. " --brightness -1"), {
    repeating = true, locked = true, description = "Kecerahan -1%",
})

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(osdclient .. " --playerctl next"), {
    locked = true, description = "Lagu berikutnya",
})
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(osdclient .. " --playerctl play-pause"), {
    locked = true, description = "Jeda",
})
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(osdclient .. " --playerctl play-pause"), {
    locked = true, description = "Putar",
})
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(osdclient .. " --playerctl previous"), {
    locked = true, description = "Lagu sebelumnya",
})

-- Switch audio output with Super + Mute
hl.bind("SUPER + XF86AudioMute", hl.dsp.exec_cmd(scrDir .. "/audio-switch"), {
    locked = true, description = "Ganti keluaran audio",
})

-- mpc
hl.bind("SUPER + F9", hl.dsp.exec_cmd("mpc pause"), { description = "MPD: jeda" })
hl.bind("SUPER + F10", hl.dsp.exec_cmd("mpc prev"), { description = "MPD: lagu sebelumnya" })
hl.bind("SUPER + F11", hl.dsp.exec_cmd("mpc play"), { description = "MPD: putar" })
hl.bind("SUPER + F12", hl.dsp.exec_cmd("mpc next"), { description = "MPD: lagu berikutnya" })

-- WINDOW RULES
-- Migrated from Hyprland 0.53+ / 0.54 rule syntax to the Lua rule API.

-- Fix some dragging issues with XWayland
hl.window_rule({
    name = "fix-xwayland-drags",
    match = { class = "^$", title = "^$", xwayland = true, float = false, fullscreen = false, pin = false },
    no_focus = true,
})

-- Prevent apps from auto-maximizing themselves
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- 97% opacity when focused, 90% when unfocused
hl.window_rule({ match = { class = ".*" }, opacity = "0.97 0.9" })

-- No animation for the selection layer
hl.layer_rule({ match = { namespace = "selection" }, no_anim = true })

-- Floating windows
hl.window_rule({ match = { tag = "floating-window" }, float = true })
hl.window_rule({ match = { tag = "floating-window" }, center = true })
hl.window_rule({ match = { tag = "floating-window" }, size = { 610, 500 } })

hl.window_rule({ match = { class = "(blueman-manager|localsend|Wiremix|nmgui)" }, tag = "+floating-window" })
hl.window_rule({ match = { title = "^(.*Network Manager.*)$" }, tag = "+floating-window" })
hl.window_rule({ match = { title = "(webapp-install|share)" }, tag = "+floating-window" })
hl.window_rule({
    match = {
        class = "(xdg-desktop-portal-gtk)",
        title = "^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)",
    },
    tag = "+floating-window",
})

-- Symphony TUI
hl.window_rule({ match = { title = "symphony-tui" }, float = true, center = true, size = { 720, 580 } })

-- Symphony Browse (larger for preview)
hl.window_rule({ match = { title = "symphony-browse" }, float = true, center = true, size = { 1200, 750 } })

-- EasyEffects (music equalizer)
hl.window_rule({
    match = { class = "com.github.wwmm.easyeffects" },
    float = true,
    center = true,
    size = { 950, 850 },
})

-- Nmap Floating Window Rule (Task 3)
hl.window_rule({
    match = { class = "floating_nmap" },
    float = true,
    center = true,
    size = { 800, 600 },
})

-- Cyber Toolkit Floating Window Rule
hl.window_rule({
    match = { class = "floating_pentest" },
    float = true,
    center = true,
    size = { 850, 550 },
})

-- Steam
hl.window_rule({ match = { class = "steam" }, float = true })
hl.window_rule({ match = { class = "steam" }, opacity = "1 1" })
hl.window_rule({ match = { class = "steam" }, idle_inhibit = "fullscreen" })
hl.window_rule({ match = { class = "steam", title = "Steam" }, center = true, size = { 1100, 700 } })
hl.window_rule({ match = { class = "steam", title = "Friends List" }, size = { 460, 800 } })

-- Screensaver
hl.window_rule({ match = { class = "Screensaver" }, fullscreen = true, float = true, center = true })

-- Hide Bitwarden from screen share
hl.window_rule({ match = { class = "^(Bitwarden)$" }, no_screen_share = true })

-- Browser types
hl.window_rule({
    match = { class = "((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)" },
    tag = "+chromium-based-browser",
})
hl.window_rule({ match = { class = "([fF]irefox|zen|librewolf)" }, tag = "+firefox-based-browser" })

-- Force chromium-based browsers into a tile to deal with --app bug
hl.window_rule({ match = { tag = "chromium-based-browser" }, tile = true })

-- Only a subtle opacity change, but not for video sites
hl.window_rule({ match = { tag = "chromium-based-browser" }, opacity = "1 0.97" })
hl.window_rule({ match = { tag = "firefox-based-browser" }, opacity = "1 0.97" })

-- Some video sites should never have opacity applied
hl.window_rule({
    match = { initial_title = [[((?i)(?:[a-z0-9-]+\.)*youtube\.com_/|app\.zoom\.us_/wc/home)]] },
    opacity = "1.0 1.0",
})

-- Webcam overlay for screen recording
hl.window_rule({
    match = { title = "WebcamOverlay" },
    float = true,
    pin = true,
    no_initial_focus = true,
    no_dim = true,
    move = { "100%-w-40", "100%-w-40" },
})

-- Picture-in-picture overlays
hl.window_rule({ match = { title = "(Picture.?in.?[Pp]icture)" }, tag = "+pip" })
hl.window_rule({ match = { tag = "pip" }, float = true })
hl.window_rule({ match = { tag = "pip" }, pin = true })
hl.window_rule({ match = { tag = "pip" }, size = { 600, 338 } })
hl.window_rule({ match = { tag = "pip" }, keep_aspect_ratio = true })
hl.window_rule({ match = { tag = "pip" }, border_size = 0 })
hl.window_rule({ match = { tag = "pip" }, opacity = "1 1" })
hl.window_rule({ match = { tag = "pip" }, move = { "100%-w-40", "4%" } })

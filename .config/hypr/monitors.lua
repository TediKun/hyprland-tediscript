-- MONITORS
-- Laptop panel (1366x768 @ 60Hz)
hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1 })

-- External monitor (enable if HDMI is connected)
-- hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@100", position = "auto", scale = 1 })

-- Laptop screen toggle (replaces the removed `hyprctl keyword monitor`)
hl.bind("SUPER + ALT + H", function()
    hl.monitor({ output = "eDP-1", disabled = true })
end, { description = "Matikan layar laptop" })

hl.bind("SUPER + ALT + l", function()
    hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1 })
end, { description = "Nyalakan layar laptop" })

-- WORKSPACE → APP ASSIGNMENT
hl.window_rule({ match = { class = "(dev.zed.Zed)" }, workspace = "2" })
hl.window_rule({ match = { class = "^(brave-perplexity.ai__-Default)$" }, workspace = "3" })
hl.window_rule({ match = { class = "^(brave-web.whatsapp.com__-Default)$" }, workspace = "5" })
hl.window_rule({ match = { class = "(org.telegram.desktop)" }, workspace = "6" })
hl.window_rule({ match = { class = "^(brave-app.todoist.com__-Default)$" }, workspace = "7" })
hl.window_rule({ match = { class = "(obsidian)" }, workspace = "8" })
hl.window_rule({ match = { class = "(spotify)" }, workspace = "9" })
hl.window_rule({ match = { class = "(vesktop)" }, workspace = "10" })

-- Isolation Workspaces for RE & Mobile (Task 4.2)
hl.window_rule({ match = { class = "([Ww]aydroid.*)" }, workspace = "11" })
hl.window_rule({ match = { class = "(jadx.*|[Jj]adx.*)" }, workspace = "12" })

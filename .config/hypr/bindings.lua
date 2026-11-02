-- KEYBINDINGS

local home = os.getenv("HOME")

-- Applications
local terminal = "kitty"
local browser = home .. "/.config/hypr/scripts/launch-browser"
local webapp = home .. "/.config/hypr/scripts/launch-webapp"
local focus = home .. "/.config/hypr/scripts/focus"

-- Directories
local rofiDir = home .. "/.config/rofi/scripts"
local scrDir = home .. "/.config/hypr/scripts"
local symphony = home .. "/dotfiles/install/themes/symphony"

-- Current monitor for the OSD
local monitor = hl.get_active_monitor()
local osdclient = "swayosd-client --monitor " .. ((monitor and monitor.name) or "eDP-1")

-- APPS
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("uwsm-app -- " .. terminal .. ' -d "$(' .. scrDir .. '/cwd-terminal)"'), {
    description = "Terminal",
})
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser), { description = "Peramban web" })
hl.bind("SUPER + E", hl.dsp.exec_cmd("uwsm app -- nautilus --new-window"), { description = "Manajer berkas" })
hl.bind("SUPER + M", hl.dsp.exec_cmd(focus .. " spotify-launcher"), { description = "Musik (Spotify)" })
hl.bind("SUPER + D", hl.dsp.exec_cmd("uwsm app -- vesktop"), { description = "Discord" })
hl.bind("SUPER + O", hl.dsp.exec_cmd("obsidian"), { description = "Obsidian" })
hl.bind("SUPER + slash", hl.dsp.exec_cmd("uwsm app -- bitwarden-desktop"), { description = "Manajer kata sandi" })
hl.bind("SUPER + C", hl.dsp.exec_cmd("uwsm app -- zeditor"), { description = "Zed (editor)" })
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd(terminal .. " -e lazydocker"), { description = "Docker (lazydocker)" })
hl.bind("ALT + slash", hl.dsp.exec_cmd(terminal .. " -e btop"), { description = "Aktivitas sistem (btop)" })
hl.bind("ALT + M", hl.dsp.exec_cmd(terminal .. " -e rmpc"), { description = "Pemutar musik (rmpc)" })
hl.bind("ALT + Q", hl.dsp.exec_cmd(terminal .. " -e yazi"), { description = "Yazi (manajer berkas)" })
hl.bind("ALT + N", hl.dsp.exec_cmd(terminal .. " -e nvim"), { description = "Neovim (editor teks)" })
hl.bind("SUPER + S", hl.dsp.exec_cmd(terminal .. " --class=Wiremix -e wiremix"), { description = "Pengatur audio (wiremix)" })
hl.bind("SUPER + ALT + M", hl.dsp.exec_cmd("easyeffects"), { description = "EasyEffects (equalizer)" })

-- WEB APPS
hl.bind("SUPER + A", hl.dsp.exec_cmd(webapp .. ' "https://perplexity.ai"'), { description = "Perplexity" })
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd(webapp .. ' "https://chatgpt.com"'), { description = "ChatGPT" })
hl.bind("SUPER + CTRL + A", hl.dsp.exec_cmd(webapp .. ' "https://gemini.google.com"'), { description = "Gemini" })
hl.bind("ALT + C", hl.dsp.exec_cmd(webapp .. ' "https://calendar.google.com"'), { description = "Kalender" })
hl.bind("SUPER + G", hl.dsp.exec_cmd(webapp .. ' "https://github.com/vyrx-dev"'), { description = "GitHub" })
hl.bind("SUPER + SHIFT + G", hl.dsp.exec_cmd(webapp .. ' "https://mail.google.com/mail/u/1/"'), { description = "Gmail" })
hl.bind("SUPER + Y", hl.dsp.exec_cmd(webapp .. ' "https://youtube.com/"'), { description = "YouTube" })
hl.bind("SUPER + W", hl.dsp.exec_cmd(webapp .. ' "https://web.whatsapp.com/"'), { description = "WhatsApp" })
hl.bind("SUPER + X", hl.dsp.exec_cmd(webapp .. ' "https://x.com/"'), { description = "X (Twitter)" })
hl.bind("SUPER + Z", hl.dsp.exec_cmd(webapp .. ' "https://www.linkedin.com/feed/"'), { description = "LinkedIn" })
hl.bind("SUPER + T", hl.dsp.exec_cmd(webapp .. ' "https://app.todoist.com"'), { description = "Todoist" })
hl.bind("SUPER + BACKSLASH", hl.dsp.exec_cmd(webapp .. ' "https://devhints.io/"'), { description = "Referensi cepat (devhints)" })

-- TMUX
hl.bind("SUPER + SHIFT + Return", hl.dsp.exec_cmd(terminal .. " -e tmux a"), { description = "Lanjutkan sesi tmux" })
hl.bind("SUPER + ALT + Return", hl.dsp.exec_cmd(terminal .. " -e tmux new -As main"), { description = "Sesi tmux baru" })

-- MISC
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd(rofiDir .. "/wifi"), { description = "Menu WiFi" })
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"), { description = "Pusat notifikasi" })
hl.bind("SUPER + SHIFT + I", hl.dsp.exec_cmd(terminal .. " --title webapp-install -e " .. scrDir .. "/webapp-install"), {
    description = "Pasang web app",
})

-- Close window
hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Tutup jendela" })

-- ROFI
hl.bind("ALT + comma", hl.dsp.exec_cmd(rofiDir .. "/clipboard"), { description = "Riwayat papan klip" })
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd(rofiDir .. "/rofibeats"), { description = "Pemutar musik (rofi)" })
hl.bind("ALT + period", hl.dsp.exec_cmd(rofiDir .. "/emoji"), { description = "Pilih emoji" })
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(rofiDir .. "/rofisearch"), { description = "Cari berkas" })
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("pkill rofi || rofi -show drun"), { description = "Peluncur aplikasi" })

-- WINDOWS
hl.bind("SUPER + SHIFT + O", hl.dsp.exec_cmd(scrDir .. "/pop-window"), { description = "Keluarkan jendela (melayang & disematkan)" })
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.exec_cmd(scrDir .. "/toggle-waybar"), { description = "Tampilkan/sembunyikan waybar" })
hl.bind("SUPER + CTRL + N", hl.dsp.exec_cmd(scrDir .. "/nightlight"), { description = "Filter cahaya malam" })
hl.bind("SUPER + CTRL + I", hl.dsp.exec_cmd(scrDir .. "/toggle-idle"), { description = "Aktif/nonaktifkan idle & kunci" })

-- LOCALSEND
hl.bind("SUPER + ALT + S", hl.dsp.exec_cmd(terminal .. " --title share -e " .. scrDir .. "/fileshare file"), { description = "Kirim berkas (LocalSend)" })
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd(terminal .. " --title share -e " .. scrDir .. "/fileshare folder"), { description = "Kirim folder (LocalSend)" })
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(terminal .. " --title share -e " .. scrDir .. "/fileshare clipboard"), { description = "Kirim papan klip (LocalSend)" })

-- THEMES
hl.bind("SUPER + CTRL + SPACE", hl.dsp.exec_cmd(rofiDir .. "/selectWall"), { description = "Terapkan tema dari wallpaper (matugen)" })
hl.bind("SUPER + ALT + SPACE", hl.dsp.exec_cmd(rofiDir .. "/wallPicker"), { description = "Pilih wallpaper" })
hl.bind("CTRL + ALT + SPACE", hl.dsp.exec_cmd(scrDir .. "/change-theme"), { description = "Pilih wallpaper (awww)" })
hl.bind("SUPER + CTRL + SHIFT + SPACE", hl.dsp.exec_cmd(symphony .. " switch"), { description = "Ganti tema Symphony" })
hl.bind("SUPER + CTRL + SHIFT + BACKSPACE", hl.dsp.exec_cmd(symphony .. " switch --random"), { description = "Ganti tema Symphony (acak)" })
hl.bind("SUPER + I", hl.dsp.exec_cmd(terminal .. " --title symphony-tui -e " .. symphony .. "-tui"), {
    description = "Symphony TUI",
})
hl.bind("SUPER + ALT + I", hl.dsp.exec_cmd(terminal .. " --title symphony-browse -e " .. symphony .. " browse"), {
    description = "Jelajahi tema Symphony",
})

-- Current theme wallpaper cycling
hl.bind("SUPER + ALT + up", hl.dsp.exec_cmd(scrDir .. "/cycle-wallpaper"), { description = "Wallpaper tema aktif" })
hl.bind("SUPER + ALT + right", hl.dsp.exec_cmd(scrDir .. "/cycle-wallpaper next"), { description = "Wallpaper berikutnya" })
hl.bind("SUPER + ALT + left", hl.dsp.exec_cmd(scrDir .. "/cycle-wallpaper prev"), { description = "Wallpaper sebelumnya" })

-- POWER
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd(scrDir .. "/lock-screen"), { description = "Kunci layar" })
hl.bind("SUPER + CTRL + up", hl.dsp.exec_cmd(scrDir .. "/graceful-reboot"), { description = "Mulai ulang komputer" })
hl.bind("SUPER + BACKSPACE", hl.dsp.exec_cmd(scrDir .. "/toggle-terminal-transparency"), {
    description = "Transparansi terminal",
})
hl.bind("SUPER + CTRL + BACKSPACE", hl.dsp.exec_cmd(scrDir .. "/toggle-focus"), {
    description = "Mode fokus & vibe on/off",
})
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd(rofiDir .. "/powermenu"), { description = "Menu daya" })
hl.bind("XF86PowerOff", hl.dsp.exec_cmd(rofiDir .. "/powermenu"), { locked = true, description = "Menu daya" })

-- KILL
hl.bind("SUPER + SHIFT + K", hl.dsp.exec_cmd("hyprctl kill"), { description = "Hentikan aplikasi (mode klik)" })
hl.bind("SUPER + ALT + K", hl.dsp.exec_cmd(rofiDir .. "/keyhints"), { description = "Daftar semua keybind" })

-- SCREENSHOTS
hl.bind("SUPER + P", hl.dsp.exec_cmd(scrDir .. "/screenshot"), { description = "Tangkapan layar + editor" })
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd(scrDir .. "/screenshot smart clipboard"), {
    description = "Tangkapan layar ke papan klip",
})

-- SCREEN RECORDINGS
hl.bind("SUPER + R", hl.dsp.exec_cmd(scrDir .. "/screenrecord --with-desktop-audio"), { description = "Rekam layar" })
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd(scrDir .. "/screenrecord --with-microphone-audio"), {
    description = "Rekam layar + mikrofon",
})
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd(scrDir .. "/screenrecord --with-desktop-audio --with-microphone-audio --with-webcam"), {
    description = "Rekam layar + mikrofon + webcam",
})

-- COLOR PICKER
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"), { description = "Ambil warna di layar" })

-- LAPTOP BRIGHTNESS (keyboard knob)
hl.bind("SUPER + ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(osdclient .. " --brightness raise"), {
    description = "Tambah kecerahan layar",
})
hl.bind("SUPER + ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd(osdclient .. " --brightness lower"), {
    description = "Kurangi kecerahan layar",
})

-- EXTERNAL MONITOR (ddcutil)
hl.bind("SUPER + XF86AudioRaiseVolume", hl.dsp.exec_cmd("ddcutil setvcp 10 + 10"), {
    description = "Kecerahan monitor eksternal +",
})
hl.bind("SUPER + XF86AudioLowerVolume", hl.dsp.exec_cmd("ddcutil setvcp 10 - 10"), {
    description = "Kecerahan monitor eksternal -",
})
hl.bind("SUPER + F1", hl.dsp.exec_cmd(scrDir .. "/toggle-monitor"), { description = "Nyalakan/matikan monitor" })

hl.bind("SUPER + U", hl.dsp.exec_cmd("/home/tediscript/.config/waybar/scripts/waybar-style"), { description = "Ganti tampilan Waybar" })

-- NMAP INTERACTIVE SCANNER (Task 3)
hl.bind("SUPER + CTRL + M", hl.dsp.exec_cmd(terminal .. " --class floating_nmap -e /home/tediscript/scripts/nmap_prompt.sh"), {
    description = "Nmap Interactive Scanner (floating)",
})

-- CYBER SECURITY & PRODUCTIVITY TOOLKIT
hl.bind("SUPER + CTRL + T", hl.dsp.exec_cmd("/home/tediscript/scripts/cyber_toolkit.sh"), {
    description = "Cyber Security Toolkit Menu (Netcat/HTTP/IP/Docker)",
})
hl.bind("SUPER + CTRL + C", hl.dsp.exec_cmd("/home/tediscript/scripts/cheatsheet_menu.sh"), {
    description = "Cheatsheet & Reverse Shell Menu (Quick Copy)",
})
hl.bind("SUPER + CTRL + O", hl.dsp.exec_cmd("/home/tediscript/scripts/ocr_grab.sh"), {
    description = "OCR Layar (Ambil teks dari seleksi layar ke clipboard)",
})
hl.bind("F12", hl.dsp.workspace.toggle_special("scratchpad"), {
    description = "Toggle Dropdown Scratchpad Terminal (F12)",
})

-- ADVANCED POWER TOOLS
hl.bind("SUPER + CTRL + Y", hl.dsp.exec_cmd("/home/tediscript/scripts/target_manager.sh"), {
    description = "Pentest Target Manager (Set & Copy Target IP)",
})
hl.bind("SUPER + CTRL + X", hl.dsp.exec_cmd("/home/tediscript/scripts/pentest_scaffold.sh"), {
    description = "Buat Folder Scaffold Lab / Target Pentest Baru",
})
hl.bind("SUPER + CTRL + Z", hl.dsp.exec_cmd("/home/tediscript/scripts/project_launcher.sh"), {
    description = "Project & Repo Launcher Cepat (Zoxide/Recent)",
})
hl.bind("SUPER + ALT + P", hl.dsp.exec_cmd("/home/tediscript/scripts/toggle_pip.sh"), {
    description = "Toggle Picture-in-Picture (Melayang, Dipin di Pojok)",
})

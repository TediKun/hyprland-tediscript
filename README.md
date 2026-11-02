<div align="center">

# ❄️ Arch Hyprland Dotfiles (`tediscript`)

**A modern, aesthetic, highly modular Arch Linux + Hyprland rice customized for workflow, cybersecurity, and coding.**

[![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/Hyprland-00AAEE?style=for-the-badge&logo=hyprland&logoColor=white)](https://hyprland.org/)
[![Waybar](https://img.shields.io/badge/Waybar-Modular-00BF8F?style=for-the-badge)](https://github.com/Alexays/Waybar)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)

</div>

---

## 📌 Credits & Acknowledgements

Konfigurasi ini dikembangkan dan disesuaikan berdasarkan karya luar biasa dari komunitas open-source. Penghargaan dan apresiasi setinggi-tingginya kepada para kreator asli:

* **[Symphony by vyrx-dev](https://github.com/vyrx-dev/symphony)** — Pondasi utama antarmuka tema dinamis, arsitektur konfigurasi Hyprland berbasis Lua (`bindings.lua`, `tiling.lua`, dll.), skrip sistem, dan integrasi UI.
* **[Hyprland-Dots by JaKooLit](https://github.com/JaKooLit/Hyprland-Dots)** — Inspirasi arsitektur modular Waybar, preset tata letak (*configs*), preset gaya visual (*styles*), integrasi cuaca, dan fleksibilitas kontrol bar.
* **[Catppuccin](https://github.com/catppuccin/catppuccin)** — Palet warna pastel yang lembut untuk estetika desktop (Mocha, Macchiato, Frappé, Latte).
* **Komunitas Hyprland & Arch Linux** — Untuk ekosistem Wayland yang cepat, dinamis, dan sangat modular.

---

## 🚀 Fitur Unggulan Setup Ini

- **Lua Configuration for Hyprland**: Menggunakan struktur modular berbasis Lua (`bindings.lua`, `animations.lua`, `input.lua`, `tiling.lua`, `windowsrules.lua`, `monitors.lua`).
- **Modular Waybar Switcher (Style JaKooLit)**:
  - Beralih tata letak bar (*Top, Bottom, Dual/SummitSplit, Minimal, Gardenia, dll.*) secara instan via picker Rofi.
  - Beralih gaya tema Waybar (*Catppuccin Mocha, Translucent, Chroma Glow, Neon, EverForest, dll.*) melalui shortcut `SUPER + U`.
- **Workflow & Productivity**:
  - **Scratchpad Workspace**: Akses cepat window sembunyi menggunakan `SUPER + -` (toggle) atau tombol `F12`, dan `SUPER + SHIFT + -` (kirim window ke scratchpad).
  - **Window Tabbing / Groups**: Satukan beberapa jendela ke dalam satu frame tab via `SUPER + ALT + G` dan navigasi dengan `SUPER + ALT + TAB`.
  - **Security Tools Shortcut**: Pop-up floating terminal Nmap scanner instan (`SUPER + CTRL + M`).
  - **Cyber Toolkit & Cheatsheet**: Menu toolkit cepat (`SUPER + CTRL + T`) dan reverse shell/command cheatsheet (`SUPER + CTRL + C`).
  - **OCR Layar Instan**: Ekstrak teks dari area screenshot langsung ke clipboard (`SUPER + CTRL + O`).
  - **Isolated Workspaces**: Penempatan otomatis aplikasi riset / kerja (Waydroid di WS 11, JADX GUI di WS 12).
  - **Dual Mode**: Dukungan mode *Vibe* (animasi + blur) dan *Focus Mode* (minimalis tanpa animasi) via `SUPER + CTRL + BACKSPACE`.
- **Power & Session Control**:
  - Pop-up Power Menu elegan (`SUPER + ESCAPE` atau tombol fisik power `XF86PowerOff`).
  - Menu layar penuh modern via `wlogout`.
  - Skrip *graceful shutdown* untuk memastikan sesi browser dan aplikasi tersimpan rapi sebelum laptop mati.

---

## 📋 Software Stack

| Komponen | Aplikasi / Tool |
|---|---|
| **Compositor (WM)** | [Hyprland](https://hyprland.org/) (Lua API Configs) |
| **Status Bar** | [Waybar](https://github.com/Alexays/Waybar) (Modular JaKooLit presets & switcher) |
| **Application Launcher** | [Rofi-wayland](https://github.com/lbonn/rofi-wayland) |
| **Terminal Emulator** | [Kitty](https://sw.kovidgoyal.net/kitty/) |
| **Power / Session Menu** | `wlogout` & Rofi Powermenu (`graceful-shutdown`) |
| **Notification Center** | [SwayNC](https://github.com/ErikReider/SwayNotificationCenter) |
| **Clipboard Manager** | `wl-clipboard` + `cliphist` |
| **Shell & Prompt** | Zsh + Oh My Zsh + Powerlevel10k + Fastfetch |
| **Theme & Wallpaper Engine** | `swww` + `matugen` |

---

## 🛠️ Panduan Instalasi (Step-by-Step)

> [!WARNING]
> Sangat disarankan untuk mem-backup konfigurasi lama Anda di `~/.config` sebelum menerapkan dotfiles ini.

### 1. Clone Repository
Clone dotfiles ini ke direktori home:
```bash
git clone https://github.com/TediKun/hyprland-tediscript.git ~/dotfiles
cd ~/dotfiles
```

### 2. Install Dependensi Inti (Arch Linux)
```bash
sudo pacman -S --needed hyprland waybar rofi-wayland kitty swaync wlogout \
wl-clipboard cliphist fastfetch swww jq python zsh
```

### 3. Deploy Konfigurasi ke `~/.config`
Konfigurasi dapat diterapkan dengan symlink langsung:
```bash
# Backup config lama jika ada
mkdir -p ~/.config-backup
mv ~/.config/hypr ~/.config/waybar ~/.config/rofi ~/.config/kitty ~/.config/wlogout ~/.config-backup/ 2>/dev/null

# Hubungkan direktori konfigurasi
ln -sf ~/dotfiles/.config/hypr ~/.config/hypr
ln -sf ~/dotfiles/.config/waybar ~/.config/waybar
ln -sf ~/dotfiles/.config/rofi ~/.config/rofi
ln -sf ~/dotfiles/.config/kitty ~/.config/kitty
ln -sf ~/dotfiles/.config/wlogout ~/.config/wlogout
ln -sf ~/dotfiles/.config/fastfetch ~/.config/fastfetch
```

### 4. Berikan Izin Eksekusi pada Skrip
```bash
chmod +x ~/.config/hypr/scripts/*
chmod +x ~/.config/waybar/scripts/*
chmod +x ~/.config/rofi/scripts/*
chmod +x ~/scripts/* 2>/dev/null
```

---

## ⌨️ Daftar Keybindings Asli Sistem (Sesuai Konfigurasi)

> [!TIP]
> Daftar shortcut interaktif visual dapat dipanggil kapan saja di desktop dengan menekan:  
> **`SUPER + ALT + K`**

### 💻 Aplikasi Utama
| Shortcut | Aksi / Fungsi |
|---|---|
| `SUPER + RETURN` | Buka Terminal (Kitty di direktori aktif) |
| `SUPER + Q` | **Tutup jendela aktif** |
| `SUPER + B` | Peramban Web (Browser) |
| `SUPER + E` | Manajer Berkas (Nautilus) |
| `SUPER + C` | Editor Kode (Zed) |
| `SUPER + M` | Pemutar Musik (Spotify) |
| `SUPER + D` | Komunikasi (Vesktop / Discord) |
| `SUPER + O` | Catatan (Obsidian) |
| `SUPER + /` | Manajer Sandi (Bitwarden) |
| `ALT + Q` | File Manager Terminal (Yazi) |
| `ALT + N` | Editor Teks Terminal (Neovim) |
| `ALT + /` | Pemantau Aktivitas Sistem (Btop) |
| `SUPER + S` | Pengatur Volume / Audio (Wiremix) |

### 🪟 Manajemen Tiling, Window & Workspace
| Shortcut | Aksi / Fungsi |
|---|---|
| `SUPER + F` | Toggle Layar Penuh (Fullscreen) |
| `SUPER + SHIFT + V` | **Toggle Jendela Melayang (Floating)** |
| `SUPER + V` | Mode Pseudotile |
| `ALT + J` | Pisah / Satukan Tiling (Toggle Split) |
| `SUPER + H / J / K / L` | Pindah Fokus Window (Vim Keys: Kiri / Bawah / Atas / Kanan) |
| `SUPER + Arrow Keys` | Pindah Fokus Window (Panah Kiri / Kanan / Atas / Bawah) |
| `SUPER + SHIFT + Arrow Keys` | Tukar Posisi Jendela Aktif |
| `SUPER + 1` s/d `9` | Pindah ke Workspace 1 s/d 9 |
| `SUPER + SHIFT + 1` s/d `9` | Pindahkan jendela ke Workspace 1 s/d 9 |
| `SUPER + TAB` | Kembali ke Workspace sebelumnya |
| `ALT + TAB` | Beralih antar jendela terbuka |
| `SUPER + Drag Klik Kiri (LMB)` | Geser posisi jendela bebas |
| `SUPER + Drag Klik Kanan (RMB)` | Ubah ukuran jendela bebas |
| `SUPER + ALT + SHIFT + Arrow Keys`| Resize ukuran jendela bertahap (40px) |

### 📑 Window Grouping & Scratchpad
| Shortcut | Aksi / Fungsi |
|---|---|
| `SUPER + -` atau `F12` | **Buka / Tutup Scratchpad Terminal** |
| `SUPER + SHIFT + -` | Kirim jendela aktif ke Scratchpad |
| `SUPER + ALT + G` | Gabungkan / Pisahkan jendela ke Group Tab |
| `SUPER + ALT + TAB` | Pindah tab berikutnya dalam group |
| `SUPER + ALT + SHIFT + TAB` | Pindah tab sebelumnya dalam group |

### 🔍 Menu Rofi & Waybar
| Shortcut | Aksi / Fungsi |
|---|---|
| `SUPER + SPACE` | **Peluncur Aplikasi (Rofi drun)** |
| `ALT + ,` *(koma)* | **Riwayat Papan Klip (Clipboard History)** |
| `ALT + .` *(titik)* | Pemilih Emoji |
| `ALT + SPACE` | Pencari Berkas Cepat |
| `SUPER + N` | Buka Pusat Notifikasi (SwayNC) |
| `SUPER + SHIFT + N` | Menu WiFi |
| `SUPER + SHIFT + SPACE` | Sembunyikan / Tampilkan Waybar |
| `SUPER + U` | **Waybar Switcher (Ganti Layout & Style JaKooLit)** |

### 🎨 Tema & Tampilan
| Shortcut | Aksi / Fungsi |
|---|---|
| `SUPER + ALT + SPACE` | Pemilih Wallpaper Interaktif (Rofi) |
| `SUPER + CTRL + SPACE` | Generate Palet Warna Tema dari Wallpaper (Matugen) |
| `SUPER + ALT + Up` | Ganti varian wallpaper tema aktif |
| `SUPER + ALT + Right / Left` | Ganti wallpaper berikutnya / sebelumnya |
| `SUPER + BACKSPACE` | Toggle Transparansi Terminal |
| `SUPER + CTRL + BACKSPACE` | **Toggle Focus Mode (On/Off Animasi & Blur)** |

### ⚡ Daya & Keamanan
| Shortcut | Aksi / Fungsi |
|---|---|
| `SUPER + ESCAPE` | **Menu Daya (Shutdown, Reboot, Suspend, Logout)** |
| `XF86PowerOff` | Tombol Fisik Power $\rightarrow$ Menu Daya |
| `SUPER + SHIFT + L` | Kunci Layar (Lock Screen) |
| `SUPER + CTRL + Up` | Mulai ulang komputer (Graceful Reboot) |
| `SUPER + SHIFT + K` | Force Kill Aplikasi (Klik jendela target) |
| `SUPER + ALT + K` | **Tampilkan Contekan Keybind (Keyhints)** |

### 🛠️ Cyber Security & Productivity Toolkit
| Shortcut | Aksi / Fungsi |
|---|---|
| `SUPER + CTRL + M` | **Nmap Interactive Scanner (Floating Window)** |
| `SUPER + CTRL + T` | Cyber Security Toolkit Menu (Netcat/HTTP/IP/Docker) |
| `SUPER + CTRL + C` | Reverse Shell & Cheatsheet Quick Copy |
| `SUPER + CTRL + O` | OCR Layar (Ambil teks dari seleksi layar ke clipboard) |
| `SUPER + CTRL + Y` | Pentest Target Manager (Set & Copy Target IP) |
| `SUPER + CTRL + X` | Scaffold Folder Lab / Target Pentest Baru |
| `SUPER + ALT + P` | Toggle Mode Picture-in-Picture (PiP Pin) |

---


Ini adalah backup konfigurasi dari ArchLinux Hyprland Aku, ### Miaw Miaw Miaw

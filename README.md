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

* **[Symphony by vyrx-dev](https://github.com/vyrx-dev/symphony)** — Desain fondasi antarmuka, arsitektur tema dinamis (`symphony`), skrip utilitas sistem, dan sistem konfigurasi berbasis Lua untuk Hyprland.
* **[Hyprland-Dots by JaKooLit](https://github.com/JaKooLit/Hyprland-Dots)** — Inspirasi arsitektur modular Waybar, preset tata letak (*configs*), preset gaya visual (*styles*), integrasi cuaca, dan gaya kontrol bar yang fleksibel.
* **[Catppuccin](https://github.com/catppuccin/catppuccin)** — Palet warna pastel yang lembut untuk estetika desktop (Mocha, Macchiato, Frappé, Latte).
* **Komunitas Hyprland & Arch Linux** — Untuk ekosistem Wayland yang cepat, dinamis, dan sangat modular.

---

## 🚀 Fitur Unggulan Setup Ini

- **Lua Configuration for Hyprland**: Menggunakan struktur modular berbasis Lua (`bindings.lua`, `animations.lua`, `input.lua`, `windowsrules.lua`, `monitors.lua`).
- **Modular Waybar Switcher (Style JaKooLit)**:
  - Beralih tata letak bar (*Top, Bottom, Dual/SummitSplit, Minimal, Gardenia, dll.*) secara instan.
  - Beralih gaya tema Waybar (*Catppuccin Mocha, Translucent, Chroma Glow, Neon, EverForest, dll.*) via Rofi picker (`Super + U`).
- **Workflow & Productivity**:
  - **Scratchpad Workspace**: Akses cepat window sembunyi menggunakan `Super + -` dan `Super + Shift + -`.
  - **Security Tools Shortcut**: Pop-up floating terminal Nmap scanner instan (`Super + Ctrl + N`).
  - **Isolated Workspaces**: Penempatan otomatis aplikasi riset / kerja (Waydroid di WS 11, JADX GUI di WS 12).
  - **Dual Mode**: Dukungan mode *Vibe* (animasi + blur) dan *Focus Mode* (minimalis tanpa animasi).
- **Power & Session Control**:
  - Pop-up Power Menu elegan (`Super + Escape`).
  - Menu layar penuh modern via `wlogout`.
  - Skrip *graceful shutdown* untuk memastikan sesi browser dan aplikasi tersimpan rapi sebelum laptop mati.
- **Rofi Applets & Menus**: App launcher, Clipboard history (`cliphist`), Emoji picker, Theme selector, Wallpaper changer, dan Keyhints helper (`Super + Alt + K`).

---

## 📋 Software Stack

| Komponen | Aplikasi / Tool |
|---|---|
| **Compositor (WM)** | [Hyprland](https://hyprland.org/) |
| **Status Bar** | [Waybar](https://github.com/Alexays/Waybar) (Modular JaKooLit presets) |
| **Application Launcher** | [Rofi-wayland](https://github.com/lbonn/rofi-wayland) |
| **Terminal Emulator** | [Kitty](https://sw.kovidgoyal.net/kitty/) |
| **Power / Session Menu** | `wlogout` & Rofi Powermenu |
| **Notification Daemon** | [SwayNC](https://github.com/ErikReider/SwayNotificationCenter) |
| **Clipboard Manager** | `wl-clipboard` + `cliphist` |
| **Shell & Prompt** | Zsh + Oh My Zsh + Powerlevel10k + Fastfetch |
| **Theme & Wallpaper Engine** | `swww` + `matugen` |

---

## 🛠️ Panduan Instalasi (Step-by-Step)

> [!WARNING]
> Sangat disarankan untuk melakukan backup konfigurasi lama Anda di `~/.config` sebelum menerapkan dotfiles ini.

### 1. Clone Repository
Clone dotfiles ini ke direktori home Anda:
```bash
git clone https://github.com/TediKun/hyprland-tediscript.git ~/dotfiles
cd ~/dotfiles
```

### 2. Install Dependensi Inti
Jika Anda menggunakan Arch Linux, pastikan paket-paket penting telah terpasang:
```bash
sudo pacman -S --needed hyprland waybar rofi-wayland kitty swaync wlogout \
wl-clipboard cliphist fastfetch swww jq python
```

### 3. Deploy Konfigurasi (GNU Stow / Symlink)
Dotfiles ini diatur agar kompatibel menggunakan GNU Stow atau membuat symlink langsung ke `~/.config`:

#### Opsi A: Menggunakan Skrip Installer Bawaan
```bash
chmod +x install.sh
./install.sh
```

#### Opsi B: Symlink Manual
```bash
# Backup config lama jika ada
mkdir -p ~/.config-backup
mv ~/.config/hypr ~/.config/waybar ~/.config/rofi ~/.config/kitty ~/.config/wlogout ~/.config-backup/ 2>/dev/null

# Hubungkan konfigurasi ke direktori home
ln -sf ~/dotfiles/.config/hypr ~/.config/hypr
ln -sf ~/dotfiles/.config/waybar ~/.config/waybar
ln -sf ~/dotfiles/.config/rofi ~/.config/rofi
ln -sf ~/dotfiles/.config/kitty ~/.config/kitty
ln -sf ~/dotfiles/.config/wlogout ~/.config/wlogout
ln -sf ~/dotfiles/.config/fastfetch ~/.config/fastfetch
```

### 4. Berikan Hak Akses Eksekusi pada Skrip
Pastikan semua skrip pendukung dapat dieksekusi:
```bash
chmod +x ~/.config/hypr/scripts/*
chmod +x ~/.config/waybar/scripts/*
chmod +x ~/.config/rofi/scripts/*
```

---

## ⌨️ Shortcut / Keybindings Utama

Daftar shortcut lengkap dapat dibuka langsung di layar desktop kapan saja dengan menekan:  
👉 **`SUPER + ALT + K`**

### 💻 Manajemen Jendela & Sistem
| Shortcut | Aksi |
|---|---|
| `SUPER + Q` | Membuka Terminal (Kitty) |
| `SUPER + C` | Menutup jendela aktif |
| `SUPER + E` | Membuka File Manager |
| `SUPER + SPACE` | Membuka Application Launcher (Rofi) |
| `SUPER + V` | Membuka Riwayat Clipboard |
| `SUPER + F` | Toggle Fullscreen |
| `SUPER + SHIFT + SPACE` | Toggle Floating Window |
| `SUPER + ESCAPE` | Membuka Menu Matikan/Restart Laptop (Powermenu) |

### 🎨 Tampilan & Kustomisasi
| Shortcut | Aksi |
|---|---|
| `SUPER + U` | **Waybar Style & Layout Switcher** (Pilih layout JaKooLit / tema warna) |
| `SUPER + W` | Ganti Wallpaper Acak |
| `SUPER + ALT + W` | Pemilih Wallpaper Interaktif (Rofi) |
| `SUPER + T` | Pemilih Tema Desktop |
| `SUPER + CTRL + BACKSPACE` | Toggle Focus Mode (On/Off Animasi & Transparansi) |

### 🛠️ Workspace & Utility Tambahan
| Shortcut | Aksi |
|---|---|
| `SUPER + -` | Buka/Tutup Scratchpad (Special Workspace) |
| `SUPER + SHIFT + -` | Pindahkan jendela aktif ke Scratchpad |
| `SUPER + CTRL + N` | Nmap Scanner Interaktif (Floating window) |
| `SUPER + P` | Screenshot Tool dengan editor area |
| `SUPER + 1 - 9` | Pindah ke Workspace 1 s/d 9 |

---

## 📄 Lisensi
Konfigurasi ini dilisensikan di bawah lisensi **MIT License** — silakan gunakan, pelajari, dan modifikasi sesuai preferensi alur kerja Anda dengan tetap menyertakan atribusi ke pembuat awal.

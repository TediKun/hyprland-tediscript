-- TILING

hl.bind("SUPER + F", hl.dsp.window.fullscreen(), { description = "Layar penuh" })

hl.config({
    dwindle = {
        -- `pseudotile` was removed in the Lua API; pseudo is now a dispatcher.
        preserve_split = true,
    },
})

-- Switch workspaces with SUPER + [0-9]
for i = 1, 10 do
    hl.bind("SUPER + code:" .. (9 + i), hl.dsp.focus({ workspace = i }), {
        description = "Pindah ke workspace " .. i,
    })
    hl.bind("SUPER + SHIFT + code:" .. (9 + i), hl.dsp.window.move({ workspace = i }), {
        description = "Pindahkan jendela ke workspace " .. i,
    })
end

-- Cycle to next window and reveal it on top
hl.bind("ALT + TAB", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end, { description = "Pindah ke jendela berikutnya" })

hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "previous" }), {
    description = "Kembali ke workspace sebelumnya",
})

-- Swap active window with the one next to it
hl.bind("SUPER + SHIFT + LEFT", hl.dsp.window.swap({ direction = "left" }), { description = "Tukar dengan jendela kiri" })
hl.bind("SUPER + SHIFT + RIGHT", hl.dsp.window.swap({ direction = "right" }), { description = "Tukar dengan jendela kanan" })
hl.bind("SUPER + SHIFT + UP", hl.dsp.window.swap({ direction = "up" }), { description = "Tukar jendela ke atas" })
hl.bind("SUPER + SHIFT + DOWN", hl.dsp.window.swap({ direction = "down" }), { description = "Tukar jendela ke bawah" })

-- Move focus with SUPER + arrow keys
hl.bind("SUPER + LEFT", hl.dsp.focus({ direction = "left" }), { description = "Fokus ke jendela kiri" })
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "right" }), { description = "Fokus ke jendela kanan" })
hl.bind("SUPER + UP", hl.dsp.focus({ direction = "up" }), { description = "Fokus ke jendela atas" })
hl.bind("SUPER + DOWN", hl.dsp.focus({ direction = "down" }), { description = "Fokus ke jendela bawah" })

-- Move focus with SUPER + Vim keys
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }), { description = "Fokus ke jendela kiri" })
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }), { description = "Fokus ke jendela kanan" })
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }), { description = "Fokus ke jendela atas" })
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }), { description = "Fokus ke jendela bawah" })

-- Toggles
hl.bind("ALT + J", hl.dsp.layout("togglesplit"), { description = "Pisah/satukan tiling" })
hl.bind("SUPER + V", hl.dsp.window.pseudo(), { description = "Mode pseudo pada jendela" })
hl.bind("SUPER + SHIFT + V", hl.dsp.window.float({ action = "toggle" }), { description = "Jendela melayang on/off" })

-- Workspace navigation
hl.bind("SUPER + CTRL + left", hl.dsp.focus({ workspace = "e-1" }), { description = "Workspace sebelumnya" })
hl.bind("SUPER + CTRL + right", hl.dsp.focus({ workspace = "e+1" }), { description = "Workspace berikutnya" })

-- Resize active window
hl.bind("SUPER + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), {
    description = "Lebarkan jendela ke kiri",
})
hl.bind("SUPER + code:21", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), {
    description = "Kecilkan jendela dari kiri",
})

-- Scroll through existing workspaces with SUPER + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Gulir workspace ke depan" })
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Gulir workspace ke belakang" })

-- Move/resize windows with SUPER + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Geser jendela (tahan & seret)" })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Ubah ukuran jendela (tahan & seret)" })

-- Scratchpad (Task 4.1)
hl.bind("SUPER + minus", hl.dsp.workspace.toggle_special("scratchpad"), { description = "Buka/tutup scratchpad terminal" })
hl.bind("SUPER + SHIFT + minus", hl.dsp.window.move({ workspace = "special:scratchpad" }), { description = "Kirim jendela aktif ke scratchpad" })

-- Window Tabbing / Groups
hl.bind("SUPER + ALT + G", hl.dsp.group.toggle(), { description = "Gabungkan/pisahkan jendela ke dalam Group Tab" })
hl.bind("SUPER + ALT + TAB", hl.dsp.group.next(), { description = "Pindah ke tab jendela berikutnya dalam Group" })
hl.bind("SUPER + ALT + SHIFT + TAB", hl.dsp.group.prev(), { description = "Pindah ke tab jendela sebelumnya dalam Group" })

-- Resize active window with SUPER + ALT + SHIFT + arrows
hl.bind("SUPER + ALT + SHIFT + left", hl.dsp.window.resize({ x = -40, y = 0, relative = true }), { description = "Persempit jendela (kiri)" })
hl.bind("SUPER + ALT + SHIFT + right", hl.dsp.window.resize({ x = 40, y = 0, relative = true }), { description = "Perlebar jendela (kanan)" })
hl.bind("SUPER + ALT + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -40, relative = true }), { description = "Perpendek jendela (atas)" })
hl.bind("SUPER + ALT + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 40, relative = true }), { description = "Tinggikan jendela (bawah)" })

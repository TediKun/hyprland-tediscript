-- INPUT / DEVICES

hl.config({
    cursor = {
        inactive_timeout = 1,
    },

    input = {
        kb_options = "compose:ralt",

        follow_mouse = 1,
        numlock_by_default = true,

        -- Increase sensitivity for mouse/trackpad (default: 0)
        sensitivity = 0.40,

        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.4,
        },
    },

    misc = {
        key_press_enables_dpms = true,
        mouse_move_enables_dpms = true,
    },
})

-- 3-finger horizontal swipe to switch workspaces
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

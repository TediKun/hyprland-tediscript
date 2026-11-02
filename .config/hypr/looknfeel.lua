-- LOOK & FEEL
-- Colors are read from the active Symphony theme (hyprlang colors.conf) so
-- that `symphony switch` / matugen keep working.

local home = os.getenv("HOME")
local colors_path = home .. "/.config/symphony/current/.config/hypr/theme/colors.conf"

local vars, sections = {}, {}
local file = io.open(colors_path, "r")
if file then
    local stack = {}
    for raw in file:lines() do
        local line = raw:gsub("^%s+", ""):gsub("%s+$", "")

        if line ~= "" and not line:match("^#") then
            if line:match("^}") then
                table.remove(stack)
            else
                local sec = line:match("^([%w_%-%.]+)%s*{%s*$")
                if sec then
                    stack[#stack + 1] = sec
                else
                    local key, value = line:match("^(%$[%w_%-]+)%s*=%s*(.-)%s*$")
                    if key then
                        vars[key:sub(2)] = value
                    else
                        key, value = line:match("^([%w_%-%.]+)%s*=%s*(.-)%s*$")
                        if key and value and #stack > 0 then
                            local path = table.concat(stack, ".")
                            sections[path] = sections[path] or {}
                            sections[path][key] = value
                        end
                    end
                end
            end
        end
    end
    file:close()
end

-- Convert "rgba(a) rgba(b) 45deg" into the Lua gradient table.
local function gradient(value)
    if not value then
        return nil
    end

    local colors = {}
    for color in value:gmatch("rgba?%b()") do
        colors[#colors + 1] = color
    end

    if #colors > 1 then
        local angle = tonumber(value:match("(%-?%d+%.?%d*)deg")) or 0
        return { colors = colors, angle = angle }
    end

    return value
end

-- Resolve variable references like $activeBorderColor to actual values
local function resolve_var(value)
    if not value then return value end
    if value:match("^%$[%w_%-]+") then
        local varname = value:match("^%$([%w_%-]+)")
        return vars[varname] or value
    end
    return value
end

local general = sections["general"] or {}
local shadow_raw = sections["decoration.shadow"] or {}

local shadow = {}
if shadow_raw.color then shadow.color = resolve_var(shadow_raw.color) end
if shadow_raw.color_inactive then shadow.color_inactive = resolve_var(shadow_raw.color_inactive) end
if shadow_raw.offset then
    local ox, oy = shadow_raw.offset:match("(%-?%d+)%s+(%-?%d+)")
    if ox then shadow.offset = { tonumber(ox), tonumber(oy) } end
end
if shadow_raw.range then shadow.range = tonumber(shadow_raw.range) end
if shadow_raw.render_power then shadow.render_power = tonumber(shadow_raw.render_power) end

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 12,
        border_size = 2,
        col = {
            active_border = gradient(resolve_var(general["col.active_border"] or vars.secondary)) or "rgba(ffffffff)",
            inactive_border = gradient(resolve_var(general["col.inactive_border"] or vars.outline_variant)) or "rgba(444444ff)",
        },
        resize_on_border = true,
    },

    decoration = {
        rounding = 10,
        blur = {
            enabled = true,
            size = 7,
            passes = 4,
            ignore_opacity = true,
            noise = 0.0117,
            contrast = 0.8916,
            brightness = 0.8172,
            xray = false,
            popups = true,
        },
        shadow = shadow,
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        focus_on_activate = true,
        anr_missed_pings = 3,
        on_focus_under_fullscreen = 1,
    },
})

-- LAYER RULES

-- App launcher
hl.layer_rule({ match = { namespace = "rofi" }, blur = true, ignore_alpha = 0, animation = "slide bottom" })

-- Top bar
hl.layer_rule({ match = { namespace = "waybar" }, blur = true, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "swayosd" }, blur = true, ignore_alpha = 0 })

-- Notifications
hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = true, ignore_alpha = 0.5, animation = "slide right" })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true, ignore_alpha = 0.5 })

-- Style gum confirm to match the terminal theme
hl.env("GUM_CONFIRM_PROMPT_FOREGROUND", "6")
hl.env("GUM_CONFIRM_SELECTED_FOREGROUND", "0")
hl.env("GUM_CONFIRM_SELECTED_BACKGROUND", "2")
hl.env("GUM_CONFIRM_UNSELECTED_FOREGROUND", "0")
hl.env("GUM_CONFIRM_UNSELECTED_BACKGROUND", "8")

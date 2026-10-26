-- i3 layout and keys via hy3, loaded from hyprland.lua.
-- Hyprland evaluates the config once before hyprpm loads the plugins,
-- then reloads it: hy3 is not there yet on that first pass.
local hy3 = hl.plugin.hy3
if not hy3 then
    return
end

local mod = "SUPER"
local left, down, up, right = "h", "j", "k", "l"

local function m(keys)
    return mod .. " + " .. keys
end

hl.config({
    general = {
        layout = "hy3",
    },
    plugin = {
        hy3 = {
            -- Tabs coloured like sway's client.* (Tokyo Night)
            tabs = {
                height      = 22,
                radius      = 6,
                text_font   = "Sans",
                text_height = 9,
                colors = {
                    active          = "rgba(e0af68ff)",
                    active_border   = "rgba(e0af68ff)",
                    active_text     = "rgba(1a1b26ff)",
                    focused         = "rgba(3b4261ff)",
                    focused_border  = "rgba(3b4261ff)",
                    focused_text    = "rgba(c0caf5ff)",
                    inactive        = "rgba(1a1b26ff)",
                    inactive_border = "rgba(292e42ff)",
                    inactive_text   = "rgba(565f89ff)",
                    urgent          = "rgba(f7768eff)",
                    urgent_border   = "rgba(f7768eff)",
                    urgent_text     = "rgba(1a1b26ff)",
                },
            },
        },
    },
})

-- Kill focused container
hl.bind(m("SHIFT + q"), hy3.kill_active())

-- True if no tiled window of the workspace lies on the `dir` side of `win`
local function atWorkspaceEdge(win, dir)
    local a = { x1 = win.at.x, y1 = win.at.y, x2 = win.at.x + win.size.x, y2 = win.at.y + win.size.y }
    for _, o in ipairs(hl.get_workspace_windows(win.workspace)) do
        if o.address ~= win.address and not o.floating then
            local b = { x1 = o.at.x, y1 = o.at.y, x2 = o.at.x + o.size.x, y2 = o.at.y + o.size.y }
            local rows = b.y1 < a.y2 and a.y1 < b.y2
            local cols = b.x1 < a.x2 and a.x1 < b.x2
            if (dir == "l" and rows and b.x2 <= a.x1) or (dir == "r" and rows and b.x1 >= a.x2)
                or (dir == "u" and cols and b.y2 <= a.y1) or (dir == "d" and cols and b.y1 >= a.y2) then
                return false
            end
        end
    end
    return true
end

-- hy3 does not move a window past the workspace edge: as in i3, at the
-- edge it goes to the adjacent monitor (if any)
local function moveWindow(dir)
    local shift = hy3.move_window(dir)
    return function()
        local win = hl.get_active_window()
        if win and not win.floating and hl.get_monitor(dir) and atWorkspaceEdge(win, dir) then
            hl.dispatch(hl.dsp.window.move({ monitor = dir }))
        else
            hl.dispatch(shift)
        end
    end
end

-- Moving around: focus / move, vim keys and arrows
local directions = {
    [left] = "l", [down] = "d", [up] = "u", [right] = "r",
    left   = "l", down   = "d", up   = "u", right   = "r",
}
for key, dir in pairs(directions) do
    hl.bind(m(key), hy3.move_focus(dir))
    hl.bind(m("SHIFT + " .. key), moveWindow(dir))
end

-- Move focused container to workspace (without following it, like i3)
for i = 1, 10 do
    hl.bind(m("SHIFT + " .. i % 10), hy3.move_to_workspace(tostring(i)))
end

-- Layout stuff: hy3 has no "stacking", mod+s toggles tabbed/split
hl.bind(m("b"), hy3.make_group("h"))
hl.bind(m("v"), hy3.make_group("v"))
hl.bind(m("s"), hy3.change_group("toggletab"))
hl.bind(m("w"), hy3.change_group("tab"))
hl.bind(m("e"), hy3.change_group("opposite"))

-- Move focus to the parent container
hl.bind(m("a"), hy3.change_focus("raise"))

-- Toggle the focus between tiling and floating windows
hl.bind(m("space"), hy3.toggle_focus_layer())

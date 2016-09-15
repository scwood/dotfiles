--------------------------------------------------------------------------------
-- config
--------------------------------------------------------------------------------

-- modifer keys used by shortcuts
cmdAltCtrl = {'cmd', 'alt', 'ctrl'}

-- hammerspoon config
hs.window.animationDuration = 0
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDHEIGHT = 2
hs.grid.GRIDWIDTH = 2

-- direction enum
north = 1
east = 2
south = 3
west = 4

--------------------------------------------------------------------------------
-- functions
--------------------------------------------------------------------------------

-- checks if focused window exists
function focusedWindowExists() 
    if not hs.window.focusedWindow() then
        return false
    end
    return true
end

-- reloads the config file
function reloadConfig() 
    hs.reload()
    hs.alert.show("Config reloaded")
end

-- snaps all windows to their nearest grid position
function snapAllWindows()
    hs.fnutils.map(hs.window.visibleWindows(), hs.grid.snap) 
end

-- snaps window to given coordinates, width, and height (percentages)
function snapFocusedWindow(horiz, vert, width, height) 
    return function()
        if not focusedWindowExists() then
            return
        end
        hs.window.focusedWindow():moveToUnit({
            x=horiz, y=vert, w=width, h=height
        })
    end
end

-- moves window to monitor in specified direction
function moveWindowToScreen(direction)
    return function()

        -- TODO: support north and south monitors

        if not focusedWindowExists() then
            return
        end
        if direction == west then
            local monitorWest = hs.window.focusedWindow():screen():toWest()
            if monitorWest then
                hs.window.focusedWindow():moveToScreen(monitorWest)
            end
        elseif direction == east then
            local monitorEast = hs.window.focusedWindow():screen():toEast()
            if monitorEast then
                hs.window.focusedWindow():moveToScreen(monitorEast)
            end
        end
    end
end

--------------------------------------------------------------------------------
-- hotkeys
--------------------------------------------------------------------------------

hs.hotkey.bind(cmdAltCtrl, "r", reloadConfig)
hs.hotkey.bind(cmdAltCtrl, ";", snapAllWindows)
hs.hotkey.bind(cmdAltCtrl, ']', moveWindowToScreen(east))
hs.hotkey.bind(cmdAltCtrl, '[', moveWindowToScreen(west));
hs.hotkey.bind(cmdAltCtrl, 'm', snapFocusedWindow(0, 0, 1, 1))
hs.hotkey.bind(cmdAltCtrl, 'h', snapFocusedWindow(0, 0, 0.5, 1))
hs.hotkey.bind(cmdAltCtrl, 'j', snapFocusedWindow(0, 0.5, 1, 0.5))
hs.hotkey.bind(cmdAltCtrl, 'k', snapFocusedWindow(0, 0, 1, 0.5))
hs.hotkey.bind(cmdAltCtrl, 'l', snapFocusedWindow(0.5, 0, 0.5, 1))
hs.hotkey.bind(cmdAltCtrl, 'y', snapFocusedWindow(0, 0, 0.5, 0.5))
hs.hotkey.bind(cmdAltCtrl, 'u', snapFocusedWindow(0.5, 0, 0.5, 0.5))
hs.hotkey.bind(cmdAltCtrl, 'b', snapFocusedWindow(0, 0.5, 0.5, 0.5))
hs.hotkey.bind(cmdAltCtrl, 'n', snapFocusedWindow(0.5, 0.5, 0.5, 0.5))

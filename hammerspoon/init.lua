-- modifer keys used by shortcuts
mash = {'cmd', 'alt', 'ctrl'}

-- hammerspoon config
hs.window.animationDuration = 0
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDHEIGHT = 2
hs.grid.GRIDWIDTH = 2

-- snap window to given coordinates and width/height
function snapFocusedWindow(horiz, vert, width, height) 
    return function()
        if not hs.window.focusedWindow() then
            return
        end
        hs.window.focusedWindow():moveToUnit({x=horiz, y=vert, w=width, h=height})
    end
end

-- snapp all windows to closest grid sections
hs.hotkey.bind(mash, ";", function ()
    hs.fnutils.map(hs.window.visibleWindows(), hs.grid.snap) 
end)

-- show windows hints
hs.hotkey.bind(mash, '/', hs.hints.windowHints)

-- maximize window
hs.hotkey.bind(mash, 'm', snapFocusedWindow(0, 0, 1, 1))

-- snap window left half
hs.hotkey.bind(mash, 'h', snapFocusedWindow(0, 0, 0.5, 1))

-- snap window bottom half
hs.hotkey.bind(mash, 'j', snapFocusedWindow(0, 0.5, 1, 0.5))

-- snap window top half
hs.hotkey.bind(mash, 'k', snapFocusedWindow(0, 0, 1, 0.5))

-- snap window right half
hs.hotkey.bind(mash, 'l', snapFocusedWindow(0.5, 0, 0.5, 1))

-- snap window NW corner
hs.hotkey.bind(mash, 'y', snapFocusedWindow(0, 0, 0.5, 0.5))

-- snap window NE corner
hs.hotkey.bind(mash, 'u', snapFocusedWindow(0.5, 0, 0.5, 0.5))

-- snap window SW corner
hs.hotkey.bind(mash, 'i', snapFocusedWindow(0, 0.5, 0.5, 0.5))

-- snap window SE corner
hs.hotkey.bind(mash, 'o', snapFocusedWindow(0.5, 0.5, 0.5, 0.5))



-- key definitions
local mash = {'cmd', 'alt', 'ctrl'}

-- disable window animations
hs.window.animationDuration = 0

-- window hints
hs.hotkey.bind(mash, '.', hs.hints.windowHints)

-- grid constants
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDHEIGHT = 2
hs.grid.GRIDWIDTH = 2

-- resizing windows
hs.hotkey.bind(mash, '[', hs.grid.resizeWindowThinner)
hs.hotkey.bind(mash, '-', hs.grid.resizeWindowShorter)
hs.hotkey.bind(mash, '=', hs.grid.resizeWindowTaller)
hs.hotkey.bind(mash, ']', hs.grid.resizeWindowWider)

-- moving windows
hs.hotkey.bind(mash, 'h', hs.grid.pushWindowLeft)
hs.hotkey.bind(mash, 'j', hs.grid.pushWindowDown)
hs.hotkey.bind(mash, 'k', hs.grid.pushWindowUp)
hs.hotkey.bind(mash, 'l', hs.grid.pushWindowRight)

-- move windows between montiors
hs.hotkey.bind(mash, 'n', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(mash, 'p', hs.grid.pushWindowPrevScreen)

-- maximize window
hs.hotkey.bind(mash, 'm', hs.grid.maximizeWindow)

-- snap windows
hs.hotkey.bind(mash, ';', function() hs.grid.snap(hs.window.focusedWindow()) end)
hs.hotkey.bind(mash, "'", function() hs.fnutils.map(hs.window.visibleWindows(), hs.grid.snap) end)

--------------------------------------------------------------------------------
-- general
--------------------------------------------------------------------------------

-- define mash key

local mash = {'cmd', 'alt', 'ctrl'}

-- disable window snapping animation

hs.window.animationDuration = 0

-- reload conifg file on save

function reload_config(files)
  hs.reload()
end

hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reload_config):start()
hs.alert.show('Config loaded')

--------------------------------------------------------------------------------
-- window management
--------------------------------------------------------------------------------

-- grid settings

hs.grid.GRIDWIDTH = 2
hs.grid.GRIDHEIGHT = 2
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0

-- window location functions

function leftHalf()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    frame.x = max.x
    frame.y = max.y
    frame.w = max.w / 2
    frame.h = max.h
    win:setFrame(frame)
  end
end

function rightHalf()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    frame.x = max.x + max.w / 2
    frame.y = max.y
    frame.w = max.w / 2
    frame.h = max.h
    win:setFrame(frame)
  end
end

function topHalf()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    frame.x = max.x
    frame.y = max.y
    frame.w = max.w
    frame.h = max.h / 2
    win:setFrame(frame)
  end
end

function bottomHalf()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    frame.x = max.x
    frame.y = max.y + max.h / 2
    frame.w = max.w
    frame.h = max.h / 2
    win:setFrame(frame)
  end
end

function topLeft()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    frame.x = max.x
    frame.y = max.y
    frame.w = max.w / 2
    frame.h = max.h / 2
    win:setFrame(frame)
  end
end

function topRight()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    frame.x = max.x + max.w / 2 
    frame.y = max.y
    frame.w = max.w / 2
    frame.h = max.h / 2
    win:setFrame(frame)
  end
end

function bottomLeft()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    frame.x = max.x
    frame.y = max.y + max.h / 2
    frame.w = max.w / 2
    frame.h = max.h / 2
    win:setFrame(frame)
  end
end

function bottomRight()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    frame.x = max.x + max.w / 2 
    frame.y = max.y + max.h / 2
    frame.w = max.w / 2
    frame.h = max.h / 2
    win:setFrame(frame)
  end
end

-- window management keybinds

hs.hotkey.bind(mash, 'n', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(mash, 'f', hs.grid.maximizeWindow)
hs.hotkey.bind(mash, 'd', leftHalf)
hs.hotkey.bind(mash, 'g', rightHalf)
hs.hotkey.bind(mash, 'r', topHalf)
hs.hotkey.bind(mash, 'v', bottomHalf)
hs.hotkey.bind(mash, 'e', topLeft)
hs.hotkey.bind(mash, 't', topRight)
hs.hotkey.bind(mash, 'c', bottomLeft)
hs.hotkey.bind(mash, 'b', bottomRight)
hs.hotkey.bind(mash, 'h', function() hs.window.focusedWindow():focusWindowWest() end)
hs.hotkey.bind(mash, 'j', function() hs.window.focusedWindow():focusWindowSouth() end)
hs.hotkey.bind(mash, 'k', function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(mash, 'l', function() hs.window.focusedWindow():focusWindowEast() end)

hs.hotkey.bind(mash, 'a', function() hs.window.focusedWindow():moveToUnit(hs.layout.left30) end)
hs.hotkey.bind(mash, 's', function() hs.window.focusedWindow():moveToUnit(hs.layout.right70) end)
hs.hotkey.bind(mash, '[', function() hs.window.focusedWindow():moveToUnit(hs.layout.left50) end)
hs.hotkey.bind(mash, ']', function() hs.window.focusedWindow():moveToUnit(hs.layout.right50) end)

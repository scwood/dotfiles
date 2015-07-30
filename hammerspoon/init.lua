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

function fullscreen()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local frame = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    frame.x = max.x
    frame.y = max.y
    frame.w = max.w
    frame.h = max.h
    win:setFrame(frame)
  end
end

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

hs.hotkey.bind(mash, 'f', fullscreen)
hs.hotkey.bind(mash, 'd', leftHalf)
hs.hotkey.bind(mash, 'g', rightHalf)
hs.hotkey.bind(mash, 'r', topLeft)
hs.hotkey.bind(mash, 't', topRight)
hs.hotkey.bind(mash, 'c', bottomLeft)
hs.hotkey.bind(mash, 'v', bottomRight)

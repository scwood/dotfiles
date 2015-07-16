--------------------------------------------------------------------------------
-- general
--------------------------------------------------------------------------------

-- define hyper key
local hyper = {'cmd', 'alt', 'ctrl'}
local hyperShift = {'cmd', 'alt', 'ctrl', 'shift'}

-- disable window snapping animation
hs.window.animationDuration = 0

-- reload conifg file on save
function reload_config(files)
  hs.reload()
end
hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reload_config):start()
hs.alert.show('Config loaded')

-- window hints settings
hs.hotkey.bind(hyper, 'a', function()
  hs.hints.windowHints()
end)
hs.hints.showTitleThresh = 0

--------------------------------------------------------------------------------
-- window management
--------------------------------------------------------------------------------

hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 2
hs.grid.GRIDHEIGHT = 2

local function nextScreen()
  if hs.window.focusedWindow() then
    hs.grid.pushWindowNextScreen()
  end
end

local function fullScreen()
  if hs.window.focusedWindow() then
    hs.grid.maximizeWindow()
  end
end

local function leftHalf()
  if hs.window.focusedWindow() then 
    hs.grid.resizeWindowTaller()
    hs.grid.resizeWindowThinner()
    hs.grid.pushWindowLeft()
  end
end

local function bottomHalf()
  if hs.window.focusedWindow() then 
    hs.grid.resizeWindowShorter()
    hs.grid.resizeWindowWider()
    hs.grid.pushWindowDown()
  end
end

local function topHalf()
  if hs.window.focusedWindow() then 
    hs.grid.resizeWindowShorter()
    hs.grid.resizeWindowWider()
    hs.grid.pushWindowUp()
  end
end

local function rightHalf()
  if hs.window.focusedWindow() then 
    hs.grid.resizeWindowTaller()
    hs.grid.resizeWindowThinner()
    hs.grid.pushWindowRight()
  end
end

local function northWest()
  if hs.window.focusedWindow() then 
    hs.grid.resizeWindowShorter()
    hs.grid.resizeWindowThinner()
    hs.grid.pushWindowUp()
    hs.grid.pushWindowLeft()
  end
end

local function northEast()
  if hs.window.focusedWindow() then 
    hs.grid.resizeWindowShorter()
    hs.grid.resizeWindowThinner()
    hs.grid.pushWindowUp()
    hs.grid.pushWindowRight()
  end
end

local function southWest()
  if hs.window.focusedWindow() then 
    hs.grid.resizeWindowShorter()
    hs.grid.resizeWindowThinner()
    hs.grid.pushWindowDown()
    hs.grid.pushWindowLeft()
  end
end

local function southEast()
  if hs.window.focusedWindow() then 
    hs.grid.resizeWindowShorter()
    hs.grid.resizeWindowThinner()
    hs.grid.pushWindowDown()
    hs.grid.pushWindowRight()
  end
end

hs.hotkey.bind(hyper, 'n', nextScreen)
hs.hotkey.bind(hyper, 'f', fullScreen)
hs.hotkey.bind(hyper, 'h', leftHalf)
hs.hotkey.bind(hyper, 'j', bottomHalf)
hs.hotkey.bind(hyper, 'k', topHalf)
hs.hotkey.bind(hyper, 'l', rightHalf)
hs.hotkey.bind(hyperShift, 'h', northWest)
hs.hotkey.bind(hyperShift, 'j', northEast)
hs.hotkey.bind(hyperShift, 'k', southWest)
hs.hotkey.bind(hyperShift, 'l', southEast)

--------------------------------------------------------------------------------
-- application shortcuts
--------------------------------------------------------------------------------

hs.hotkey.bind(hyper, 'return', function()
  hs.application.launchOrFocus('iTerm')
end)

hs.hotkey.bind(hyper, 'c', function()
  hs.application.launchOrFocus('Google Chrome')
end)

hs.hotkey.bind(hyper, 't', function()
  hs.application.launchOrFocus('Sublime Text')
end)

hs.hotkey.bind(hyper, 'e', function()
  hs.application.launchOrFocus('Finder')
end)

hs.hotkey.bind(hyper, 's', function()
  hs.application.launchOrFocus('Spotify')
end)

hs.hotkey.bind(hyper, 'd', function()
  hs.application.launchOrFocus('Dash')
end)

hs.hotkey.bind(hyper, 'p', function()
  hs.application.launchOrFocus('Plug')
end)

hs.hotkey.bind(hyper, 'r', function()
  hs.application.launchOrFocus('Safari')
end)

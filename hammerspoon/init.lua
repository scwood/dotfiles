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

local function fullScreen()
  if hs.window.focusedWindow() then
    hs.grid.maximizeWindow()
  end
end

local function halfScreen()
  if hs.window.focusedWindow() then
    hs.grid.resizeWindowThinner();
    hs.grid.resizeWindowTaller();
  end
end

local function quarterScreen()
  if hs.window.focusedWindow() then
    hs.grid.resizeWindowThinner();
    hs.grid.resizeWindowShorter();
  end
end

local function moveLeft()
  if hs.window.focusedWindow() then
    hs.grid.pushWindowLeft();
  end
end

local function moveUp()
  if hs.window.focusedWindow() then
    hs.grid.pushWindowUp();
  end
end

local function moveDown()
  if hs.window.focusedWindow() then
    hs.grid.pushWindowDown();
  end
end

local function moveRight()
  if hs.window.focusedWindow() then
    hs.grid.pushWindowRight();
  end
end

hs.hotkey.bind(hyperShift, 'f', fullScreen)
hs.hotkey.bind(hyperShift, 'h', halfScreen)
hs.hotkey.bind(hyperShift, 'q', quarterScreen)
hs.hotkey.bind(hyper, 'h', moveLeft)
hs.hotkey.bind(hyper, 'j', moveDown)
hs.hotkey.bind(hyper, 'k', moveUp)
hs.hotkey.bind(hyper, 'l', moveRight)

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

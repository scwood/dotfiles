--------------------------------------------------------------------------------
-- general
--------------------------------------------------------------------------------

-- define hyper key
local hyper = {'shift', 'cmd', 'alt', 'ctrl'}

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

hs.hotkey.bind(hyper, 'f', hs.grid.maximizeWindow)
hs.hotkey.bind(hyper, 'n', hs.grid.pushWindowNextScreen)

hs.hotkey.bind(hyper, 'h', function()
  hs.grid.resizeWindowTaller()
  hs.grid.resizeWindowThinner()
  hs.grid.pushWindowLeft()
end)

hs.hotkey.bind(hyper, 'j', function()
  hs.grid.resizeWindowShorter()
  hs.grid.resizeWindowWider()
  hs.grid.pushWindowDown()
end)

hs.hotkey.bind(hyper, 'k', function()
  hs.grid.resizeWindowShorter()
  hs.grid.resizeWindowWider()
  hs.grid.pushWindowUp()
end)

hs.hotkey.bind(hyper, 'l', function()
  hs.grid.resizeWindowTaller()
  hs.grid.resizeWindowThinner()
  hs.grid.pushWindowRight()
end)

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

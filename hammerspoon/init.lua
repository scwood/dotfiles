--------------------------------------------------------------------------------
-- general
---------------------------------------------------------------------------------

local hyper = {"shift", "cmd", "alt", "ctrl"}
hs.window.animationDuration = 0

function reload_config(files)
  hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")

hs.hotkey.bind(hyper, "a", function()
  hs.hints.windowHints()
end)
hs.hints.showTitleThresh = 0

--------------------------------------------------------------------------------
-- application shortcuts
--------------------------------------------------------------------------------

hs.hotkey.bind(hyper, "t", function()
  hs.application.launchOrFocus("iTerm")
end)

hs.hotkey.bind(hyper, "c", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind(hyper, "s", function()
  hs.application.launchOrFocus("Sublime Text")
end)

hs.hotkey.bind(hyper, "e", function()
  hs.application.launchOrFocus("Finder")
end)

hs.hotkey.bind(hyper, "m", function()
  hs.application.launchOrFocus("Spotify")
end)
--------------------------------------------------------------------------------
-- window management
--------------------------------------------------------------------------------

-- hyper f -> full screen
hs.hotkey.bind(hyper, "f", function()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  frame.x = max.x
  frame.y = max.y
  frame.w = max.w
  frame.h = max.h
  win:setFrame(frame)
end)

-- hyper d -> left half
hs.hotkey.bind(hyper, "d", function()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  frame.x = max.x
  frame.y = max.y
  frame.w = max.w / 2
  frame.h = max.h
  win:setFrame(frame)
end)

-- hyper g -> right half
hs.hotkey.bind(hyper, "g", function()
  local win = hs.window.focusedWindow()
  local frame = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  frame.x = max.x + (max.w / 2)
  frame.y = max.y
  frame.w = max.w / 2
  frame.h = max.h
  win:setFrame(frame)
end)

-- hyper n -> move to next monitor
hs.hotkey.bind(hyper, "n", function()
  local win = hs.window.focusedWindow()
  local nextScreen = win:screen():next()
  local max = nextScreen:frame()
  frame.x = max.e
  frame.y = max.y
  frame.w = max.w
  frame.h = max.h
  win:moveToScreen(nextScreen)
  win:setFrame(frame)
end)

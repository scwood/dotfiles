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

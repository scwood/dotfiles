--------------------------------------------------------------------------------
-- general
--------------------------------------------------------------------------------

-- define mash key

mash = {'cmd', 'alt', 'ctrl'}

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

-- window location functions

function moveScreens()
  hs.window.focusedWindow():moveOneScreenEast()
end

function fullScreen()
  hs.window.focusedWindow():moveToUnit(hs.layout.maximized) 
end

function leftHalf() 
  hs.window.focusedWindow():moveToUnit(hs.layout.left50) 
end

function rightHalf()
  hs.window.focusedWindow():moveToUnit(hs.layout.right50) 
end

function topHalf()
  hs.window.focusedWindow():moveToUnit({x=0, y=0, w=1, h=0.5}) 
end

function bottomHalf()
  hs.window.focusedWindow():moveToUnit({x=0, y=0.5, w=1, h=0.5}) 
end

function topLeft()
  hs.window.focusedWindow():moveToUnit({x=0, y=0, w=0.5, h=0.5}) 
end

function topRight()
  hs.window.focusedWindow():moveToUnit({x=0.5, y=0, w=0.5, h=0.5}) 
end

function bottomLeft()
  hs.window.focusedWindow():moveToUnit({x=0, y=0.5, w=0.5, h=0.5}) 
end

function bottomRight()
  hs.window.focusedWindow():moveToUnit({x=0.5, y=0.5, w=0.5, h=0.5}) 
end

hs.hotkey.bind(mash, 'n', moveScreens)
hs.hotkey.bind(mash, 'f', fullScreen)
hs.hotkey.bind(mash, 'd', leftHalf)
hs.hotkey.bind(mash, 'g', rightHalf)
hs.hotkey.bind(mash, 'r', topHalf)
hs.hotkey.bind(mash, 'v', bottomHalf)
hs.hotkey.bind(mash, 'e', topLeft)
hs.hotkey.bind(mash, 't', topRight)
hs.hotkey.bind(mash, 'c', bottomLeft)
hs.hotkey.bind(mash, 'b', bottomRight)

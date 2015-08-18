mash = {'cmd', 'alt', 'ctrl'}

hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDHEIGHT = 2
hs.grid.GRIDWIDTH = 2

hs.window.animationDuration = 0
hs.hotkey.bind(mash, ';', hs.hints.windowHints)

function snapAllWindows()
  hs.fnutils.map(hs.window.visibleWindows(), hs.grid.snap)
end

function snapToLeftHalf() 
  hs.window.focusedWindow():moveToUnit(hs.layout.left50) 
end

function snapToBottomHalf()
  hs.window.focusedWindow():moveToUnit({x=0, y=0.5, w=1, h=0.5}) 
end

function snapToTopHalf() 
  hs.window.focusedWindow():moveToUnit({x=0, y=0, w=1, h=0.5}) 
end

function snapToRightHalf() 
  hs.window.focusedWindow():moveToUnit(hs.layout.right50) 
end

function snapToNWCorner()
  hs.window.focusedWindow():moveToUnit({x=0, y=0, w=0.5, h=0.5}) 
end

function snapToNECorner()
  hs.window.focusedWindow():moveToUnit({x=0.5, y=0, w=0.5, h=0.5}) 
end

function snapToSWCorner()
  hs.window.focusedWindow():moveToUnit({x=0, y=0.5, w=0.5, h=0.5}) 
end

function snapToSECorner()
  hs.window.focusedWindow():moveToUnit({x=0.5, y=0.5, w=0.5, h=0.5}) 
end

function moveToNextScreen()
  hs.window.focusedWindow():moveOneScreenEast()
end

function moveToPreviousScreen()
  hs.window.focusedWindow():moveOneScreenWest()
end

hs.hotkey.bind(mash, "'", snapAllWindows)
hs.hotkey.bind(mash, 'h', snapToLeftHalf)
hs.hotkey.bind(mash, 'j', snapToBottomHalf)
hs.hotkey.bind(mash, 'k', snapToTopHalf)
hs.hotkey.bind(mash, 'l', snapToRightHalf)
hs.hotkey.bind(mash, 'y', snapToNWCorner)
hs.hotkey.bind(mash, 'u', snapToNECorner)
hs.hotkey.bind(mash, 'i', snapToSWCorner)
hs.hotkey.bind(mash, 'o', snapToSECorner)
hs.hotkey.bind(mash, 'n', moveToNextScreen)
hs.hotkey.bind(mash, 'p', moveToPreviousScreen)
hs.hotkey.bind(mash, 'm', hs.grid.maximizeWindow)

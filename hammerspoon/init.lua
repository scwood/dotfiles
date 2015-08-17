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

function leftHalf() 
  hs.window.focusedWindow():moveToUnit(hs.layout.left50) 
end

function bottomHalf()
  hs.window.focusedWindow():moveToUnit({x=0, y=0.5, w=1, h=0.5}) 
end

function topHalf() 
  hs.window.focusedWindow():moveToUnit({x=0, y=0, w=1, h=0.5}) 
end

function rightHalf() 
  hs.window.focusedWindow():moveToUnit(hs.layout.right50) 
end

function moveToNextScreen()
  hs.window.focusedWindow():moveOneScreenEast()
end

function moveToPreviousScreen()
  hs.window.focusedWindow():moveOneScreenWest()
end

hs.hotkey.bind(mash, 'h', leftHalf)
hs.hotkey.bind(mash, 'j', bottomHalf)
hs.hotkey.bind(mash, 'k', topHalf)
hs.hotkey.bind(mash, 'l', rightHalf)
hs.hotkey.bind(mash, 'n', moveToNextScreen)
hs.hotkey.bind(mash, 'p', moveToPreviousScreen)
hs.hotkey.bind(mash, 'm', hs.grid.maximizeWindow)
hs.hotkey.bind(mash, "'", snapAllWindows)

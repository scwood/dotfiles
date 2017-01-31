var cmdAltCtrl = ['cmd', 'alt', 'ctrl'];

var keybinds = [
  ['m', cmdAltCtrl, snapFocusedWindow(0, 0, 1, 1)],
  ['h', cmdAltCtrl, snapFocusedWindow(0, 0, 0.5, 1)],
  ['j', cmdAltCtrl, snapFocusedWindow(0, 0.5, 1, 0.5)],
  ['k', cmdAltCtrl, snapFocusedWindow(0, 0, 1, 0.5)],
  ['l', cmdAltCtrl, snapFocusedWindow(0.5, 0, 0.5, 1)],
  ['y', cmdAltCtrl, snapFocusedWindow(0, 0, 0.5, 0.5)],
  ['u', cmdAltCtrl, snapFocusedWindow(0.5, 0, 0.5, 0.5)],
  ['b', cmdAltCtrl, snapFocusedWindow(0, 0.5, 0.5, 0.5)],
  ['n', cmdAltCtrl, snapFocusedWindow(0.5, 0.5, 0.5, 0.5)],
  ['c', cmdAltCtrl, moveFocusedWindowToNextScreen],
];

keybinds.forEach(function (options) {
  Key.on(options[0], options[1], options[2]);
});

function snapFocusedWindow(xRatio, yRatio, widthRatio, heightRatio) {
  return function () {
    var win = Window.focused();
    if (win === null) {
      return;
    }
    var screen = win.screen().flippedVisibleFrame();
    win.setFrame({
      x: screen.x + screen.width * xRatio,
      y: screen.y + screen.height * yRatio,
      width: screen.width * widthRatio,
      height: screen.height * heightRatio,
    });
  }
}

function moveFocusedWindowToNextScreen() {
  var win = Window.focused();
  if (win === null) {
    return;
  }
  var oldWindow = win.frame();
  var oldScreen = win.screen().flippedVisibleFrame();
  var newScreen = win.screen().next().flippedVisibleFrame();
  win.setFrame({
    x: newScreen.x + newScreen.width * ((oldWindow.x - oldScreen.x) / oldScreen.width),
    y: newScreen.y + newScreen.height * ((oldWindow.y - oldScreen.y) / oldScreen.height), 
    width: newScreen.width * (oldWindow.width / oldScreen.width),
    height: newScreen.height * (oldWindow.height / oldScreen.height),
  });
}

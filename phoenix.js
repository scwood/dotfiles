const cmdAltCtrl = ['cmd', 'alt', 'ctrl'];

const keybinds = [
  ['m', cmdAltCtrl, snapFocusedWindow(0, 0, 1, 1)],
  ['h', cmdAltCtrl, snapFocusedWindow(0, 0, 0.5, 1)],
  ['j', cmdAltCtrl, snapFocusedWindow(0, 0.5, 1, 0.5)],
  ['k', cmdAltCtrl, snapFocusedWindow(0, 0, 1, 0.5)],
  ['l', cmdAltCtrl, snapFocusedWindow(0.5, 0, 0.5, 1)],
  ['y', cmdAltCtrl, snapFocusedWindow(0, 0, 0.5, 0.5)],
  ['u', cmdAltCtrl, snapFocusedWindow(0.5, 0, 0.5, 0.5)],
  ['b', cmdAltCtrl, snapFocusedWindow(0, 0.5, 0.5, 0.5)],
  ['n', cmdAltCtrl, snapFocusedWindow(0.5, 0.5, 0.5, 0.5)],
];

keybinds.forEach(([key, modifiers, callback]) => {
  Key.on(key, modifiers, callback);
});

function snapFocusedWindow(x, y, width, height) {
  return () => {
    const win = Window.focused()
    if (Window === null) {
      return;
    }
    const screen = Screen.main().frame();
    win.setTopLeft({
      x: screen.width * x,
      y: screen.height * y
    });
    win.setSize({
      width: screen.width * width,
      height: screen.height * height
    });
  }
}

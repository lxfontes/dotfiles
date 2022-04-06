mods = { 'ctrl', 'alt', 'cmd' }

units = {
  bottom = { x = 0.0, y = 0.5, w = 1.0, h = 0.5 },
  left   = { x = 0.0, y = 0.0, w = 0.5, h = 1.0 },
  right  = { x = 0.5, y = 0.0, w = 0.5, h = 1.0 },
  top    = { x = 0.0, y = 0.0, w = 1.0, h = 0.5 },
}

animationDuration = 0.1

function createMoveWindow(rect)
  return function ()
    hs.window.focusedWindow():move(rect, nil, true, animationDuration)
  end
end

hs.hotkey.bind(mods, 'down', createMoveWindow(units.bottom))
hs.hotkey.bind(mods, 'left', createMoveWindow(units.left))
hs.hotkey.bind(mods, 'right', createMoveWindow(units.right))
hs.hotkey.bind(mods, 'up', createMoveWindow(units.top))
hs.hotkey.bind(mods, 'm', function()
  hs.window.focusedWindow():maximize(animationDuration)
end)

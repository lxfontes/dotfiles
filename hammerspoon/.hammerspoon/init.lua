hs.loadSpoon("SpoonInstall")

mods = { "ctrl", "alt", "cmd" }

spoon.SpoonInstall:andUse("WindowHalfsAndThirds", {
	config = { use_frame_correctness = true },
	hotkeys = {
		left_half = { mods, "Left" },
		right_half = { mods, "Right" },
		top_half = { mods, "Up" },
		bottom_half = { mods, "Down" },
		undo = { mods, "z" },
		center = { mods, "c" },
		max_toggle = { mods, "m" },
	},
})

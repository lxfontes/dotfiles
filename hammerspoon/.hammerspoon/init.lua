hs.loadSpoon("SpoonInstall")

third_mods = { "ctrl", "cmd" }
half_mods = { "ctrl", "alt", "cmd" }

spoon.SpoonInstall:andUse("WindowHalfsAndThirds", {
	config = { use_frame_correctness = true },
	hotkeys = {
		third_left = { third_mods, "Left" },
		third_right = { third_mods, "Right" },

		center = { half_mods , "c" },
		max_toggle = { half_mods, "m" },

		left_half = { half_mods, "Left" },
		right_half = { half_mods, "Right" },

		top_half = { half_mods, "Up" },
		bottom_half = { half_mods, "Down" },
	},
})

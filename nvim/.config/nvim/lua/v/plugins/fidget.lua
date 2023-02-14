return {
	"j-hui/fidget.nvim",
	event = "BufReadPost",
	opts = {
		text = {
			spinner = "dots_pulse",
			done = "",
			commenced = "Started",
			completed = "Completed",
		},
		window = {
			relative = "win",
			blend = 0,
			zindex = nil,
			border = "none",
		},
	},
}

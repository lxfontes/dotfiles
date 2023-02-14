return {
	"nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	config = function()
		local colors = require("catppuccin.palettes").get_palette()

		require("nvim-web-devicons").setup({
			override = {
				default_icon = {
					icon = "",
					color = colors.text,
					name = "Default",
				},
                log = {
					icon = "",
					color = colors.yellow,
					name = "log",
                },
				html = {
					icon = "",
					color = colors.peach,
					name = "html",
				},
				css = {
					icon = "",
					color = colors.blue,
					name = "css",
				},
				scss = {
					icon = "",
					color = colors.pink,
					name = "scss",
				},
				sass = {
					icon = "",
					color = colors.mauve,
					name = "sass",
				},
				js = {
					icon = "",
					color = colors.yellow,
					name = "js",
				},
				json = {
					icon = "",
					color = colors.yellow,
					name = "json",
				},
				ts = {
					icon = "ﯤ",
					color = colors.blue,
					name = "ts",
				},
				kt = {
					icon = "󱈙",
					color = colors.peach,
					name = "kt",
				},
				png = {
					icon = "",
					color = colors.mauve,
					name = "png",
				},
				jpg = {
					icon = "",
					color = colors.sapphire,
					name = "jpg",
				},
				jpeg = {
					icon = "",
					color = colors.sapphire,
					name = "jpeg",
				},
				mp3 = {
					icon = "",
					color = colors.green,
					name = "mp3",
				},
				mp4 = {
					icon = "",
					color = colors.green,
					name = "mp4",
				},
				out = {
					icon = "",
					color = colors.blue,
					name = "out",
				},
				rb = {
					icon = "",
					color = colors.red,
					name = "rb",
				},
				vue = {
					icon = "﵂",
					color = colors.green,
					name = "vue",
				},
				py = {
					icon = "",
					color = colors.peach,
					name = "py",
				},
				toml = {
					icon = "",
					color = colors.blue,
					name = "toml",
				},
				lock = {
					icon = "",
					color = colors.red,
					name = "lock",
				},
				zip = {
					icon = "",
					color = colors.sapphire,
					name = "zip",
				},
				xz = {
					icon = "",
					color = colors.sapphire,
					name = "xz",
				},
				deb = {
					icon = "",
					color = colors.red,
					name = "deb",
				},
				rpm = {
					icon = "",
					color = colors.red,
					name = "rpm",
				},
				lua = {
					icon = "",
					color = colors.blue,
					name = "lua",
				},
				txt = {
					icon = "",
					color = colors.blue,
					name = "txt",
				},
				md = {
					icon = "",
					color = colors.mauve,
					name = "markdown",
				},
				graphql = {
					icon = "",
					color = colors.mauve,
					name = "graphql",
				},
				env = {
					icon = "",
					color = colors.yellow,
					name = "dotenvexample",
				},
				[".env.production"] = {
					icon = "",
					color = colors.yellow,
					name = "envprod",
				},
				[".env.development"] = {
					icon = "",
					color = colors.yellow,
					name = "envdev",
				},
				[".env.testing"] = {
					icon = "",
					color = colors.yellow,
					name = "envtest",
				},
				[".env.example"] = {
					icon = "",
					color = colors.yellow,
					name = "dotenvexample",
				},
				[".env"] = {
					icon = "",
					color = colors.yellow,
					name = "dotenv",
				},
				["docker-compose.yml"] = {
					icon = "",
					color = colors.sapphire,
					name = "dockercompose",
				},
				[".dockerignore"] = {
					icon = "",
					color = colors.peach,
					name = "dockerignore",
				},
				[".prettierignore"] = {
					icon = "",
					color = colors.peach,
					name = "prettierignore",
				},
				[".prettierrc"] = {
					icon = "",
					color = colors.sapphire,
					name = "prettier",
				},
				[".prettierrc.json"] = {
					icon = "",
					color = colors.sapphire,
					name = "prettierjson",
				},
				[".prettierrc.js"] = {
					icon = "",
					color = colors.sapphire,
					name = "prettierrcjs",
				},
				["prettier.config.js"] = {
					icon = "",
					color = colors.sapphire,
					name = "prettierjsconfig",
				},
				[".prettier.yaml"] = {
					icon = "",
					color = colors.sapphire,
					name = "prettieryaml",
				},
				["test.js"] = {
					icon = "",
					color = colors.yellow,
					name = "javascripttest",
				},
				["test.jsx"] = {
					icon = "",
					color = colors.yellow,
					name = "reactrest",
				},
				["test.ts"] = {
					icon = "",
					color = colors.blue,
					name = "typescripttest",
				},
				["test.tsx"] = {
					icon = "",
					color = colors.blue,
					name = "reacttypescripttest",
				},
				["spec.js"] = {
					icon = "",
					color = colors.yellow,
					name = "javascriptspectest",
				},
				["spec.jsx"] = {
					icon = "",
					color = colors.yellow,
					name = "reactspectest",
				},
				["spec.ts"] = {
					icon = "",
					color = colors.blue,
					name = "typescriptspec",
				},
				["spec.tsx"] = {
					icon = "",
					color = colors.blue,
					name = "reacttypescriptspectest",
				},
				["yarn-error.log"] = {
					icon = "",
					color = colors.red,
					name = "yarnerrorlog",
				},
				["yarn.lock"] = {
					icon = "",
					color = colors.blue,
					name = "yarnlock",
				},
				[".yarnrc"] = {
					icon = "",
					color = colors.blue,
					name = "yarnconfig",
				},
				["pnpm-lock.yaml"] = {
					icon = "",
					color = colors.peach,
					name = "pnpmlock",
				},
				["package.json"] = {
					icon = "",
					color = colors.green,
					name = "npm_packagejson",
				},
				["package-lock.json"] = {
					icon = "",
					color = colors.red,
					name = "packagelockjson",
				},
				[".gitignore"] = {
					icon = "",
					color = colors.maroon,
					name = "gitignore",
				},
				[".gitattributes"] = {
					icon = "",
					color = colors.peach,
					name = "gitattributes",
				},
				["Dockerfile"] = {
					icon = "",
					color = colors.blue,
					name = "dockerfilex",
				},
				[".nvmrc"] = {
					icon = "",
					color = colors.green,
					name = "nvmrc",
				},
				[".eslintrc.js"] = {
					icon = "ﯶ",
					color = colors.mauve,
					name = "eslintrcjs",
				},
				[".travis.yml"] = {
					icon = "",
					color = colors.red,
					name = "travis",
				},
				[".babelrc"] = {
					icon = "",
					color = colors.yellow,
					name = "babelrc",
				},
				["babel.config.js"] = {
					icon = "",
					color = colors.yellow,
					name = "babelconfig",
				},
				[".commitlintrc.json"] = {
					icon = "ﰚ",
					color = colors.green,
					name = "commitlinrcjson",
				},
				["commitlint.config.ts"] = {
					icon = "ﰚ",
					color = colors.green,
					name = "commitlintconfigts",
				},
				Makefile = {
					icon = "",
					color = colors.yellow,
					name = "Makefile",
				},
				["tsconfig.build.json"] = {
					icon = "",
					color = colors.blue,
					name = "tsconfigbuildjson",
				},
				["tsconfig.json"] = {
					icon = "",
					color = colors.blue,
					name = "tsconfigjson",
				},
				["nest-cli.json"] = {
					icon = "",
					color = colors.red,
					name = "nestclijson",
				},
				["vite.config.js"] = {
					icon = "",
					color = colors.yellow,
					name = "viteconfigjs",
				},
				["vite.config.ts"] = {
					icon = "",
					color = colors.blue,
					name = "viteconfigts",
				},
				["Procfile"] = {
					icon = "",
					color = colors.mauve,
					name = "procfile",
				},
				[".editorconfig"] = {
					icon = "",
					color = colors.sky,
					name = "editorconfig",
				},
				["LICENSE"] = {
					icon = "",
					color = colors.blue,
					name = "LICENSE",
				},
				snap = {
					icon = "",
					color = colors.text,
					name = "snap",
				},
				astro = {
					icon = "",
					color = colors.peach,
					name = "astro",
				},
				feature = {
					icon = "",
					color = colors.green,
					name = "cucumber",
				},
				go = {
					icon = "ﳑ",
					color = colors.sapphire,
					name = "go",
				},
				["go.mod"] = {
					icon = "ﳑ",
					color = colors.red,
					name = "gomod",
				},
				["go.sum"] = {
					icon = "ﳑ",
					color = colors.yellow,
					name = "gosum",
				},
				zsh = {
					icon = "",
					color = colors.peach,
					name = "zsh",
				},
				[".zshrc"] = {
					icon = "",
					color = colors.peach,
					name = "zshrc",
				},
				sh = {
					icon = "",
					color = colors.text,
					name = "bash",
				},
				[".bashrc"] = {
					icon = "",
					color = colors.text,
					name = "bashrc",
				},
				[".tmux.conf"] = {
					icon = "",
					color = colors.green,
					name = "tmuxconf",
				},
				[".stylua"] = {
					icon = "",
					color = colors.teal,
					name = "stylua",
				},
			},
			default = true,
		})
	end,
}

require('jaq-nvim').setup{
	cmds = {
		default = "qf",
		external = {
			typescript = "deno run %",
			javascript = "node %",
			markdown = "glow %",
			python = "python3 %",
			rust = "rustc % && ./$fileBase && rm $fileBase",
			cpp = "g++ % -o $fileBase && ./$fileBase",
			go = "go run %",
			sh = "sh %",
		},
		internal = {
			lua = "luafile %",
			vim = "source %"
		}
	},
	ui = {
		startinsert = false,
		float = {
			border    = "none",
			height    = 0.8,
			width     = 0.8,
			border_hl = "FloatBorder",
			float_hl  = "Normal",
			blend     = 0
		},

		terminal = {
			position = "bot",
			size     = 10
		},

		quickfix = {
			position = "bot",
			size     = 10
		}
	}
}

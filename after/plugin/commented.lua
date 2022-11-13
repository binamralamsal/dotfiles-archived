require('commented').setup({
	hooks = {
		before_comment = require("ts_context_commentstring.internal").update_commentstring,
	},
	keybindings = {
		n = "<leader>/",
		v = "<leader>/",
		nl = "<leader>/",
	}
})

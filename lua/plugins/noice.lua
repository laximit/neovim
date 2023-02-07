require('noice').setup({
	lsp = {
		override = {
			['vim.lsp.util.convert_input_to_markdown_lines'] = true,
			["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
		},
		cmdline = {
			enabled = true,
			view = 'cmdline_popup',
			format = {
      	cmdline = { pattern = "^:", icon = "", lang = "vim" },
      	search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      	search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      	filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      	lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
      	help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      	input = {}, -- Used by input()
    	},
		},
		messages = {
    	enabled = true,
    	view = "notify",
    	view_error = "notify",
    	view_warn = "notify",
    	view_history = "messages",
    	view_search = "virtualtext",
  	},
 	 	popupmenu = {
    	enabled = true,
    	backend = "nui",
    	kind_icons = {},
  	},
  	redirect = {
    	view = "popup",
    	filter = { event = "msg_show" },
  	},
  	commands = {
   	 	history = {
     	 	view = "split",
      	opts = { enter = true, format = "details" },
      	filter = {
        	any = {
          	{ event = "notify" },
          	{ error = true },
          	{ warning = true },
          	{ event = "msg_show", kind = { "" } },
          	{ event = "lsp", kind = "message" },
        	},
      	},
    	},
    	last = {
      	view = "popup",
      	opts = { enter = true, format = "details" },
      	filter = {
     	   	any = {
          	{ event = "notify" },
          	{ error = true },
          	{ warning = true },
          	{ event = "msg_show", kind = { "" } },
          	{ event = "lsp", kind = "message" },
        	},
      	},
      	filter_opts = { count = 1 },
    	},
    	errors = {
      	view = "popup",
      	opts = { enter = true, format = "details" },
      	filter = { error = true },
      	filter_opts = { reverse = true },
    	},
  	},
  	notify = {
    	enabled = true,
    	view = "notify",
  	},
    hover = {
      enabled = true,
    },
    signature = {
      enabled = true,
      auto_open = {
        enabled = true,
        trigger = true,
        luasnip = true,
        throttle = 50,
      },
    },
    documentation = {
      view = "hover",
      opts = {
        lang = "markdown",
        replace = true,
        render = "plain",
        format = { "{message}" },
        win_options = { concealcursor = "n", conceallevel = 3 },
      },
    },
  },
  markdown = {
    hover = {
      ["|(%S-)|"] = vim.cmd.help, -- vim help links
      ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
    },
    highlights = {
      ["|%S-|"] = "@text.reference",
      ["@%S+"] = "@parameter",
      ["^%s*(Parameters:)"] = "@text.title",
      ["^%s*(Return:)"] = "@text.title",
      ["^%s*(See also:)"] = "@text.title",
      ["{%S-}"] = "@parameter",
    },
  },
  health = {
    checker = true,
  },
  smart_move = {
    enabled = true,
    excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
  },
})

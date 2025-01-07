-- Highlight, edit, and navigate code
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- Automatically run `:TSUpdate` after installation
  opts = {
    ensure_installed = { -- Languages to ensure are installed
      "bash",
      "c",
      "html",
      "lua",
      "luadoc",
      "markdown",
      "vim",
      "vimdoc",
    },
    auto_install = true, -- Automatically install missing parsers
    highlight = {
      enable = true, -- Enable syntax highlighting
      additional_vim_regex_highlighting = false, -- Set to `false` unless absolutely necessary
    },
    indent = {
      enable = true, -- Enable Treesitter-based indentation
      disable = { "ruby" }, -- Disable indentation for specific languages
    },
    incremental_selection = { -- Enables incremental selection
      enable = true,
      keymaps = {
	init_selection = "gnn", -- Start incremental selection
	node_incremental = "grn", -- Increment to the next node
	scope_incremental = "grc", -- Increment to the current scope
	node_decremental = "grm", -- Decrement to the previous node
      },
    },
    textobjects = { -- Enable text object manipulation
      select = {
	enable = true,
	lookahead = true, -- Automatically jump forward to the nearest text object
	keymaps = {
	  ["af"] = "@function.outer", -- Select around a function
	  ["if"] = "@function.inner", -- Select inside a function
	  ["ac"] = "@class.outer", -- Select around a class
	  ["ic"] = "@class.inner", -- Select inside a class
	},
      },
      move = {
	enable = true,
	set_jumps = true, -- Set jumps in the jumplist
	goto_next_start = {
	  ["]m"] = "@function.outer", -- Jump to the start of the next function
	  ["]]"] = "@class.outer", -- Jump to the start of the next class
	},
	goto_next_end = {
	  ["]M"] = "@function.outer", -- Jump to the end of the next function
	  ["]["] = "@class.outer", -- Jump to the end of the next class
	},
	goto_previous_start = {
	  ["[m"] = "@function.outer", -- Jump to the start of the previous function
	  ["[["] = "@class.outer", -- Jump to the start of the previous class
	},
	goto_previous_end = {
	  ["[M"] = "@function.outer", -- Jump to the end of the previous function
	  ["[]"] = "@class.outer", -- Jump to the end of the previous class
	},
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.install").prefer_git = true -- Use git for parser installation
    require("nvim-treesitter.configs").setup(opts)
  end,
}

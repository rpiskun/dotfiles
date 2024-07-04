-- the loading is important
local action_layout = require("telescope.actions.layout")
local actions = require("telescope.actions")
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  },
  pickers = {
    find_files = {
        -- find_command = { "fd", "-uuu", "--type", "f", "--strip-cwd-prefix" }
        -- find_command = { "fdfind", "-uuu", "--type", "f", "--strip-cwd-prefix", "--exclude", "test"},
        find_command = { "fdfind", "--type", "f", "--strip-cwd-prefix"},
        -- find_command = {"rg",  "--files", "--no-ignore", "--hidden"}
    },
	live_grep = {
      mappings = {
		    i = { ["<c-f>"] = actions.to_fuzzy_refine },
      },
    },
  },
  defaults = {
    file_ignore_patterns = {
        "*/tagsdb/*",
        "tags",
        "cscope.out",
        -- ".git"
    },
    mappings = { 
        i = {
            ["?"] = action_layout.toggle_preview,
        },
    },
    preview = {
        hide_on_startup = true,
    },
	vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      -- '-u',
    },
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')

local mappings = {

}

mappings.curr_buf = function()
    local opts = {
        sorting_strategy = "ascending",
    },
    require('telescope.builtin').current_buffer_fuzzy_find(opts)
end

return mappings

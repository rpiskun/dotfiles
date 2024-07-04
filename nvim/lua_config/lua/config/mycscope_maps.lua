require('cscope_maps').setup {
    prefix = "<leader>c",
    -- maps related defaults
    disable_maps = false, -- "true" disables default keymaps
    skip_input_prompt = false, -- "true" doesn't ask for input
  
    -- cscope related defaults
    cscope = {
      -- location of cscope db file
      db_file = "./tagsdb/cscope.out",
      -- cscope executable
      exec = "cscope", -- "cscope" or "gtags-cscope"
      -- choose your fav picker
      picker = "telescope", -- "telescope", "fzf-lua" or "quickfix"
      -- "true" does not open picker for single result, just JUMP
      skip_picker_for_single_result = true, -- "false" or "true"
      -- these args are directly passed to "cscope -f <db_file> <args>"
      db_build_cmd_args = { "-bqkv" },
      -- statusline indicator, default is cscope executable
      statusline_indicator = nil,
    }
  }
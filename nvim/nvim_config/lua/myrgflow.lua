require('rgflow').setup(
    {
        -- Set the default rip grep flags and options for when running a search via
        -- RgFlow. Once changed via the UI, the previous search flags are used for 
        -- each subsequent search (until Neovim restarts).
        -- cmd_flags = "--smart-case --fixed-strings --no-fixed-strings --no-ignore --ignore --max-columns 200"
		cmd_flags = "--smart-case --no-fixed-strings --no-ignore --max-columns 200"
		-- Exclude globs
            .. " -g !**/tagsdb/"
            .. " -g !tags",
            -- .. " -g !**/cscope.*"
            -- .. " -g !**/ctags.*"
			

        -- Mappings to trigger RgFlow functions
        default_trigger_mappings = true,
        -- These mappings are only active when the RgFlow UI (panel) is open
        default_ui_mappings = true,
        -- QuickFix window only mapping
        default_quickfix_mappings = true,
    }
)
local custom_statusline_location = function()
    return '%3l/%-3L'
end

require('lualine').setup {
    options = {
        theme  = 'gruvbox-material',
        icons_enabled = true,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {'progress'},
        lualine_z = { custom_statusline_location }
    },
}

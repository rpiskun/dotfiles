
-- Leader key
vim.g.mapleader = " " -- Space as the leader key

local keymap = vim.keymap
local cmd = vim.cmd

function fn_win_move(opts)
    local key = opts.fargs[1]
    local cur_window = vim.fn.winnr()
    vim.cmd('wincmd ' .. tostring(key))
    if cur_window == vim.fn.winnr() then
        if key == 'j' or key == 'k' then
            vim.cmd('wincmd s')
        else
            vim.cmd('wincmd v')
        end
    end

    vim.cmd('wincmd ' .. tostring(key))
end

vim.api.nvim_create_user_command('Winmove', fn_win_move, { nargs = 1 })

-- navigate windows
keymap.set('n', '<C-j>', ':Winmove j<CR>', {noremap = true})
keymap.set('n', '<C-k>', ':Winmove k<CR>', {noremap = true})
keymap.set('n', '<C-h>', ':Winmove h<CR>', {noremap = true})
keymap.set('n', '<C-l>', ':Winmove l<CR>', {noremap = true})

-- nerdtree
keymap.set("n", "<C-n>", ":NERDTreeToggle $HOME<CR>", {noremap = true})
keymap.set("n", "<Leader>d", ":NERDTreeFind<CR>", {noremap = true})

--
keymap.set("n", "<Leader><Space>", ":b#<CR>", {noremap = true})
keymap.set("n", "<F3>", ":TagbarToggle<CR>", {noremap = true})
keymap.set("n", "<F4>", ":set wrap!<CR>", {noremap = true})
keymap.set("n", "<F5>", ":set list!<CR>", {noremap = true})
keymap.set("n", "<F2>", ":noh<CR>", {noremap = true})

keymap.set("n", "n", "nzz", {noremap = true})
keymap.set("n", "N", "Nzz", {noremap = true})
keymap.set("n", "*", "*zz", {noremap = true})
keymap.set("n", "#", "#zz", {noremap = true})
keymap.set("n", "g*", "g*zz", {noremap = true})
keymap.set("n", "g#", "g#zz", {noremap = true})
keymap.set("n", "<C-d>", "<C-d>zz", {noremap = true})
keymap.set("n", "<C-u>", "<C-u>zz", {noremap = true})
keymap.set("n", "<Leader>x", ":cclose<CR>", {noremap = true})
keymap.set("n", "<Leader>gg", ":grep<Space>", {noremap = true})
keymap.set("n", "<Leader>gl", ":lgrep<Space>", {noremap = true})
keymap.set("n", "<Leader>qq", ":copen<CR>", {noremap = true})
keymap.set("n", "<Leader>ql", ":lopen<CR>", {noremap = true})
keymap.set("n", "[f", ":cprev", {noremap = true})
keymap.set("n", "]f", ":cnext", {noremap = true})
keymap.set("n", "[l", ":lprev", {noremap = true})
keymap.set("n", "]l", ":lnext", {noremap = true})
keymap.set("n", "<Leader>fd", ":bprevious<CR>:bdelete #<CR>", {noremap = true})

-- rg flow start
vim.keymap.set("n", "<Leader>a", require('rgflow').open, {noremap = true})
vim.keymap.set("n", "<Leader>A", require('rgflow').open_cword, {noremap = true})
-- rg flow end

-- telescope start
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {noremap = true})
-- keymap.set('n', '<leader>fg', builtin.live_grep, {noremap = true})
keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
keymap.set("n", "<leader>fG", live_grep_args_shortcuts.grep_word_under_cursor)
keymap.set('n', '<leader>fb', builtin.buffers, {noremap = true})
keymap.set('n', '<leader>fh', builtin.help_tags, {noremap = true})
keymap.set('n', '<leader>fr', builtin.tags, {noremap = true})
keymap.set('n', '<leader>fm', builtin.marks, {noremap = true})
keymap.set('n', '<leader>ft', builtin.treesitter, {noremap = true})
-- keymap.set("n", "<C-_>", require('config.mytelescope').curr_buf, {noremap = true})
keymap.set("n", "<C-_>", function()
    local opts = {
        sorting_strategy = "ascending",
    },
    require('telescope.builtin').current_buffer_fuzzy_find(opts)
end, {noremap = true})
-- telescope end

vim.api.nvim_create_user_command('BufOnly', function()
    vim.cmd(':%bd|e#|bd#')    
end, { nargs = 0 })

keymap.set("n", "<Leader>bb", ':BufOnly<CR>', {noremap = true})

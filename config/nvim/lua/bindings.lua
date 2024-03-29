local nmap = function(keys, func, desc)
    vim.keymap.set("n", keys, func, {buffer = bufnr, desc = desc})
end

local vmap = function(keys, func, desc)
    vim.keymap.set("v", keys, func, {buffer = bufnr, desc = desc})
end

local xmap = function(keys, func, desc)
    vim.keymap.set("x", keys, func, {buffer = bufnr, desc = desc})
end

local nvmap = function(keys, func, desc)
    vim.keymap.set({"n", "v"}, keys, func, {buffer = bufnr, desc = desc})
end

vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {silent = true})
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})

nmap("r", "<C-r>", "[r]edo")
nmap("n", "nzzzv", "Keep found string centered")
nmap("N", "Nzzzv", "Keep found string centered")
nmap("<leader>pv", vim.cmd.Ex, "[p]roject [v]iew")
nmap("<leader>rfn", ":let @+=@%<CR>", "[r]elative [f]ile [n]ame")

vmap("<leader>join", "<S-j>", "Line join")
vmap("J", ":m '>+1<CR>gv=gv", "Move selection down")
vmap("K", ":m '<-2<CR>gv=gv", "Move selection up")

xmap("<leader>p", "\"_d", "[p]aste before deleted")

nvmap("<leader>y", "\"+y", "[y]ank to system clipboard")
nvmap("<leader>d", "\"_d", "[d]elete to system clipboard")

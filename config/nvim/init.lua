-- Bootstrap lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Performance
require('lazy.core.cache').enable()

-- Load opt settings, keymap bindings, and auto commands
require('options')
require('bindings')
require('autocmds')

-- Load installed plugins and their configs
require('lazy').setup('plugins', {
	-- defaults = { lazy = true },
	-- checker= { enabled = true },
	ui = {
		border = 'rounded'
	},
	change_detection = {
		notify = false
	},
	performance = {
		cache = {
			enabled = true
		},
		reset_packpath = true,
		rtp = {
			reset = true
		}
	},
	-- debug = true
})

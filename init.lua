vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
local plugins = require("config.plugins")
local opts = require("config.lazyopts")

lazy.setup(plugins, opts)

require("gruvbox").setup({ transparent_mode = true })
vim.cmd.colorscheme("gruvbox")

require("config.autocmds")
require("config.mappings")
require("config.opts")

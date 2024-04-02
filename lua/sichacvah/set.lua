vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

local TAB_WIDTH = 2

vim.opt.tabstop = TAB_WIDTH
vim.opt.softtabstop = TAB_WIDTH
vim.opt.shiftwidth = TAB_WIDTH
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.o.background = 'dark'

local lsp_config = require("lspconfig")

lsp_config.rust_analyzer.setup({
    settings = {
        ["rust-analyzer"] = {
            procMacro = {
                enable = true
            },
        }
    }
})

vim.filetype.add({
  extension = {
    odin = "odin"
  }
})

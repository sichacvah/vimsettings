vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")


vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<C-b>", "<cmd>./build<CR>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set({"i"}, "jj", "<Esc>", {noremap = true})

local ls = require "luasnip"
vim.keymap.set({ "i", "s" }, "<C-k>", function ()
 if ls.jumpable(-1) then
  ls.jump(-1)
 end 
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function ()
 if ls.expand_or_jumpable() then
  ls.expand_or_jump()
 end 
end, { silent = true })

vim.keymap.set("n", "<leader><leader>o", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
vim.keymap.set("i", "<c-l>", function ()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)


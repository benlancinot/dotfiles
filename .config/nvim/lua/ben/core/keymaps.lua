vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- This keymap clears the search
keymap("n", "<CR>", ":noh<CR><CR>", { silent = true })

-- Save file by CTRL-S
keymap({ "n", "i" }, "<C-x>", "<cmd>wqa<cr>", { noremap = true })
keymap({ "n", "i" }, "<C-s>", "<cmd>w<cr>", { noremap = true })
keymap("n", "<C-c>", "<cmd>wq<cr>", { noremap = true })

keymap('n', '<leader>pa', 'ggVGp', { desc = 'Select all and paste', noremap = true, silent = true })
keymap('n', '<C-a>', 'ggVG', { desc = 'Select all', noremap = true, silent = true })
keymap("n", "<C-D>", "<cmd>%d+<CR>", { desc = "Remove all file text", silent = true })

-- Replace in file command mode
keymap('n', '<leader>r', ':%s/\\v//c<left><left><left>', { desc = 'Replace', noremap = true })

-- Redo
keymap('n', 'U', '<C-r>', {})

-- Split window
keymap("n", "ss", ":split<Return>", { desc = "Split window horizontally", noremap = true})
keymap("n", "sv", ":vsplit<Return>", { desc = "Split window vertically", noremap = true})

-- Move the line up
keymap({ "i", "n" }, "<A-Down>", "<Esc>:m .+1<CR>==gi", { desc = "Move the line up", silent = true })
keymap({ "i", "n" }, "<A-Up>", "<Esc>:m .-2<CR>==gi", { desc = "Move the line down", silent = true })

keymap("i", "<C-a>", "<Esc>^i", { desc = "Move to the beginning of the line", silent = true })
keymap("i", "<C-e>", "<Esc>$a", { desc = "Move to the end of the line", silent = true })

-- Better yank & paste
keymap("v", "p", '"_dP', { desc = "better paste", silent = true })
keymap({ "n", "v" }, "Y", "y$", { desc = "Yank to end of line", silent = true })

keymap({ "n", "i" }, "<C-k>", ":ZenMode<CR>", { desc = "Zen mode", noremap = true, silent = true })

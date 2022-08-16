local inoremap=require("keymap").inoremap
local nnoremap=require("keymap").nnoremap

inoremap("jj","<Esc>")

nnoremap("<leader><leader>","<C-^>")
nnoremap("<C-h>","<C-w><C-h>")
nnoremap("<C-j>","<C-w><C-j>")
nnoremap("<C-k>","<C-w><C-k>")
nnoremap("<C-l>","<C-w><C-l>")
nnoremap("<leader>w",":w<CR>")
nnoremap("tt",":split | resize 20 | term<cr>")
nnoremap("<leader>ff","<cmd>Telescope find_files<cr>")
nnoremap("<leader>dd","<cmd>Telescope lsp_document_diagnostics<cr>")
nnoremap("<leader>dw","<cmd>Telescope lsp_workspace_diagnostics<cr>")
nnoremap("<leader>fg","<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb","<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh","<cmd>Telescope help_tags<cr>")

vim.api.nvim_set_keymap('',"H","^",{})
vim.api.nvim_set_keymap('',"L","$",{})

vim.api.nvim_set_keymap('t', 'jj', [[<C-\><C-n>]], { noremap = true })
vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-n><C-w>h]], { noremap = true })
vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-n><C-w>j]], { noremap = true })
vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-n><C-w>k]], { noremap = true })
vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-n><C-w>l]], { noremap = true })
vim.cmd([[set wildcharm=<Tab>]])
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", { noremap = true, silent = true })


vim.api.nvim_set_keymap('n',"<Leader>dc","<Cmd>lua require'dap'.continue()<CR>",{noremap=true})
vim.api.nvim_set_keymap('n',"<Leader>dso","<Cmd>lua require'dap'.step_over()<CR>",{noremap=true})
vim.api.nvim_set_keymap('n',"<Leader>dsi","<Cmd>lua require'dap'.step_into()<CR>",{noremap=true})
vim.api.nvim_set_keymap('n',"<Leader>do","<Cmd>lua require'dap'.step_out()<CR>",{noremap=true})
vim.api.nvim_set_keymap('n',"<Leader>db","<Cmd>lua require'dap'.toggle_breakpoint()<CR>",{noremap=true})
vim.api.nvim_set_keymap('n',"<Leader>dB","<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",{noremap=true})
vim.api.nvim_set_keymap('n',"<Leader>dp","<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",{noremap=true})
vim.api.nvim_set_keymap('n',"<Leader>dr","<Cmd>lua require'dap'.repl.open()<CR>",{noremap=true})
vim.api.nvim_set_keymap('n',"<Leader>dl","<Cmd>lua require'dap'.run_last()<CR>",{noremap=true})

vim.api.nvim_set_keymap('n',"<leader>dn",":lua require('dap-python').test_method()<CR>",{noremap=true})
vim.api.nvim_set_keymap('n',"<leader>df",":lua require('dap-python').test_class()<CR>",{noremap=true})
-- vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

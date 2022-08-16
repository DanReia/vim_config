local venv = os.getenv("VIRTUAL_ENV")

command = string.format("%s/bin/python",venv)

vim.cmd([[autocmd Filetype python nnoremap <leader>b :Black<CR>]])
vim.g.python_host_prog= command
vim.g.python3_host_prog = command

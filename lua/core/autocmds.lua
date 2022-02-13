-- close dap-float filetypes with q
vim.cmd [[autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<CR>]]
vim.cmd [[autocmd FileType qf nnoremap <buffer><silent> q <cmd>close!<CR>]]

-- fugitive buffer mapping
vim.cmd [[autocmd FileType fugitive nnoremap <buffer><silent> q <cmd>close!<CR>]]
vim.cmd [[autocmd FileType fugitive nnoremap <buffer><silent><nowait> gPp <cmd>Dispatch! git push<CR>]]
vim.cmd [[autocmd FileType fugitive nnoremap <buffer><silent><nowait> gpp <cmd>Dispatch git fetch<CR>]]
vim.cmd [[autocmd FileType gitcommit nnoremap <buffer><silent> q <cmd>close!<CR>]]

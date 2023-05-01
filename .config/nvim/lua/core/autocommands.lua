vim.api.nvim_create_augroup('bufcheck', { clear = true })

-- format on safe
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.py", "*.lua", "*.R", "*.xml" },
    callback = function()
        vim.lsp.buf.format()
    end,
})
-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
    group    = 'bufcheck',
    pattern  = '*',
    callback = function() vim.highlight.on_yank { timeout = 200 } end
})
-- Return to last edit position when opening files
-- vim.api.nvim_create_autocmd('BufReadPost',  {
--     group    = 'bufcheck',
--     pattern  = '*',
--     callback = function()
--         if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
--             fn.setpos('.', fn.getpos("'\""))
--             -- vim.cmd('normal zz') -- how do I center the buffer in a sane way??
--             vim.cmd('silent! foldopen')
--         end end })

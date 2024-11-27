-- Fzf
local fzfnvim = require('fzf-lua')
vim.keymap.set('n', '<space>ff', fzfnvim.files, { noremap = true })
vim.keymap.set('n', '<space>fb', fzfnvim.buffers, { noremap = true })
vim.keymap.set('n', '<space>fs', fzfnvim.lsp_document_symbols, { noremap = true })
vim.keymap.set('n', '<space>fg', fzfnvim.grep, { noremap = true })

-- Tree
local tree_api = require('nvim-tree.api')

local function toggle_find()
    tree_api.tree.find_file({ open = true, focus = true, })
end

vim.keymap.set('n', 'tt', tree_api.tree.open, { noremap = true })
vim.keymap.set('n', 'tc', tree_api.tree.toggle, { noremap = true })
vim.keymap.set('n', 'tf', toggle_find, { noremap = true })

-- Line Number
local function toggle_line_number()
    vim.o.relativenumber = not vim.o.relativenumber
end
vim.keymap.set('n', '<space>n', toggle_line_number, { noremap = true })

-- Git Signs
local gitsigns = require('gitsigns')
vim.keymap.set('n', '<space>lb', gitsigns.toggle_current_line_blame, { noremap = true })

-- Diagnostic
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Lsp
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

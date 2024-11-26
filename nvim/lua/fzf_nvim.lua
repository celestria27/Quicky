local fzfnvim = require('fzf-lua')
fzfnvim.setup({
    'max-perf',
    winopts = {
        preview = { default = 'builtin' }
    }
})

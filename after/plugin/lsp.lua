local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({buffer = bufnr})

	vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = true})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

lsp.ensure_installed({
	'tsserver',
	'eslint'
})

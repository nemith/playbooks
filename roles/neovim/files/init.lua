-- helpers / lue aliases
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

-- plugins
require "paq" {
    'savq/paq-nvim';    -- paq-nvim manages itself
    'hrsh7th/nvim-compe';
    'nvim-treesitter/nvim-treesitter';
    'neovim/nvim-lspconfig';
    {'junegunn/fzf', run = fn['fzf#install']};
    'junegunn/fzf.vim';
    'ojroques/nvim-lspfuzzy';
    'marcopaganini/termschool-vim-theme';
}

--- tree sitter
require 'nvim-treesitter.configs'.setup {
    ensure_installed = 'maintained', 
    highlight = {enable = true}
}

--- lsp
local lsp = require 'lspconfig' 
lsp.gopls.setup{}

-- language providers
local py3_venv_prog = fn.stdpath('data')..'/py3venv/bin/python'
g['python3_host_prog'] = py3_venv_prog  -- set python3 to nvim specific venv
g['loaded_perl_provider'] = 0           -- disable perl
g['loaded_python_provider'] = 0         -- disable python2
g['loaded_ruby_provider'] = 0           -- disable ruby
g['loaded_node_provider'] = 0           -- disable node

cmd 'colorscheme termschool'

opt.completeopt = {'menuone', 'noselect'}  -- Completion options (for deoplete)

require 'compe'.setup {
    enabled = true;
}
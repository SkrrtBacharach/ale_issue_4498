-- luacheck: globals vim
require('plugins')

-- Set up plugin-specific config after init.lua parsing.
vim.cmd("autocmd VimEnter * call v:lua.plugin_settings()")

function _G.plugin_settings()

    if _G.packer_plugins["mason.nvim"] then
        require("mason").setup()

        -- Make text in LspInstall windows black-on-gray
        vim.cmd("highlight LspInstallerMuted ctermfg=black ctermbg=gray")
    end

    if _G.packer_plugins["mason-lspconfig.nvim"] then
        require("mason-lspconfig").setup({
        })
        vim.cmd("MasonInstall ansible-lint")
    end
end

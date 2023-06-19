-- https://github.com/williamboman/mason.nvim/discussions/57
local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
    vim.notify("没有找到 mason_lspconfig")
    return
end

mason_lspconfig.setup({
    ensure_installed = {
        -- "lua-language-server", "pyright", "taplo", "css-lsp", "html-lsp", "json-lsp", "typescript-language-server","ruff_lsp"
        "lua_ls", "pyright", "taplo", "cssls", "html", "jsonls", "tsserver"
    }
})
--  Mason 无法自动下载 lsp 以外的 linter formatter 等插件, 自定义命令通过Mason 下载 linter formatter 等插件
local tools = {"black", {'luacheck', auto_update = true}, "luaformatter", "ruff", "taplo", "sql-formatter"}

-- 依赖 Mason
local mr = require("mason-registry")

local show = vim.schedule_wrap(function(msg)
    vim.notify(string.format('[mason-tool-installer info] %s', msg), vim.log.levels.INFO)
end)

local show_error = vim.schedule_wrap(function(msg)
    vim.notify(string.format('[mason-tool-installer error] %s', msg), vim.log.levels.ERROR)
end)

local installed = false
local installed_packages = {}
local do_install = function(p, version)
    if version ~= nil then
        show(string.format('%s: updating to %s', p.name, version))
    else
        show(string.format('%s: installing', p.name))
    end
    p:once('install:success', function()
        show(string.format('%s: successfully installed', p.name))
    end)
    p:once('install:failed', function()
        show_error(string.format('%s: failed to install', p.name))
    end)
    -- if not installed then
    --     installed = true
    --     vim.schedule(function()
    --         vim.api.nvim_exec_autocmds('User', {pattern = 'MasonToolsStartingInstall'})
    --     end)
    -- end
    -- table.insert(installed_packages, p.name)
    p:install({version = version}):once('closed', vim.schedule_wrap(show(string.format('%s: installed', p.name))))
end

local mason_tool_update = function()
    for _, item in ipairs(tools) do
        local name, version, auto_update
        if type(item) == 'table' then
            name = item[1]
            version = item.version
            auto_update = item.auto_update
        else
            name = item
        end
        local p = mr.get_package(name)
        -- show(string.format('%s: updating to %s', name, version))
        if p:is_installed() then
            if version ~= nil then
                p:get_installed_version(function(ok, installed_version)
                    -- show(string.format('%s: get_installed_version %s', ok, installed_version))
                    if ok and installed_version ~= version then do_install(p, version) end
                end)
            elseif auto_update then
                p:check_new_version(function(ok, version)
                    -- show(string.format('%s: check_new_version %s', ok, version.latest_version))
                    if ok then do_install(p, version.latest_version) end
                end)
            end
        else
            do_install(p, version)
        end
    end
end

-- 全局用户命令
vim.api.nvim_create_user_command('MasonToolsUpdate', mason_tool_update, {force = true})

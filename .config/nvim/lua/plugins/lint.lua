    local cppcheckPattern = "[^:]+:(%d+):(%d+): (.*) %[(%a+)%]"
-- perprof.py:70:1: W191 indentation contains tabs
require('lint').linters.cppcheck = {
    cmd = 'cppcheck',
    stdin = false,
    -- args = {'--quiet', '--enable=performance', '--force', '--enable=style', 'error-exitcode=1', '--language=c++'},
    args = {'--quiet', '--enable=performance', '--force', '--enable=style', 'error-exitcode=1', '--language=c'},
    stream = 'stderr',
    parser = function(output, _)
        local result = vim.fn.split(output, "\n")
        local diagnostics = {}

        for _, message in ipairs(result) do
            local lineno, offset, msg, code = string.match(message, cppcheckPattern)
            if msg ~= nil then
                lineno = tonumber(lineno or 1) - 1
                offset = tonumber(offset or 1) - 1
                table.insert(diagnostics, {
                    source = 'cppcheck',
                    code = code,
                    range = {
                        ['start'] = {line = lineno, character = offset},
                        ['end'] = {line = lineno, character = offset + 1}
                    },
                    message = code .. ' ' .. msg,
                    severity = vim.lsp.protocol.DiagnosticSeverity.Error,
                })
            end
        end

        return diagnostics
    end
}

local cpplintPattern = "(.*):(%d+):  (.*) %[(.*)%] %[(%d+)%]"
-- parsers.c:53:34: error: Array 'buf[10]' accessed at index 99, which is out of bounds. [arrayIndexOutOfBounds]
require('lint').linters.cpplint = {
    cmd = 'cpplint',
    stdin = false,
    -- args = {'--filter=-legal,-whitespace/indent'},
    args = {'--filter=-legal,-whitespace/indent,-readability/casting'},
    stream = 'stderr',
    ignore_exitcode = true,
    parser = function(output, _)
        local result = vim.fn.split(output, "\n")
        local diagnostics = {}

        for _, message in ipairs(result) do
            local _, lineno, msg, code, level = string.match(message, cpplintPattern)
            level = math.max(4, tonumber(level))


            -- local severity_lsp
            -- if level == 5 or level == 4 then
            --     severity_lsp = vim.lsp.protocol.DiagnosticSeverity.Hint
            -- elseif level == 3 then
            --     severity_lsp = vim.lsp.protocol.DiagnosticSeverity.Information
            -- elseif level == 2 then
            --     severity_lsp = vim.lsp.protocol.DiagnosticSeverity.Warning
            -- else
            --     severity_lsp = vim.lsp.protocol.DiagnosticSeverity.Error
            -- end

            lineno = tonumber(lineno or 1) - 1
            if lineno == -1 then lineno = 1 end
            if lineno == 0 then lineno = 1 end

            table.insert(diagnostics, {
                source = 'cpplint',
                code = code,
                range = {
                    ['start'] = {line = lineno, character = 1},
                    ['end'] =   {line = lineno, character = 1}
                },
                message = code .. ' ' .. msg,
                severity = level
            })
        end

        return diagnostics
    end
}

require('lint').linters_by_ft = {
    c   = {'cppcheck', 'cpplint',},
    cpp = {'cppcheck', 'cpplint',},
    python = {'flake8'}
}
-- TODO: change
 vim.api.nvim_command('autocmd BufWritePost,InsertLeave,TextChanged <buffer> lua require("lint").try_lint()')
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', 'gv', '<cmd>lua require("lint").try_lint()<CR>', opts)


--[[
   [local flake8Pattern = "[^:]+:(%d+):(%d+): (%w+) (.*)"
   [require('lint').linters.your_linter_name = {
   [    cmd = 'flake8',
   [    stdin = false,
   [    args = {},
   [    stream = nil,
   [    parser = function(output, _)
   [        local result = vim.fn.split(output, "\n")
   [        local diagnostics = {}
   [
   [        for _, message in ipairs(result) do
   [            local lineno, offset, code, msg = string.match(message, flake8Pattern)
   [            lineno = tonumber(lineno or 1) - 1
   [            offset = tonumber(offset or 1) - 1
   [            table.insert(diagnostics, {
   [                source = 'flake8',
   [                code = code,
   [                range = {
   [                    ['start'] = {line = lineno, character = offset},
   [                    ['end'] = {line = lineno, character = offset + 1}
   [                },
   [                message = code .. ' ' .. msg,
   [                severity = vim.lsp.protocol.DiagnosticSeverity.Error,
   [            })
   [        end
   [
   [        return diagnostics
   [    end
   [}
   ]]

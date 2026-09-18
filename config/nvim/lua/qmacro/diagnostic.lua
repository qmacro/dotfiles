local M = {}

local original_vim_diagnostic_set = vim.diagnostic.set

local filterbuilder = function(filters)
  return function(diagnostic)
    for _, e in pairs(filters) do
      if e.code == diagnostic.code and e.source == diagnostic.source then
        -- if e.reason then
        --   print('Filtering out', diagnostic.source, '/', diagnostic.code, 'diagnostic -', e.reason)
        -- end
        return false
      end
    end
    return true
  end
end

M.exclude = function(filters)
  vim.diagnostic.set = function(ns, bufnr, diagnostics, opts)
    local filtered_diagnostics = vim.tbl_filter(filterbuilder(filters), diagnostics)
    original_vim_diagnostic_set(ns, bufnr, filtered_diagnostics, opts)
  end
end

return M

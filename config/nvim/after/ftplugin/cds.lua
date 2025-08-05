-- Settings to be able to navigate to cds resources in Node.js modules

-- Given a path p, add it to the 'path' if it exists
local addpath = function(p)
  if vim.uv.fs_stat(p) then vim.opt.path:append(p) end
end

-- Auto add .cds extension to files if necessary when nav with gf
vim.opt.suffixesadd = '.cds'

-- Ensure that the literal @ symbol is treated as part of a filename
-- (required as the CAP module names are in the @sap namespace)
vim.opt.isfname:append '@-@'

-- The standard module location
local moduledir = '/node_modules'

-- If a project-local npm install has been executed then projpath
-- will reflect the project-local node_modules dir
local projpath = vim.fs.root(0, 'package.json') .. moduledir

-- We can also add the CAP global based node_modules dir,
-- based on the location of the 'cds' executable
local cdsdkpath = vim.fs.dirname(vim.fn.exepath('cds'))
    .. '/../lib/node_modules/@sap/cds-dk'
    .. moduledir

-- Add them if they exist
addpath(projpath)
addpath(cdsdkpath)

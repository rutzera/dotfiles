-- initialize nvim modules
local nvim_modules = {
    'settings',
    'keymappings',
    'plugins',
    'lang',
    'config'
}

for i = 1, #nvim_modules, 1 do
    pcall(require, nvim_modules[i])
end

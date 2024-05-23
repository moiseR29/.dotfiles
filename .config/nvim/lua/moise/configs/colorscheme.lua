local h = {}

h.config = function ()
    --vim.cmd([[colorscheme enfocado]])
    vim.cmd([[
        set termguicolors
        let ayucolor="dark"
        colorscheme ayu
    ]])
end

return h
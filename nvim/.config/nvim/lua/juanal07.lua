require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<c-a>"] = function() print("adios") end
            }
        }
    }
}
require('telescope').load_extension('fzf')

function ColorMyPencils()
    vim.cmd("highlight EndOfBuffer guifg=#4c566a")
end

require('onenord').setup({
    custom_colors = {
        bg = "none"
    }
})

ColorMyPencils()

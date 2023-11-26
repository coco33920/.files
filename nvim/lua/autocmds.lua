local autocmd = vim.api.nvim_create_autocmd

vim.filetype.add { extension = { typ = "typst" } }
vim.filetype.add { extension = { skel = "skel", sk = "skel" } }


autocmd("FileType", {
    pattern  = { "markdown", "tex", "typst" },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop    = 2
        vim.opt_local.textwidth  = 80
    end,
})

autocmd("FileType", {
  pattern = {"rust","ocaml"},
  callback = function ()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop    = 4
    vim.opt_local.textwidth  = 120
  end
})

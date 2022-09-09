-- Use '``' instead of '`' (ASCII 96) in rst files.
-- let b:surround_96 = "``\r``"

local rst_surround_augroup = vim.api.nvim_create_augroup("RstSurround", { clear = true })
vim.api.nvim_create_autocmd(
  "FileType",
  {
    pattern = "rst",
    -- Implementation note, '\r' is replaced with the text.
    callback = function() vim.api.nvim_set_var('surround_96', '``\r``') end,
    group = rst_surround_augroup,
  }
)

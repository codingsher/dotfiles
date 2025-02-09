return {
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup({
      disable_filetype = { "TelescopePrompt", "vim" },  -- Disable for specific filetypes
      enable_check_bracket_line = true,                 -- Check brackets on same line
    })
  end
}


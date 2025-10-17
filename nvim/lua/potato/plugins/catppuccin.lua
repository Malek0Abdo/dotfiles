return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha", -- or latte, frappe, macchiato
    transparent_background = true,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd("colorscheme catppuccin")
  end,
}


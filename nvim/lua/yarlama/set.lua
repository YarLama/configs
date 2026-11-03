local options = {

  nu = true,
  relativenumber = true,

  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,

  wrap = true,
  linebreak = true,
  breakindent = true,
  showbreak = "↳ ",

  hlsearch = false,
  incsearch = true,

  termguicolors = true,
  scrolloff = 8,
  sidescrolloff = 0,

  splitright = true,
  splitbelow = true,

  updatetime = 50,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.mapleader = " "

local map = vim.keymap.set
local startWin = nil

map("n", "<leader>gg", function()
	if not startWin then
		startWin = vim.api.nvim_get_current_win()
		vim.cmd("Git")
		vim.cmd("wincmd L")
		vim.cmd("Git log --oneline")
		vim.cmd("wincmd j")
	end
end, { noremap = true, silent = true })

map("n", "<leader>gc", function()
	if startWin then
		vim.api.nvim_set_current_win(startWin)
		vim.cmd("wincmd o")
	else
		print("Press <leader>gg for open Git")
	end
  startWin = nil
end, { noremap = true, silent = true })

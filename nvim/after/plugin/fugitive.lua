local map = vim.keymap.set
local get_cur_win = vim.api.nvim_get_current_win
local is_win_exist = vim.api.nvim_win_is_valid
local git_windows = {
  log = nil,
  status = nil
}
local openKey = "<leader>gg"
local closeKey = "<leader>gq"
local commitKey = "<leader>gc"
local diffHeadKey = "<leader>gh"
local diffMasterKey = "<leader>gm"

local function close_win(tbl, key)
  local win_id = tbl[key]
  if (win_id) and vim.api.nvim_win_is_valid(win_id) then
    vim.api.nvim_win_close(win_id, true)
    tbl[key] = nil
  end
end

local function close_all_git_windows()
  close_win(git_windows, "log")
  close_win(git_windows, "status")
end

local function getUserInput(prompt)
  local ok, result = pcall(vim.fn.input, prompt)
  if not ok then
    return nil
  end
  return result
end

local function open_git()
  close_all_git_windows()
  vim.cmd("vertical Git")
  git_windows.status = get_cur_win()
  vim.wo[git_windows.status].number = false
  vim.wo[git_windows.status].relativenumber = false
  vim.cmd("Git log --oneline")
  git_windows.log = get_cur_win()
  vim.wo[git_windows.log].number = false
  vim.wo[git_windows.log].relativenumber = false

  if (git_windows.status) and vim.api.nvim_win_is_valid(git_windows.status) then
    vim.api.nvim_set_current_win(git_windows.status)
  end

  print("Press " .. closeKey .. " to close Git window")
end

local function close_git()
  if git_windows.status or git_windows.log then
    close_all_git_windows()
  else
    print("Press " .. openKey .. " for open Git window")
  end
end

local function commit()
  local commitMessage = getUserInput("Commit message: ")
  if commitMessage and commitMessage ~= "" then
    vim.cmd("Git commit -m '" .. commitMessage .. "'")
  end
  if (is_win_exist(git_windows.status)) then
    vim.api.nvim_set_current_win(git_windows.status)
    local buf_id = vim.api.nvim_win_get_buf(git_windows.status)
    local line_count = vim.api.nvim_buf_line_count(buf_id)
    local target_line = 4
    if line_count < target_line then
      target_line = line_count
    end
    vim.api.nvim_win_set_cursor(git_windows.status, { target_line, 0})
  end
end

map("n", diffHeadKey, ":Gvdiffsplit<CR>", { desc = "Show diff current file with HEAD" })
map("n", diffMasterKey, ":Gvdiffsplit master<CR>", { desc = "Show diff current file with master" })
map("n", openKey, open_git, { noremap = true, silent = true })
map("n", closeKey, close_git, { noremap = true, silent = true })
map("n", commitKey, commit, { noremap = true, silent = true })

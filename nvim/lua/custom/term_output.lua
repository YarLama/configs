local M = {}
M.win_id = nil
M.last_command = nil
M.job_id = nil

local function close_win_if_exist()
  if M.job_id then
    vim.fn.jobstop(M.job_id)
    M.job_id = nil
  end
  if M.win_id and vim.api.nvim_win_is_valid(M.win_id) then
    vim.api.nvim_win_close(M.win_id, true)
    M.win_id = nil
  end
end

local function execute_job(input, direction)
  close_win_if_exist()
  local old_win = vim.api.nvim_get_current_win()

  if direction == "h" then
    vim.cmd("split")
  else
    vim.cmd("vsplit")
  end

  local shell = vim.o.shell
  local shellcmd = vim.o.shellcmdflag

  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(win, buf)

  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"

  vim.wo[win].wrap = true
  vim.wo[win].linebreak = true
  vim.wo[win].breakindent = true
  vim.wo[win].number = false
  vim.wo[win].relativenumber = false

  M.win_id = win
  if vim.api.nvim_win_is_valid(old_win) then vim.api.nvim_set_current_win(old_win) end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { "Executing: " .. input, "" })
  M.job_id = vim.fn.jobstart({ shell, shellcmd, input }, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      if data and #data > 0 then vim.api.nvim_buf_set_lines(buf, -1, -1, false, data) end
    end,
    on_stderr = function(_, data)
      if data and #data > 0 then vim.api.nvim_buf_set_lines(buf, -1, -1, false, data) end
    end,
    on_exit = function(_, code)
      vim.api.nvim_buf_set_lines(buf, -1, -1, false, { "", "[Process completed with code: " .. code .. "]" })
    end
  })
end

function M.run_input_command(direction)
  vim.ui.input({ prompt = ">", kind = "shellcmdline" }, function(input)
    if not input or input == "" then return end
    M.last_command = input
    execute_job(input, direction)
  end)
end

function M.run_last_command(direction)
  if not M.last_command then
    print("Not have last command. Use run_input_command first")
    return
  end
  execute_job(M.last_command, direction)
end

function M.close_window()
  close_win_if_exist()
end

return M

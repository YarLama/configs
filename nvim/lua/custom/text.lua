local M = {}

function M.delete_surround_by_char(char)
  local pairs_map = {
    ["{"] = "}",
    ["("] = ")",
    ["["] = "]",
    ["'"] = "'",
    ["`"] = "`",
    ['"'] = '"',
  }

  local close_char = pairs_map[char]
  if not close_char then
    return
  end
  local current_win = vim.api.nvim_get_current_win()
  local start_cursor = vim.api.nvim_win_get_cursor(current_win)
  local start_pos, end_pos

  if char ~= close_char then
    local skip_expr = function()
      local cursor = vim.api.nvim_win_get_cursor(0)
      local capture = vim.treesitter.get_captures_at_pos(0, cursor[1] - 1, cursor[2])
      for _, cap in ipairs(capture) do
        if cap.capture == "comment" or cap.capture == "string" then
          return 1
        end
      end
      return 0
    end

    start_pos = vim.fn.searchpairpos(char, '', close_char, 'bW', skip_expr)
    end_pos = vim.fn.searchpairpos(char, '', close_char, 'nW', skip_expr)
  else
    start_pos = vim.fn.searchpos(char, '', 'bWn', vim.fn.line('.'))
    end_pos = vim.fn.searchpos(char, '', 'nW', vim.fn.line('.'))
  end

  if start_pos[1] == 0 or end_pos[1] == 0 then return end

  vim.api.nvim_buf_set_text(0, end_pos[1] - 1, end_pos[2] - 1, end_pos[1] - 1, end_pos[2], {})
  vim.api.nvim_buf_set_text(0, start_pos[1] - 1, start_pos[2] - 1, start_pos[1] - 1, start_pos[2], {})
  local final_row = start_cursor[1]
  local final_col = start_cursor[2]

  if start_pos[1] == start_cursor[1] and start_pos[2] <= start_cursor[2] then
    final_col = math.max(0, final_col - 1)
  end

  vim.api.nvim_win_set_cursor(current_win, { final_row, final_col })
end

return M

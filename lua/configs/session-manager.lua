require('session_manager').setup({
  autosave_last_session = true, -- Automatically save last session on exit and on session switch.
  autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
    'gitcommit',
  },
  autoload_mode = true,
  max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
})

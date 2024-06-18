require('gitsigns').setup {
  signcolumn = true,
  numhl = true,
  word_diff = false,
  current_line_blame = true,
  current_line_blame_formatter = '<abbrev_sha> <author> <committer_time> <summary>',
  current_line_blame_opts = {
    virt_text_pos = 'right_align',
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    -- Actions
    map('n', '<leader>hs', gs.stage_hunk)
    map('n', '<leader>hr', gs.reset_hunk)
    map('x', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    map('x', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line { full = true } end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>gd', gs.toggle_deleted)
    map('n', '<leader>tl', gs.toggle_linehl)
    map('n', '<leader>tw', gs.toggle_word_diff)

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}


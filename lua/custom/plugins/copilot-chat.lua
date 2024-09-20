return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    event = 'BufEnter',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or github/copilot.vim
      { 'nvim-lua/plenary.nvim' }, -- for curl, log wrapper
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      debug = false, -- Enable debugging
      -- See Configuration section for rest
    },
    keys = {
      vim.keymap.set('n', '<leader>cc', ':CopilotChat<cr>', { noremap = true, silent = true }),
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}

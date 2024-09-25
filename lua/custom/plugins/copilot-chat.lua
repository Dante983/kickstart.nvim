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
      -- default window options
      window = {
        layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
        width = 0.3, -- fractional width of parent, or absolute width in columns when > 1
        height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
        -- Options below only apply to floating windows
        relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
        border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
        row = nil, -- row position of the window, default is centered
        col = nil, -- column position of the window, default is centered
        title = 'Copilot Chat', -- title of chat window
        footer = nil, -- footer of chat window
        zindex = 1, -- determines if window is on top or below other floating windows
      },
    },
    keys = {
      vim.keymap.set('n', '<leader>cc', ':CopilotChat<cr>', { noremap = true, silent = true }),
      vim.keymap.set('n', '<leader>cf', function()
        require('CopilotChat').open {
          window = {
            layout = 'float',
            relative = 'cursor',
            width = 1,
            height = 0.4,
            row = 1,
          },
        }
      end, { desc = '[C]opilotChat [O]pen', noremap = true, silent = true }),
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}

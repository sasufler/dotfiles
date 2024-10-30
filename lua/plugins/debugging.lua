return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- Setup dap-ui
    dapui.setup {
      layouts = {
        {
          elements = {
            { id = 'scopes', size = 0.25 },
            { id = 'breakpoints', size = 0.25 },
            { id = 'stacks', size = 0.25 },
            { id = 'watches', size = 0.25 },
          },
          size = 40,
          position = 'left',
        },
        {
          elements = { 'repl', 'console' },
          size = 10,
          position = 'bottom',
        },
      },
      floating = {
        max_height = 0.3,
        max_width = 0.3,
      },
    }

    -- Open and close dap-ui automatically
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- C++ debugging configuration with gdb
    dap.adapters.cpp = {
      type = 'executable',
      command = 'gdb', -- Or use "lldb" if preferred
      args = { '--interpreter=mi' },
    }

    dap.configurations.cpp = {
      {
        name = 'Launch file',
        type = 'cpp',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {}, -- Add any arguments here if needed
        setupCommands = {
          {
            text = '-enable-pretty-printing',
            description = 'Enable pretty printing for gdb',
            ignoreFailures = false,
          },
        },
      },
    }

    -- Use the same configuration for C files as well
    dap.configurations.c = dap.configurations.cpp

    -- Keybindings for debugging
    vim.keymap.set('n', '<Leader>dt', function()
      dap.toggle_breakpoint()
    end, {})
    vim.keymap.set('n', '<Leader>dc', function()
      dap.continue()
    end, {})
  end,
}

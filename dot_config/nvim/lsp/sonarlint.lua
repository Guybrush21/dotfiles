local mason_path = vim.fn.expand '$MASON'
print('MASON path:', mason_path)
print('MASON exists:', vim.fn.isdirectory(mason_path))
return {
  cmd = {
    'sonarlint-language-server',
    -- Ensure that sonarlint-language-server uses stdio channel
    '-stdio',
    '-analyzers',
    -- vim.fn.expand '$MASON/share/sonarlint-analyzers/sonarpython.jar',
    -- vim.fn.expand '$MASON/share/sonarlint-analyzers/sonarcfamily.jar',
    vim.fn.expand '$MASON/share/sonarlint-analyzers/sonarjava.jar',
  },
  filetypes = {
    'cs',
    -- 'dockerfile',
    -- 'python',
    -- 'cpp',
    'java',
  },
  init_options = {
    showVerboseLogs = false,
    disableTelemetry = true, -- Optional: disable telemetry
    pathToCompileCommands = '', -- Optional: for C/C++ projects
    -- Add other options as needed
  },
}

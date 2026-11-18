return {
  'milanglacier/minuet-ai.nvim',
  event = 'InsertEnter',
  config = function()
    local session_id = 'ses_' .. vim.fn.sha256(vim.fn.getcwd() .. tostring(vim.uv.hrtime())):sub(1, 32)

    require('minuet').setup {
      provider = 'openai_fim_compatible',
      throttle = 1500,
      debounce = 600,
      n_completions = 3,
      provider_options = {
        openai_fim_compatible = {
          api_key = 'TERM',
          name = 'Ollama',
          end_point = 'http://localhost:11434/v1/completions',
          model = 'qwen2.5-coder:7b-base',
          -- optional = {
          --     max_tokens = 56,
          --     top_p = 0.9,
          -- },
        },
        openai_compatible = {
          api_key = 'OPENCODE_GO_API_KEY',
          end_point = 'https://opencode.ai/inference/go/openai/v1/chat/completions',
          model = 'deepseek-v4.1-flash',
          name = 'OpenCode Go',
          optional = {
            max_tokens = 56,
            thinking = { type = 'disabled' },
          },
          transform = {
            function(request)
              request.headers['x-opencode-session'] = session_id
              request.headers['User-Agent'] = 'minuet-ai.nvim/1.0'
              return request
            end,
          },
        },
      },
      virtualtext = {
        auto_trigger_ft = { '*' },
        keymap = {
          -- accept whole completion
          accept = '<C-j>',
          -- accept one line
          accept_line = '<C-l>',
          dismiss = '<C-h>',
          next = '<A-n>',
        },
      },
    }
  end,
}

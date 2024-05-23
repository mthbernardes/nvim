return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      yaml = {'actionlint',}
    }

    vim.api.nvim_create_autocmd({ "BufWritePre","BufEnter" }, {
      callback = function()
	lint.try_lint()
      end,
    })
  end
}

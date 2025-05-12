return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "lua", "clojure", "typescript" },
    auto_install = false,
    highlight = {
      enable = true,
      -- Add these two lines:
      max_file_lines = 10000, -- Disable for files with more than 10k lines
      additional_vim_regex_highlighting = false
    },
  },
  config = function(_, opts)
    -- Add error handling
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      vim.notify("TreeSitter not available", vim.log.levels.WARN)
      return
    end
    -- Set up with error handling
    pcall(configs.setup, opts)
    -- Add fallback for large files
    vim.api.nvim_create_autocmd("BufRead", {
      callback = function()
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
        if ok and stats and stats.size > max_filesize then
          vim.cmd("TSBufDisable highlight")
        end
      end,
    })
  end,
}

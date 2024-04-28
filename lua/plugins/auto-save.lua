return {
  'okuuva/auto-save.nvim',
  enabled = true,
  trigger_events = {
    immediate_save = { 'BufLeave', 'FocusLost' },
    defer_save = { 'InsertLeave', 'TextChanged' },
    cancel_defered_save = { 'InsertEnter' },
  },
}

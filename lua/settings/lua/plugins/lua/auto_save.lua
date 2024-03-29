require('auto-save').setup({
  enabled = true,
  trigger_events = {
    immediate_save = {'BufLeave', 'FocusLost'},
    defer_save = {'InsertLeave', 'TextChanged'},
    cancel_defered_save = {'InsertEnter'}
  },
  debounce_delay = 1000
})

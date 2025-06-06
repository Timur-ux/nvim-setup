require('auto-save').setup({
  enabled = true,
  trigger_events = {
    immediate_save = {'BufLeave', 'FocusLost'},
    defer_save = {'TextChanged','InsertLeave', 'TextChangedI'},
    cancel_deferred_save = {'InsertEnter'}
  },
  debounce_delay = 1000
})

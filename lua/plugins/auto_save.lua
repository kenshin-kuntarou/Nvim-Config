return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup {
      -- configurações opcionais, por exemplo:
      enabled = true,
      execution_message = {
        message = "AutoSave: saved",
        dim = 0.18,
        cleaning_interval = 1250,
      },
      events = {"InsertLeave", "TextChanged"},
      conditions = {
        exists = true,
        filename_is_not = {},
        filetype_is_not = {},
        modifiable = true,
      },
      write_all_buffers = false,
      on_off_commands = true,
      clean_command_line_interval = 0,
      debounce_delay = 135,
    }
  end,
}



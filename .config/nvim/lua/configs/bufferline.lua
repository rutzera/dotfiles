local M = {}

function M.config()
  local status_ok, bufferline = pcall(require, "bufferline")
  if not status_ok then
    return
  end

  local colors = {
    red = "#d47d85",
    red_1 = "#ec5f67",
    grey = "#abb2bf",
    grey_1 = "#787e87",
    grey_2 = "#D3D3D3",
    black = "#1e222a",
    black_1 = "#252931",
    black_2 = "#2c323c",
    green = "#95be76",
    none = "NONE",
  }

  bufferline.setup {
    options = {
      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      show_close_icon = true,
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 14,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      view = "multiwindow",
      show_buffer_close_icons = false,
      separator_style = "thin",
      always_show_bufferline = true,
      diagnostics = false,
    },

    highlights = {
      background = {
        fg = colors.grey_1,
        bg = colors.black_2,
      },

      -- Buffers
      buffer_selected = {
        fg = colors.grey,
        bg = colors.black,
        underline = true,
        undercurl = true,
        italic = true,

      },
      buffer_visible = {
        fg = colors.grey,
        bg = colors.black,
      },

      -- Diagnostics
      error = {
        fg = colors.red_1,
        bg = colors.red_1,
      },
      error_diagnostic = {
        fg = colors.red_1,
        bg = colors.red_1,
      },

      -- Close buttons
      close_button = {
        fg = colors.grey_1,
        bg = colors.black_2,
      },
      close_button_visible = {
        fg = colors.grey_2,
        bg = colors.black,
      },
      close_button_selected = {
        fg = colors.red,
        bg = colors.black,
      },
      fill = {
        fg = colors.grey_1,
        bg = colors.black_2,
      },
      indicator_selected = {
        fg = colors.black,
        bg = colors.black,
      },

      -- Modified
      modified = {
        fg = colors.red,
        bg = colors.black_2,
      },
      modified_visible = {
        fg = colors.grey,
        bg = colors.black,
      },
      modified_selected = {
        fg = colors.green,
        bg = colors.black,
      },

      -- Separators
      separator = {
        fg = colors.black_2,
        bg = colors.black_2,
      },
      separator_visible = {
        fg = colors.black,
        bg = colors.black,
      },
      separator_selected = {
        fg = colors.black_2,
        bg = colors.black_2,
      },

      -- Tabs
      tab = {
        fg = colors.grey,
        bg = colors.black,
      },
      tab_selected = {
        fg = colors.black,
        bg = colors.black,
      },
      tab_close = {
        fg = colors.black,
        bg = colors.black,
      },
    },
  }
end

return M

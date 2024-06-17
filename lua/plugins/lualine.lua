return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local function toggle_mode()
      local current_mode = vim.api.nvim_get_mode().mode
      if current_mode == "n" then
        -- Si le mode actuel est "normal", passer en mode "insert"
        vim.api.nvim_command("startinsert")
      elseif current_mode == "i" then
        -- Si le mode actuel est "insert", passer en mode "normal"
        vim.api.nvim_command("stopinsert")
      end
    end

    local function custom_location()
      local cur_line = vim.api.nvim_win_get_cursor(0)[1]
      local cur_col = vim.api.nvim_win_get_cursor(0)[2] + 1

      return string.format("%d|%d", cur_line, cur_col)
    end

    -- local function custom_progress()
    --   local total_line = vim.api.nvim_buf_line_count(0)
    --   local cur_line = vim.api.nvim_win_get_cursor(0)[1]
    --   local percentage = math.floor((cur_line / total_line) * 100)
    --
    --   return string.format("%d", percentage) .. "%%"
    -- end

    local function custom_progress()
      local cur = vim.fn.line(".")
      local total = vim.fn.line("$")
      if cur == 1 then
        return "1" .. "%%"
      elseif cur == total then
        return "100" .. "%%"
      else
        return string.format("%2d%%%%", math.floor(cur / total * 100))
      end
    end

    local function get_nvim_working_directory()
      local full_path = vim.fn.getcwd()
      local last_folder = vim.fn.fnamemodify(full_path, ":t")
      return last_folder
    end

    local function blank_separator()
      return " "
    end

    local colors = {
      gray = "#353535",
      pink = "#D16969",
      brown = "#CB7737",
      orange = "#E78A4E",
      yellow = "#D79921",
      red = "#F53C3C",
      black = "#000000ee",
      white = "#D4D4D4",
      blue = "#458588",
      light_blue = "#14ACB4",
    }

    local function modee()
      local mode = vim.fn.mode()
      if mode == "n" then
        -- NORMAL
        return { fg = colors.gray, bg = colors.blue }
      elseif mode == "i" then
        -- INSERT
        return { fg = colors.gray, bg = colors.pink }
      elseif mode == "V" then
        -- V-LINE
        return { fg = colors.gray, bg = colors.light_blue }
      elseif mode == "R" then
        return { fg = colors.gray, bg = colors.orange }
      else
        return { fg = colors.gray, bg = colors.blue }
      end
    end

    local custom_theme = {
      normal = {
        a = { fg = colors.blue, bg = colors.gray, gui = "bold" },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white, bg = colors.black },
        z = { fg = colors.yellow, bg = colors.gray },
      },
      visual = {
        a = { fg = colors.light_blue, bg = colors.gray, gui = "bold" },
        b = { fg = colors.pink, bg = colors.black },
        z = { fg = colors.yellow, bg = colors.gray },
      },
      inactive = {
        a = { fg = colors.white, bg = colors.gray, gui = "bold" },
        b = { fg = colors.black, bg = colors.brown },
        z = { fg = colors.yellow, bg = colors.gray },
      },
      replace = {
        a = { fg = colors.orange, bg = colors.gray },
        b = { fg = colors.pink, bg = colors.black },
        c = { fg = colors.white, bg = colors.black },
        z = { fg = colors.yellow, bg = colors.gray },
      },
      insert = {
        a = { fg = colors.pink, bg = colors.gray, gui = "bold" },
        b = { fg = colors.brown, bg = colors.black },
        c = { fg = colors.white, bg = colors.black },
        z = { fg = colors.yellow, bg = colors.gray },
      },
    }

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = custom_theme,
        component_separators = {
          left = "",
          right = "",
        },
        section_separators = {
          left = "",
          right = "",
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icons_enabled = true,
            icon = { " ", align = "left", color = modee },
            on_click = toggle_mode,
          },
        },
        lualine_b = {
          {
            blank_separator,
            padding = { left = 0, right = 0 },
          },
          {
            "filetype",
            colored = false, -- Displays filetype icon in color if set to true
            icon_only = true, -- Display only an icon for filetype
            icon = { align = "center" },
            color = { fg = colors.gray, bg = colors.red },
            padding = { left = 1, right = 0 },
            draw_empty = true,
          },
          {
            "filename",
            color = { fg = colors.red, bg = colors.gray, gui = "bold" },

            filetype_names = {
              TelescopePrompt = "Telescope",
              dashboard = "Dashboard",
              packer = "Packer",
              fzf = "FZF",
              alpha = "Alpha",
              NvimTree_1 = "NvimTreee",
            },

            file_status = false, -- Displays file status (readonly status, modified status)
            newfile_status = false, -- Display new file status (new file means no write after created)
            path = 0, -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory

            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            -- for other components. (terrible name, any suggestions?)
            symbols = {
              modified = "[+]", -- Text to show when the file is modified.
              readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
              unnamed = "Empty", -- Text to show for unnamed buffers.
              newfile = "[New]", -- Text to show for newly created file before first write
            },
          },
        },
        lualine_c = {
          {
            "branch",
            icons_enabled = true,
            icon = { "", align = "left", color = { fg = "grey" } },
            color = { fg = "#6E6E6E", gui = "bold" },
            separator = nil,
            cond = nil,
            draw_empty = false,
            padding = 1,
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = colors.orange },
          },
          { "encoding" },
          -- { custom_progress, padding = { left = 0, right = 1 } },
        },

        lualine_y = {},
        lualine_z = {
          {
            get_nvim_working_directory,
            color = { fg = colors.orange },
            icons_enabled = true,
            icon = { " ", color = { fg = "#353535", bg = colors.orange } },
          },
          {
            blank_separator,
            color = { bg = colors.black },
            padding = { left = 0, right = 0 },
          },
          {
            custom_location,
            icons_enabled = true,
            icon = { " ", align = "left", color = { fg = "#000000", bg = colors.yellow } },
          },
        },
      },
      -- inactive_sections = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = { "filename" },
      --   lualine_x = { "location" },
      --   lualine_y = {},
      --   lualine_z = {},
      -- },
      -- tabline = {},
      -- winbar = {},
      -- inactive_winbar = {},
      -- extensions = {},
    })
  end,
}

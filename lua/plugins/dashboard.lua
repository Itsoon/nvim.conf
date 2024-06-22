return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = {
    { "MaximilianLloyd/ascii.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
  },
  opts = function()
    vim.cmd("hi DashboardHeader guifg=#E24C3C")

    -- local logo = [[
    -- ███╗   ██╗██╗   ██╗██╗███╗   ███╗
    -- ████╗  ██║██║   ██║██║████╗ ████║
    -- ██╔██╗ ██║██║   ██║██║██╔████╔██║
    -- ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
    -- ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
    -- ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
    -- ]]
    --
    -- logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        statusline = false,
      },
      config = {
        -- header = vim.split(logo, "\n"),
        -- header = require("ascii").art.text.neovim.sharp,
        -- header = {
        --   [[                                                                       ]],
        --   [[                                                                       ]],
        --   [[                                                                       ]],
        --   [[                                                                       ]],
        --   [[  ██████   █████                   █████   █████  ███                  ]],
        --   [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
        --   [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
        --   [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
        --   [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
        --   [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
        --   [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
        --   [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
        --   [[                                                                       ]],
        --   [[                                                                       ]],
        --   [[                                                                       ]],
        -- },
        header = {
          [[                                                 ]],
          [[                                                 ]],
          [[                                                 ]],
          [[                               __                ]],
          [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
          [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
          [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
          [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
          [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
          [[                                                 ]],
          [[                                                 ]],
          [[                                                 ]],
        },
          -- stylua: ignore
          center = {
            { action = "Telescope find_files",                                 desc = " Find file",       icon = " ", key = "f" },
            { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
            { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
            { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
            { action = [[lua LazyVim.telescope.config_files()()]],                 desc = " Config",          icon = " ", key = "c" },
            { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
            { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
            { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
          },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "🚀 Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}

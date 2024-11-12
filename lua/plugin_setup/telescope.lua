-- Configuration for https://github.com/nvim-telescope/telescope.nvim.git
-- comprising the configuration for:
-- - `frecency`
-- - `tele_tabby`
-- - `lsp_handlers`
-- - `advanced_git_search`

local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup({

  defaults = {
    -- path_display = {
    --   shorten = 1,  -- Shorten directory names leaving 1 letter.
    -- },
    path_display = function(opts, path)
      local tail = require('telescope.utils').path_tail(path)
      return string.format("%s (%s)", tail, path)
    end,
  },

  pickers = {
    find_files = {
      theme = 'dropdown',
    }
  },

  extensions = {

    -- 'nvim-telescope/telescope-frecency.nvim'
    frecency = {
      ignore_patterns = {'*.git/*', '*/tmp/*'},
      workspaces = {
        ['humble'] = '/opt/ros/humble',
      },
    },

    -- 'TC72/telescope-tele-tabby.nvim'
    tele_tabby = {
      use_highlighter = true,
    },

    -- 'gbrlsnchs/telescope-lsp-handlers.nvim'
    lsp_handlers = {
      code_action = {
        telescope = require('telescope.themes').get_dropdown({}),
      },
    },

    -- 'aaronhallaert/advanced-git-search.nvim'
    advanced_git_search = {
      -- fugitive or diffview
      diff_plugin = 'diffview',
      -- customize git in previewer
      -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
      git_flags = {},
      -- customize git diff in previewer
      -- e.g. flags such as { "--raw" }
      git_diff_flags = {},
      -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
      show_builtin_git_pickers = false,
      entry_default_author_or_date = 'date', -- one of "author" or "date"
    },

    -- 'nvim-telescope/telescope-live-grep-args.nvim'
    live_grep_args = {
      -- If the prompt value does not begin with ', " or - the entire prompt is treated as a single argument
      -- This behaviour can be turned off by setting the auto_quoting option to false.
      auto_quoting = true,
      -- mappings = {
      --   i = {
      --     ["<C-\">"] = require('telescope-live-grep-args.actions').quote_prompt(), -- foo → "foo"
      --     ["<C-i>"] = require('telescope-live-grep-args.actions').quote_prompt({ postfix = " --iglob " }), -- foo → "foo" --iblog
      --     ["<C-t>"] = require('telescope-live-grep-args.actions').quote_prompt({ postfix = " -t " }), -- foo → "foo" -t
      --   },
      -- },
      -- Theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    },

    -- 'nvim-telescope/telescope-project.nvim'
    project = {
      on_project_selected = function(prompt_bufnr, hidden_files)
          -- Inspired from upstream find_project_files.
          -- M.find_project_files = function(prompt_bufnr, hidden_files)
          local project_actions = require('telescope._extensions.project.actions')
          local project_path = project_actions.get_selected_path(prompt_bufnr)
          actions._close(prompt_bufnr, true)
          vim.schedule(function()
            builtin.find_files({cwd = project_path, hidden = hidden_files})
          end)
        end,
    },
  },
})

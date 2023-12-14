  -- Configuration for https://github.com/nvim-neotest/neotest.
  -- A framework for interacting with tests.
  -- Also configuration for https://github.com/alfaix/neotest-gtest.

require('neotest').setup({
  adapters = {
    require('neotest-gtest').setup({}),
  },
})

-- Neotest-gtest.

local utils = require('neotest-gtest.utils')
-- local lib = require('neotest.lib')

local function is_test_file(file_path)
  local elems = vim.split(file_path, Path.path.sep, { plain = true })
  local filename = elems[#elems]
  if filename == "" then -- directory
    return false
  end
  local extsplit = vim.split(filename, ".", { plain = true })
  local extension = extsplit[#extsplit]
  local fname_last_part = extsplit[#extsplit - 1]
  local result = utils.test_extensions[extension]
    and (vim.startswith(filename, "test_") or vim.endswith(fname_last_part, "_test") or vim.startswith(filename, 'gtest'))
    or false
  return result
end

require('neotest-gtest').setup({
    -- dap.adapters.<this debug_adapter> must be set for debugging to work
    -- see "installation" section above for installing and setting it up
    debug_adapter = 'codelldb',

    -- Must be set to a function that takes a single string argument (full path to file)
    -- and returns its root. `neotest` provides a utility match_root_pattern,
    -- which will return the first parent directory containing one of these file names
    -- root = lib.files.match_root_pattern(
    --   'compile_commands.json',
    --   'compile_flags.txt',
    --   '.clangd',
    --   'init.lua',
    --   'init.vim',
    --   'build',
    --   '.git'
    -- ),
    root = function() return vim.fn.expand('$HOME/robocon_humble_ws') end,

    -- takes full path to the file and returns true if it's a test file, false otherwise
    -- by default, returns true for all cpp files starting with "test_" or ending with
    -- "_test"
    -- is_test_file = utils.is_test_file
    is_test_file = is_test_file
  }
)


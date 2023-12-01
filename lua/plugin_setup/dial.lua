-- Configuration for 'monaqa/dial.nvim'
-- Plugin for more `increment` (<C-a>)

local augend = require('dial.augend')

require("dial.config").augends:register_group{
  -- default augends used when no group name is specified
  default = {
    augend.date.alias["%-d.%-m."],    -- date 3.1.
    augend.date.alias["%H:%M"],       -- time
    augend.date.alias["%Y-%m-%d"],    -- date (2022-02-19, etc.)
    augend.date.alias["%d.%m."],      -- date 03.01.
    augend.date.alias["%d.%m.%Y"],    -- date 03.01.2023
    augend.date.alias["%d.%m.%y"],    -- date 03.01.23
    augend.integer.alias.decimal,     -- nonnegative decimal number (0, 1, 2, 3, ...)
    augend.integer.alias.hex,         -- nonnegative hex number  (0x01, 0x1a1f, etc.)
    augend.semver.alias.semver,      -- Semantic versioning
  },

  cpp = {
    augend.constant.alias.Alpha,      -- uppercase alphabet letter
    augend.constant.alias.alpha,      -- lowercase alphabet letter
    augend.constant.alias.bool,       -- true <-> false
    augend.date.alias["%-d.%-m."],    -- date 3.1.
    augend.date.alias["%H:%M"],       -- time
    augend.date.alias["%Y-%m-%d"],    -- date (2022-02-19, etc.)
    augend.date.alias["%d.%m."],      -- date 03.01.
    augend.date.alias["%d.%m.%Y"],    -- date 03.01.2023
    augend.date.alias["%d.%m.%y"],    -- date 03.01.23
    augend.integer.alias.decimal,     -- nonnegative decimal number (0, 1, 2, 3, ...)
    augend.integer.alias.hex,         -- nonnegative hex number  (0x01, 0x1a1f, etc.)
    augend.semver.alias.semver,      -- Semantic versioning
  },

  python = {
    augend.constant.alias.Alpha,      -- uppercase alphabet letter
    augend.constant.alias.alpha,      -- lowercase alphabet letter
    augend.date.alias["%-d.%-m."],    -- date 3.1.
    augend.date.alias["%H:%M"],       -- time
    augend.date.alias["%Y-%m-%d"],    -- date (2022-02-19, etc.)
    augend.date.alias["%d.%m."],      -- date 03.01.
    augend.date.alias["%d.%m.%Y"],    -- date 03.01.2023
    augend.date.alias["%d.%m.%y"],    -- date 03.01.23
    augend.integer.alias.decimal,     -- nonnegative decimal number (0, 1, 2, 3, ...)
    augend.integer.alias.hex,         -- nonnegative hex number  (0x01, 0x1a1f, etc.)
    augend.semver.alias.semver,      -- Semantic versioning

    augend.constant.new{
      elements = {"True", "False"},
    },
  },

}

-- Configuration for debugprint
-- https://github.com/andrewferrier/debugprint.nvim

local debugprint = require('debugprint')

local roscpp = {
    left = 'RCLCPP_INFO(LOGGER, "',
    left_var = 'RCLCPP_INFO_STREAM(LOGGER, "', -- `left_var` is optional, for 'variable' lines only; `left` will be used if it's not present
    mid_var = '" << (',
    right = '");',
    right_var = ')); // DEBUG',
}
-- debugprint.add_custom_filetypes({'cpp', roscpp})

local rosxml = {
    left = 'log_error("',
    left_var = 'log_error("',
    mid_var = '" .. tostring(',
    right = '")',
    right_var = ')) -- DEBUG',
}
-- debugprint.add_custom_filetypes({'xml', rosxml})

debugprint.setup({
    filetypes = {
        cpp = roscpp,
        xml = rosxml,
    },
    commands = {
        toggle_comment_debug_prints = "DebugPrintsToggleComment",
        delete_debug_prints = "DebugPrintsDelete",
    },
})


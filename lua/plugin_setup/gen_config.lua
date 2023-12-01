-- Configuration for `gen.nvim` plugin (https://github.com/David-Kunz/gen.vim/).

local gen = require('gen')

gen.setup({
  -- model = 'zephyr' -- default 'mistral:instruct'
})

-- Custom promts.
local prompts = gen.prompts

prompts['Fix_Code'] = {
  prompt = 'Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```',
  replace = true,
  extract = '```$filetype\n(.-)```'
}

prompts['ROS_Service'] = {
  prompt = 'you are an expert python programmer for ros 2 (robot operating system) and you write a ros2 node with executor that provides the service $input.',
  replace = false,
  extract = '```python\n(.-)```'
}

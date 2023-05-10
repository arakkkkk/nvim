local telescope = require('telescope')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local make_entry = require('telescope.make_entry')
local conf = require('telescope.config').values

local telescope_uploads = function(opts)
  opts = opts or {}
  local results = {"/Users/kouiti/localfile/plug-nvim/marktodo/README.md"}

  pickers
    .new(opts, {
      prompt_title = 'find in templates',
      results_title = 'templates',
      finder = finders.new_table({
        results = results,
        entry_maker = make_entry.gen_from_file(opts),
      }),
      previewer = conf.file_previewer(opts),
    })
    :find()
end

return telescope.register_extension({ exports = { telescope_uploads = telescope_uploads } })


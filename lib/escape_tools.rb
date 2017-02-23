require 'escape_tools/version'
require 'escape_tools/util'

require 'thermite/fiddle'

root_dir = File.expand_path(File.join('..', '..'), __FILE__)

puts root_dir
Thermite::Fiddle.load_module('initialize_escape_tools', {
  cargo_project_path: root_dir,
  ruby_project_path: root_dir
})

class EscapeTools
  class << self
    alias :escape_html :escapeHTML
  end
end

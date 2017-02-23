require 'cgi'

class CGI
  # CGI::escape and CGI::escapeHTML will now
  # use the EscapeTools::Util module methods
  extend EscapeTools::Util
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'escape_tools/version'

Gem::Specification.new do |spec|
  spec.name          = 'escape_tools'
  spec.version       = EscapeTools::VERSION
  spec.authors       = ['Michael Coyne']
  spec.email         = ['mikeycgto@gmail.com']

  spec.summary       = %q{Practical example of a Rust native extensions for CGI::escape and CGI::escapeHTML methods}
  spec.description   = %q{This gem provides alternative versions of CGI::escape and CGI::escapeHTML methods using a native Rust extension. There is an optional include which will create aliases for the original CGI methods to these new methods.}
  spec.homepage      = 'https://github.com/Sigient/cgi_escape-ruru'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.extensions << 'ext/Rakefile'

  spec.add_runtime_dependency 'thermite', '~> 0'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end

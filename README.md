# EscapeTools

This gem provides alternative versions of `CGI::escape` and
`CGI::escapeHTML` methods using a native Rust extension. There is an
optional include which will create aliases for the original CGI methods
to these new methods.

## Installation

Add this line to your application's Gemfile:

   gem 'escape_tools'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install escape_tools

## Usage

Two methods are provided by this gem

- `EscapeTools::escape` will URL encode a string. This is like
  `CGI::escape`
- `EscapeTools::escapeHTML` will escape HTML characters for a given
  string. This is like `CGI::escapeHTML`

## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake test` to run the tests. You can also run `bin/console`
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake
install`. To release a new version, update the version number in
`version.rb`, and then run `bundle exec rake release`, which will create
a git tag for the version, push git commits and tags, and push the
`.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/Michael Coyne/cgi_escape-ruru. This project is
intended to be a safe, welcoming space for collaboration, and
contributors are expected to adhere to the [Contributor
Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).


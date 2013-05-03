# Acme::Bleach

A silly gem that cleans your source file.

## Installation

Add this line to your application's Gemfile:

    gem 'acme-bleach'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acme-bleach

## Usage

Just require this gem and the first time you run your script your file will be
cleaned of all the messy things like printable characters.  The next time it
will still run as usual, but without any visible code.

    require 'acme/bleach'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

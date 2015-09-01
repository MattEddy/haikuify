# Haikuify
A tiny gem to build you Haikus

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'haikuify'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install haikuify

## Usage
```
require 'haikuify'

builder = HaikuBuilder.new(File.open('some_text.txt'))
builder.next_haiku
```

The builder expects an iterable object which yields lines that could potentially be used in a Haiku. It will count the syllables of the lines and construct a haiku for you!
## Contributing

1. Fork it ( https://github.com/[my-github-username]/haikuify/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
# haikuify

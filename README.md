# Activerecord::Nulls

A little bit of syntactic sugar for null objects in activerecord

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-nulls'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-nulls

## Usage

Given:
```ruby
class NullRecord
end

class Record < ActiveRecord::Base
  null NullRecord
end
```
```ruby
Record.find(-1)
=> #<NullRecord:0x007fe0ea326360>
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/activerecord-nulls/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

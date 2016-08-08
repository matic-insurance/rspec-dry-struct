# Rspec::Dry::Struct

RSpec matcher for easier [`dry-struct`](https://github.com/dry-rb/dry-struct) gem testing.

If you're unfamiliar with that gem, DEFINITELY visit [http://dry-rb.org](http://dry-rb.org/).

This is very early version, contributions are welcomed.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-dry-struct', group: :test
```

or inside gemspec

```ruby
spec.add_development_dependency 'rspec-dry-struct', '~> 0.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-dry-struct

## Usage

Let's assume you have such struct:

```ruby
class PersonName < Dry::Types::Struct
  attribute :first_name, Types::Strict::String
end
```

You can test it with:

```ruby
require 'spec_helper'

RSpec.describe PersonName do
  describe 'attributes' do
    subject { described_class }
    it { is_expected.to have_attributes(:first_name, Types::Strict::String) }
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rspec-dry-struct.


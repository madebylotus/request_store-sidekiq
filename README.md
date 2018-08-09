# RequestStore::Sidekiq

[![Build Status](https://travis-ci.org/madebylotus/request_store-sidekiq.svg?branch=master)](https://travis-ci.org/madebylotus/request_store-sidekiq)

Provides an easy integration between [RequestStore](https://github.com/steveklabnik/request_store) and [Sidekiq](https://github.com/mperham/sidekiq).

RequestStore allows you to easily create threadsafe code, and this middleware for Sidekiq brings that functionality to Sidekiq workers, or even ActiveJob backed Sidekiq.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'request_store-sidekiq', '~> 0.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install request_store-sidekiq

## Usage

### Rails

If using Rails, the Sidekiq middleware is already inserted into the Sidekiq middleware stack for you automatically and there is nothing to do.

### Without Rails

Without Rails, you'll need to insert the middleware into the stack yourself.  In a Rack app, that might be in the `config.ru` file for instance.

```ruby
# insert middleware

RequestStore::Sidekiq.add_custom_middleware!

run MyRackApp
```

## Configuration

```ruby
RequestStore::Sidekiq.configure do |config|
  # Enable store restoring a job execution.
  config.restore = true
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/madebylotus/request_store-sidekiq. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

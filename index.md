---
layout: default
---

# Ruroku
[![Build Status](https://secure.travis-ci.org/goshakkk/ruroku.png)](http://travis-ci.org/goshakkk/ruroku)
[![Dependency Status](https://gemnasium.com/goshakkk/ruroku.png?travis)](https://gemnasium.com/goshakkk/ruroku)

The better Ruby client for Heroku API, built on top of official
`heroku.rb` gem.

## Installation

Add this line to your application's Gemfile:

    gem 'ruroku'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruroku

## Usage

Start by initiating a connection with Heroku API:

    heroku = Ruroku::API.new api_key: YOUR_HEROKU_API_KEY

(You can leave out `:api_key` if `ENV['HEROKU_API_KEY']` is set
instead.)

Now you can interact with Heroku API using Ruroku.

It has support of:

* Apps
* Addons
* Collaborators
* Environment variables
* Domains
* Processes
* Releases
* Stacks
* Keys

Read more on [Ruroku README](https://github.com/goshakkk/ruroku/blob/master/README.md).

## Mock

For practice or testing you can also use a simulated Heroku:

      require 'ruroku'

      heroku = Ruroku::API.new api_key: API_KEY, mock: true

After that commands should still behave the same, but they will only modify some local data instead of updating the state of things on Heroku.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Released under the MIT license.

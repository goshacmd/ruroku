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

```ruby
heroku = Ruroku::API.new api_key: YOUR_HEROKU_API_KEY
```

(You can leave out `:api_key` if `ENV['HEROKU_API_KEY']` is set
instead.)

Now you can interact with Heroku API using Ruroku.

### Apps

Each API object has apps associated with the Heroku account. You can
access an Array of all the associated apps with `#apps`:

```ruby
heroku.apps
# => [#<App>, #<App>, #<App>]

app = heroku.apps.first
```

To get specific app:

```ruby
app = heroku.app 'app-name'

# or:

app = heroku.apps['app-name']
```

And access its properties such as:

* `id`
* `name`
* `stack`
* `git_url`
* `slug_size`
* `repo_size`
* `dynos`
* `workers`

Maintenance mode can be turned on and off:

```ruby
app.maintenance!
app.no_maintenance!
```

Also, imagine you've created another app after you you queried
`heroku.app`. To refresh collection of apps (or other collections:
addons, config vars, collaborators, and so on), just call `#reload` on
collection:

```ruby
apps.reload
```

### Addons

To get a list of addons used by a particular app:

```ruby
addons = app.addons
# => [#<Addon>, #<Addon>, #<Addon>]

addon = app.addons.first
```

It's possible perform several actions on addon collections:

```ruby
# Add an addon
addons.add 'addon:plan'

# Remove an addon
addons.delete 'addon-name'

# Upgrade an addon
addons.upgrade 'addon:new-plan'
```

Each addon object is associated with the application. You can delete
addons from the app by calling `#delete` method on the addon object as
well:

```ruby
addon.delete!
```

### Collaborators

List all app collaborators:

```ruby
collaborators = app.collaborators
```

get a specific collaborator:

```ruby
collaborators['guy@me.com']
```

and

```ruby
# Add a collaborator
collaborators.add 'email@me.com'

# Remove a collaborator
collaborators.delete 'email@me.com'
# or
collaborator.delete!
```

### Config variables

List all app config vars:

```ruby
config_vars = app.config_vars
```

Add or delete a config var:

```ruby
config_vars.add 'KEY' => 'value'
config_vars.delete 'KEY'

# or:

config_var.delete!
```

They can also be updated like that:

```ruby
config_var.value = 'new value'
```

Get/set a specific var:

```ruby
config_vars['DEBUG'] # => false
config_vars['DEBUG'] = true
```

And it'll instantly get updated.

### Domains

Access domains used by the application:

```ruby
domains = app.domains
```

Same as with other collection objects, they can be added or deleted:

```ruby
domains.add 'domain.com'
domains.delete 'domain.com'

# or:

domain.delete!
```

### Processes

Get current application processes:

```ruby
processes = app.processes
```

You can also run, restart, scale, and stop method collections:

```ruby
processes.run 'rake evolve'
processes.restart
processes.scale 'worker', 10
processes.stop 'ps' => 'run.1'
processes.stop 'type' => 'worker'
```

And access specific processes/process groups:

```ruby
processes['web.1']
processes['web']
```

### Releases

List all app releases:

```ruby
releases = app.releases
```

Get specific release:

```ruby
releases[2]
releases['v2']
```

Or a range of releases:

```ruby
releases[1..10]
```

And rollback to any release:

```ruby
releases.rollback 'v1'
```

### Stacks

List stacks, available for the app:

```ruby
app.stacks
```

Migrate the app to available stack:

```ruby
stacks.migrate 'stack-name'
```

### Logs

Get the Array of String log lines:

```ruby
app.logs
```

### User

Get User object associtaed with current heroku account:

```ruby
heroku.user
```

### Keys

Access all keys:

```ruby
keys = heroku.keys
```

Add a key:

```ruby
keys.add 'content of id_rsa.pub here...'
```

Delete specific key:

```ruby
keys.delete 'email@me.com'
key.delete!
```

Delete all keys:

```ruby
keys.delete_all
```

## Mock

For practice or testing you can also use a simulated Heroku:

```ruby
require 'ruroku'

heroku = Ruroku::API.new api_key: API_KEY, mock: true
```

After that commands should still behave the same, but they will only modify some local data instead of updating the state of things on Heroku.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Released under the MIT license.

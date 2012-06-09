# Ruroku

The Ruby client for Heroku API, built on top of official `heroku.rb`
gem.

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

### Apps

Each API object has apps associated with the Heroku account. You can
access an Array of all the associated apps with `#apps`:

    heroku.apps
    # => [#<App>, #<App>, #<App>]
    
    app = heroku.apps.first

You then can get additional app info:

    app.id
    app.name
    app.stack
    app.git_url
    app.slug_size
    app.repo_size
    app.dynos
    apps.workers
    # and a few less interesting ones

Maintenance mode can be turned on and off:

    app.maintenance!
    app.no_maintenance!

### Addons

To get a list of addons used by a particular app:

    addons = app.addons
    # => [#<Addon>, #<Addon>, #<Addon>]
    
    addon = app.addons.first

It's possible perform several actions on addon collections:

#### Add an addon

    addons.add 'addon:plan'

#### Remove an addon

    addons.delete 'addon-name'

#### Upgrade an addon

    addons.upgrade 'addon:new-plan'

Each addon object is associated with the application. You can delete
addons from the app by calling `#delete` method on the addon object as
well:

    addon.delete!

### Collaborators

List all app collaborators:

    collaborators = app.collaborators

#### Add a collaborator

    collaborators.add 'email@me.com'

#### Remove a collaborator

    collaborators.delete 'email@me.com'

or

    collaborator.delete!

### Config variables

List all app config vars:

    config_vars = app.config_vars

Add or delete a config var:

    config_vars.add 'KEY' => 'value'
    config_vars.delete 'KEY'

or:

    config_var.delete!

They can also be updated like that:

    config_var.value = 'new value'

And it'll instantly get updated.

### Domains

Access domains used by the application:

    domains = app.domains

Same as with other collection objects, they can be added or deleted:

    domains.add 'domain.com'
    domains.delete 'domain.com'

or:

    domain.delete!

### Processes

Get current application processes:

    processes = app.processes

You can also run, restart, scale, and stop method collections:

    processes.run 'rake evolve'
    processes.restart
    process.scale 'worker', 10
    process.stop 'ps' => 'run.1'
    process.stop 'type' => 'worker'

### Releases

List all app releases:

    releases = app.releases

And rollback to any release:

    releases.rollback 'v1'

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

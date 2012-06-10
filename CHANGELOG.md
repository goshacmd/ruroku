## Ruroku 0.0.3 (unreleased)

* Added release range finder: `releases[1..10]`
* Added release finder: `releases[2]` and `releases['v2']`
* Added process finder, which can return specific process or process
  group: `processes['web.1']` and `processes['web']`
* Added app, collaborator finders, now possible to `apps['app-name']` or
  `collaborators['email@me.com']`
* Added logs access
* Added config var access convenience method `#[]`, so it's possible to
  `app.config_vars['KEY']` to get specific `Ruroku::ConfigVar`
* Added `#rollback` to `Ruroku::Release`
* Added ability to rename apps
* Added ability to transfer app ownership
* Added ability to delete apps

## Ruroku 0.0.2 (Jun 10, 2012)

* Added collection reloading
* Added collection caching
* Added support of keys
* Finding app by name
* Added support of stacks

## Ruroku 0.0.1 (Jun 9, 2012)

* First public release (app, app addons, app collaborators, app config
  vars, app domains, app processes, app releases, app stacks)

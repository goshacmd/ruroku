module Ruroku
  # Public: Represents the Set of Apps.
  class AppSet < ResourceSet
    resource_class App
    collection_api_selector :get_apps

    # Map API methods to collection methods.
    #
    # Examples
    #
    #   apps.create name: 'another-app', stack: 'cedar'
    map_api create: :post_app

    # Public: Find an App with specified name.
    #
    # Examples
    #
    #   apps['test-app']
    #
    # Returns the App object.
    def [](app_name)
      select { |app| app.name == app_name }.first
    end
  end
end

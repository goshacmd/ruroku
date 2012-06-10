module Ruroku
  class AppSet < ResourceSet
    resource_class App
    collection_api_selector :get_apps

    # Map API methods to collection methods.
    #
    # Examples
    #
    #   apps.create 'another-app', 'cedar'
    map_api create: :post_app
  end
end

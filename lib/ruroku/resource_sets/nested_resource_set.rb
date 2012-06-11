module Ruroku
  class NestedResourceSet < ResourceSet
    attr_accessor :app

    def initialize(app, *args)
      self.app = app

      super app.api, *args
    end

    def build_resource(response)
      resource_class = self.class.resource_class
      resource_class.new app, response
    end

    def collection_query_params
      [app.name]
    end

    def self.map_api(methods)
      methods.each do |method_name, api_mapping|
        define_method method_name do |*args|
          api.send api_mapping, app.name, *args
        end
      end
    end
  end
end

module Ruroku
  class NestedResourceSet < ResourceSet
    attr_accessor :app

    def initialize(app, *args)
      self.app = app

      super api, args
    end

    def self.map_api(methods)
      methods.each do |method_name, api_mapping|
        define_method method_name do |resource_name|
          api.send api_mapping, app.name, resource_name
        end
      end
    end
  end
end

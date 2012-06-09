module Ruroku
  class ResourceSet < Array
    attr_accessor :app, :api

    def initialize(app, *args)
      self.app = app
      self.api = app.api

      super args
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

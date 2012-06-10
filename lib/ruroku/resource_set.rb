module Ruroku
  class ResourceSet < Array
    attr_accessor :api

    def initialize(api, *args)
      self.api = api

      super args

      query_collection_objects
    end

    def query_collection_objects
      collection_objects = api.send(self.class.collection_api_selector, *collection_query_params).body

      if collection_objects.instance_of? Array
        collection_objects.each do |response|
          self << build_resource(response)
        end
      elsif collection_objects.instance_of? Hash
        collection_objects.each do |key, value|
          self << build_resource(key: key, value: value)
        end
      end
    end

    def build_resource(response)
      resource_class = self.class.resource_class
      resource_class.new response
    end

    def collection_query_params
      []
    end

    def self.collection_api_selector(meth = nil)
      if meth
        @_collection_api_selector = meth
      else
        @_collection_api_selector
      end
    end

    def self.resource_class(klass = nil)
      if klass
        @_resource_class = klass
      else
        @_resource_class
      end
    end

    def self.map_api(methods)
      methods.each do |method_name, api_mapping|
        define_method method_name do |*args|
          api.send api_mapping, *args
        end
      end
    end
  end
end

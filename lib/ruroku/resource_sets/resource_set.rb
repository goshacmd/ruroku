module Ruroku
  # Public: Represents the set of Resources.
  class ResourceSet < Array
    attr_accessor :api

    def initialize(api, *args)
      self.api = api

      super args

      refresh_collection
    end

    # Public: Reload collection.
    #
    # Examples
    #
    #   collection.reload
    def reload
      clear
      query_collection_objects
    end

    # Internal: Query collection objects from API.
    def query_collection_objects
      collection_objects = api.send(self.class.collection_api_selector,
                                    *collection_query_params).body
    end

    # Internal: Refresh collection by querying new objects from API.
    def refresh_collection
      collection_objects = query_collection_objects

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

    # Internal: Build a resource from response.
    def build_resource(response)
      resource_class = self.class.resource_class
      resource_class.new api, response
    end

    # Internal: Get params for querying collection.
    def collection_query_params
      []
    end

    # Public: Set or get a collection API selector.
    # This selector method is then applied on the API object in order to
    # get collection objects.
    #
    # selector - The Symbol api selector.
    #
    # Examples
    #
    #   class KeySet < ResourceSet
    #     resource_class Key
    #     collection_api_selector :get_keys
    #   end
    def self.collection_api_selector(selector = nil)
      if selector
        @_collection_api_selector = selector
      else
        @_collection_api_selector
      end
    end

    # Public: Set or get a collection resource class.
    # Once collection was queried, the response is processed and
    # resources are created with resource class.
    #
    # Examples
    #
    #   class KeySet < ResourceSet
    #     resource_class Key
    #     collection_api_selector :get_keys
    #   end
    def self.resource_class(klass = nil)
      if klass
        @_resource_class = klass
      else
        @_resource_class
      end
    end

    # Public: Create mappings "set method -> api method".
    #
    # methods - The Hash of set method -> api method mappings.
    #
    # Examples
    #
    #   class KeySet < ResourceSet
    #     map_api add: :post_key
    #   end
    #
    #   So now, when we call #add on KeySet, api#post_key is executed.
    def self.map_api(methods)
      methods.each do |method_name, api_mapping|
        define_method method_name do |*args|
          api.send api_mapping, *args
        end
      end
    end
  end
end

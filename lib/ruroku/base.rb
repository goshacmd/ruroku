module Ruroku
  # Public: Base class for top-level resources.
  class Base
    include Virtus

    attr_accessor :api

    def initialize(api, attributes = {})
      self.api = api

      super attributes
    end

    # Public: Define resource id key.
    # It's used to represent the resource when talking to API. (It might be
    # the name of the app for App object, the email for Collaborator object,
    # and so on.)
    #
    # Examples
    #
    #   class App < Base
    #     attr_accessor :name
    #
    #     resource_id :name
    #   end
    def self.resource_id(id_key = nil)
      if id_key
        @_resource_id = id_key
      else
        @_resource_id
      end
    end

    # Public: Get the value of resource id.
    def resource_id
      send self.class.resource_id
    end

    def inspect
      if resource_id
        "<#{self.class} #{resource_id}>"
      else
        "<#{self.class}>"
      end
    end
  end
end

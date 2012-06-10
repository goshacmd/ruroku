module Ruroku
  class NestedBase < Base
    attr_accessor :app, :api

    def initialize(app, attributes = {})
      self.app = app

      super app.api, attributes
    end

    # Public: Define resource id key.
    def self.resource_id(id_key = nil)
      if id_key
        @_resource_id = id_key
      else
        @_resource_id
      end
    end

    # Public: Make resource deletable.
    def self.deletable_resource
      resource_name = name.demodulize.underscore

      define_method :delete! do
        api_method = "delete_#{resource_name}"
        resource_id = send self.class.resource_id
        api.send api_method, app.name, resource_id
      end
    end
  end
end

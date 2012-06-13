module Ruroku
  # Public: Base class for nested resources.
  class NestedBase < Base
    attr_accessor :app, :api

    def initialize(app, attributes = {})
      self.app = app

      super app.api, attributes
    end

    # Public: Declare nested resource as deletable.
    def self.deletable_resource
      resource_name = name.demodulize.underscore

      define_method :delete! do
        api_method = "delete_#{resource_name}"
        api.send api_method, app.name, resource_id
      end
    end
  end
end

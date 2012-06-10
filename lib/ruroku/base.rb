module Ruroku
  class Base
    include Virtus

    attr_accessor :api

    def initialize(api, attributes = {})
      self.api = api

      super attributes
    end

    # Public: Define resource id key.
    def self.resource_id(id_key = nil)
      if id_key
        @_resource_id = id_key
      else
        @_resource_id
      end
    end

    def inspect
      if self.class.resource_id
        resource_id = send self.class.resource_id
        "<#{self.class} #{resource_id}>"
      else
        "<#{self.class}>"
      end
    end
  end
end

module Ruroku
  class Base
    attr_accessor :api

    def initialize(api, attributes = {})
      self.api = api

      attributes.each do |key, value|
        method = "#{key}="
        send method, value if respond_to? method
      end
    end
  end
end

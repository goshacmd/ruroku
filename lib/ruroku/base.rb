module Ruroku
  class Base
    include Virtus

    attr_accessor :api

    def initialize(api, attributes = {})
      self.api = api

      super attributes
    end
  end
end

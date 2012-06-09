module Ruroku
  class Addon < NestedBase
    attr_accessor :name, :description, :url, :state, :price, :beta
    deletable :name

    # Public: Check if the addon is in beta.
    def beta?
      !!beta
    end

    def price=(value)
      @price = value
    end
  end
end

module Ruroku
  class Addon < NestedBase
    attribute :name, String
    attribute :description, String
    attribute :url, String
    attribute :state, String
    attribute :price, Hash
    attribute :beta, Boolean, default: false

    deletable :name
  end
end

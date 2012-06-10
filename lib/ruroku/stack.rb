module Ruroku
  class Stack < NestedBase
    attribute :name, String
    attribute :current, Boolean, default: false
    attribute :requested, Boolean, default: false
    attribute :beta, Boolean, default: false
  end
end

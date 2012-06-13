module Ruroku
  # Public: Represents the Stack resource.
  class Stack < NestedBase
    attribute :name, String
    attribute :current, Boolean, default: false
    attribute :requested, Boolean, default: false
    attribute :beta, Boolean, default: false

    resource_id :name
  end
end

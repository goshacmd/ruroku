module Ruroku
  # Public: Represents the Domain resource.
  class Domain < NestedBase
    attribute :id, Integer
    attribute :domain, String
    attribute :base_domain, String
    attribute :default, Boolean, default: false
    attribute :created_at, Time
    attribute :updated_at, Time

    resource_id :domain
    deletable_resource
  end
end

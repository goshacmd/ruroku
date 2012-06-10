module Ruroku
  class Domain < NestedBase
    attribute :id, Integer
    attribute :domain, String
    attribute :base_domain, String
    attribute :default, Boolean, default: false
    attribute :created_at, Time
    attribute :updated_at, Time

    deletable :domain
  end
end

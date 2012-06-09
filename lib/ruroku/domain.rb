module Ruroku
  class Domain < NestedBase
    attr_accessor :id, :domain, :base_domain, :default, :created_at, :updated_at
    deletable :domain

    def created_at=(value)
      @created_at = Time.parse value
    end

    def updated_at=(value)
      @updated_at = Time.parse value
    end
  end
end

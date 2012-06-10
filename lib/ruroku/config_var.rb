module Ruroku
  class ConfigVar < NestedBase
    attribute :key, String
    attribute :value, String

    resource_id :key
    deletable_resource

    def value=(new_value)
      if @value.nil?
        @value = new_value
      else
        api.put_config_vars app.name, key => new_value
        @value = new_value
      end
    end

    def inspect
      "<#{self.class} #{key} => #{value}>"
    end
  end
end

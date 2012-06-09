module Ruroku
  class ConfigVar < NestedBase
    attr_accessor :key, :value
    deletable :key

    def value=(new_value)
      if @value.nil?
        @value = new_value
      else
        api.put_config_vars app.name, key => new_value
        @value = new_value
      end
    end
  end
end

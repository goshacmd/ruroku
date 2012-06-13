module Ruroku
  # Represents the ConfigVar resource.
  class ConfigVar < NestedBase
    attribute :key, String
    attribute :value, String

    resource_id :key
    deletable_resource

    # Public: Set a ConfigVar value.
    # Sets instance variable if current value is nil.
    # If curren value is present, queries the api to update current var's
    # value, and updates instance variable.
    #
    # Examples
    #
    #   config_var = ConfigVar.new app # empty config var
    #   config_var.key = 'KEY'
    #   config_var.value = 'value' # doesn't send an api request
    #
    #   config_var = app.config_vars['KEY'] # non-empty config var
    #   config_var.value = 'value' # sends the api request & updates i-var
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

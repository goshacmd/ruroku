module Ruroku
  class ConfigVarSet < NestedResourceSet
    resource_class ConfigVar
    collection_api_selector :get_config_vars

    # Map API methods to collection methods.
    #
    # Examples
    #
    #   config_vars.add 'KEY' => 'value'
    #   config_vars.delete 'KEY'
    map_api add: :post_config_vars,
      delete: :delete_config_var
  end
end

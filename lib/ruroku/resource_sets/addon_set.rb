module Ruroku
  # Public: Represents the Set of Addons.
  class AddonSet < NestedResourceSet
    resource_class Addon
    collection_api_selector :get_addons

    # Map API methods to collection methods.
    #
    # Examples
    #
    #   addons.add 'addon-name'
    #   addons.upgrade 'addon-name'
    #   addons.delete 'addon-name'
    map_api add: :post_addon,
      upgrade: :put_addon,
      delete: :delete_addon
  end
end

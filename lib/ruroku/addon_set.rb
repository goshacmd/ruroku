module Ruroku
  class AddonSet < NestedResourceSet
    # Map API methods to collection methods.
    #
    # Examples
    #
    #   addons.add 'addon-name'
    #   addons.upgrade 'addon-name'
    #   addon.delete 'addon-name'
    map_api add: :post_addon,
      upgrade: :put_addon,
      delete: :delete_addon
  end
end

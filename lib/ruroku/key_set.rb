module Ruroku
  class KeySet < ResourceSet
    # Map API methods to collection methods.
    #
    # Examples
    #
    #   keys.add 'id rsa pub content here'
    #   keys.delete 'email@me.com'
    #   keys.delete_all
    map_api add: :post_key,
      delete: :delete_key,
      delete_all: :delete_keys
  end
end

module Ruroku
  class ReleaseSet < ResourceSet
    # Map API methods to collection methods.
    #
    # Examples
    #
    #   releases.rollback 'v1'
    map_api rollback: :post_release
  end
end

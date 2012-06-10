module Ruroku
  class ReleaseSet < NestedResourceSet
    resource_class Release
    collection_api_selector :get_releases

    # Map API methods to collection methods.
    #
    # Examples
    #
    #   releases.rollback 'v1'
    map_api rollback: :post_release
  end
end

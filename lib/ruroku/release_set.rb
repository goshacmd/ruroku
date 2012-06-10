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

    # Public: Find the specified release.
    #
    # Examples
    #
    #   releases[2]
    #   releases['v2']
    def [](release_name)
      release_name = "v#{release_name}" if release.instance_of? Fixnum

      select { |release| release.name == release_name }.first
    end
  end
end

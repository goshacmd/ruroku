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
    #   releases[1..10]
    #
    # Returns the ReleaseSet object if range of release numbers is passed,
    # the Release object otherwise.
    def [](release_name)
      if release_name.instance_of? Range
        select { |release| release_name.include? release.number }
      else
        release_name = "v#{release_name}" if release.instance_of? Fixnum

        select { |release| release.name == release_name }.first
      end
    end
  end
end

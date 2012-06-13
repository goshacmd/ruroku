module Ruroku
  # Public: Represents the Set of Domains.
  class DomainSet < NestedResourceSet
    resource_class Domain
    collection_api_selector :get_domains

    # Map API methods to collection methods.
    #
    # Examples
    #
    #   domains.add 'domain.com'
    #   domains.delete 'domain.com'
    map_api add: :post_domains,
      delete: :delete_domain
  end
end

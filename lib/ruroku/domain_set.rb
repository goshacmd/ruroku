module Ruroku
  class DomainSet < ResourceSet
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

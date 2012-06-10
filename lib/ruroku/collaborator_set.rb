module Ruroku
  class CollaboratorSet < NestedResourceSet
    resource_class Collaborator
    collection_api_selector :get_collaborators

    # Map API methods to collection methods.
    #
    # Examples
    #
    #   collaborators.add 'collaborator-email'
    #   collaborators.delete 'collaborator-email'
    map_api add: :post_collaborator,
      delete: :delete_collaborator
  end
end

module Ruroku
  class CollaboratorSet < NestedResourceSet
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

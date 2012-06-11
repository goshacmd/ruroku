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

    # Public: Find a Collaborator with specified email.
    #
    # Examples
    #
    #   collaborators['guy@me.com']
    #
    # Returns the Collaborator object.
    def [](collaborator_email)
      select { |collaborator| collaborator.email == collaborator_email }.first
    end
  end
end

module Ruroku
  # Represents the Collaborator resource.
  class Collaborator < NestedBase
    attribute :email, String
    attribute :access, String

    resource_id :email
    deletable_resource
  end
end

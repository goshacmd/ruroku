module Ruroku
  class Collaborator < NestedBase
    attribute :email, String
    attribute :access, String

    deletable :email
  end
end

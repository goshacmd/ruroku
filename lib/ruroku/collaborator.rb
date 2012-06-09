module Ruroku
  class Collaborator < NestedBase
    attr_accessor :email, :access
    deletable :email
  end
end

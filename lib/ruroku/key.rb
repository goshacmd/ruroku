module Ruroku
  class Key < Base
    attribute :email, String
    attribute :contents, String

    resource_id :email
  end
end

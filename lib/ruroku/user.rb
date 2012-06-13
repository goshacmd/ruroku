module Ruroku
  # Public: Represents the User resource.
  class User < Base
    attribute :id, Integer
    attribute :name, String
    attribute :email, String
    attribute :confirmed, Boolean, default: false
    attribute :verified, Boolean, default: false
    attribute :confirmed_at, Time
    attribute :verified_at, Time
    attribute :last_login, Time
    attribute :created_at, Time

    resource_id :email
  end
end

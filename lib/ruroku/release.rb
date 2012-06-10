module Ruroku
  class Release < NestedBase
    attribute :name, String
    attribute :descr, String
    attribute :user, String
    attribute :commit, String
    attribute :env, Hash
    attribute :addons, Array
    attribute :pstable, Hash
    attribute :created_at, Time
  end
end

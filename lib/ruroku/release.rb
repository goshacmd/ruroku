module Ruroku
  class Release < NestedBase
    attr_accessor :name, :descr, :user, :commit, :env, :addons, :pstable,
      :created_at

    def created_at=(value)
      @created_at = Time.parse value
    end
  end
end

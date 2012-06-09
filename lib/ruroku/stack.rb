module Ruroku
  class Stack < NestedBase
    attr_accessor :name, :current, :requested, :beta

    def current?
      !!current
    end

    def requested?
      !!requested
    end

    def beta?
      !!beta
    end
  end
end

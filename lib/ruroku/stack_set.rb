module Ruroku
  class StackSet < ResourceSet
    # Map API methods to collection methods.
    #
    # Examples
    #
    #   stack.migrate 'cedar'
    map_api migrate: :put_stack
  end
end

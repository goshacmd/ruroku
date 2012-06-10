module Ruroku
  class StackSet < NestedResourceSet
    # Map API methods to collection methods.
    #
    # Examples
    #
    #   stack.migrate 'cedar'
    map_api migrate: :put_stack
  end
end

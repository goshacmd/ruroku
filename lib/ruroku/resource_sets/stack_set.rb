module Ruroku
  # Public: Represents the Set of Stacks.
  class StackSet < NestedResourceSet
    resource_class Stack
    collection_api_selector :get_stack

    # Map API methods to collection methods.
    #
    # Examples
    #
    #   stack.migrate 'cedar'
    map_api migrate: :put_stack
  end
end

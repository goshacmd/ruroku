module Ruroku
  class ProcessSet < NestedResourceSet
    resource_class Process
    collection_api_selector :get_ps

    # Map API methods to collection methods.
    #
    # Examples
    #
    #   processes.run 'rake task'
    #   processes.restart
    #   processes.scale 'web', 10
    #   processes.stop 'ps' => 'web.1'
    #   processes.stop 'type' => 'web'
    map_api run: :post_ps,
      restart: :post_ps_restart,
      scale: :ps_scale,
      stop: :post_ps_stop

    # Public: Find either a process when specified full process name,
    # or a collection of processes, if specified a process type.
    #
    # Examples
    #
    #   processes['web.1']
    #   processes['web']
    def [](process_name)
      if process_name.include? '.'
        select { |process| process.type == process_name }
      else
        select { |process| process.process == process_name }.first
      end
    end
  end
end

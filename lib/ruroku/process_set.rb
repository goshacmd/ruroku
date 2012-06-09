module Ruroku
  class ProcessSet < ResourceSet
    # Publc: Run the command.
    #
    # command - The String command.
    def run(command)
      api.post_ps app.name, command
    end

    # Public: Restart all the processes.
    def restart
      api.post_ps_restart app.name
    end

    # Public: Scale processes.
    #
    # type - The String process type.
    # qty  - The Integer process quantity.
    def scale(type, qty)
      api.ps_scale app.name, type, qty
    end

    # Public: Stop the process(es).
    #
    # options - The Hash
    #           either :ps   - The String process name
    #               or :type - The String process type
    # 
    # Examples
    #
    #   processes.stop 'ps' => 'web.1'
    #   processes.stop 'type' => 'web'
    def stop(options)
      api.post_ps_stop app.name, options
    end
  end
end

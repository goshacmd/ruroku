module Ruroku
  class Process < NestedBase
    attr_accessor :process, :type, :command, :upid, :slug, :action,
      :pretty_state, :elapsed, :rendezvous_url, :attached, :transitioned_at

    # Public: Restart the process.
    def restart
      api.post_ps_restart app.name, 'ps' => process
    end

    # Public: Stop the process.
    def stop
      api.post_ps_stop app.name, 'ps' => process
    end

    # Public: Check if the process is attached.
    def attached?
      !!attached
    end

    def transitioned_at=(value)
      @transitioned_at = Time.parse value
    end
  end
end

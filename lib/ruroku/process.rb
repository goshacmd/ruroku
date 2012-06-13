module Ruroku
  # Public: Represents the Process resource.
  class Process < NestedBase
    attribute :process, String
    attribute :type, String
    attribute :command, String
    attribute :upid, String
    attribute :slug, String
    attribute :action, String
    attribute :state, String
    attribute :pretty_state, String
    attribute :elapsed, Integer
    attribute :rendezvous_url, String
    attribute :attached, Boolean, default: false
    attribute :transitioned_at, Time

    resource_id :process

    # Public: Restart the process.
    def restart
      api.post_ps_restart app.name, 'ps' => process
    end

    # Public: Stop the process.
    def stop
      api.post_ps_stop app.name, 'ps' => process
    end
  end
end

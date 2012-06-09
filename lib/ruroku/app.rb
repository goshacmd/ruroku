module Ruroku
  class App < Base
    attr_accessor :id, :name, :create_status, :created_at, :stack, :git_url,
      :requested_stack, :repo_migrate_status, :slug_size, :repo_size,
      :dynos, :workers

    # Public: Get addons associated with current app.
    def addons
      AddonSet.new self, *api.get_addons(name).body.map { |addon| Addon.new self, addon }
    end

    # Public: Get collaborators associated with current app.
    def collaborators
      CollaboratorSet.new self, *api.get_collaborators(name).body.map { |collaborator| Collaborator.new self, collaborator }
    end

    # Public: Get config vars associated with current app.
    def config_vars
      ConfigVarSet.new self, *api.get_config_vars(name).body.map { |key, value| ConfigVar.new self, key: key, value: value }
    end

    # Public: Get processes associated with current app.
    def processes
      ProcessSet.new self, *api.get_ps(name).body.map { |ps| Process.new self, ps }
    end

    # Public: Get releases associated with current app.
    def releases
      ReleaseSet.new self, *api.get_releases(name).body.map { |release| Release.new self, release }
    end

    # Public: Turn the maintenance mode on.
    def maintenance!
      api.post_app_maintenance name, '1'
    end

    # Public: Turn the maintenance mode off.
    def no_maintenance!
      api.post_app_maintenance name, '0'
    end

    def created_at=(value)
      @created_at = Time.parse value
    end

    def slug_size=(value)
      @slug_size = value.to_i.bytes
    end

    def repo_size=(value)
      @repo_size = value.to_i.bytes
    end
  end
end

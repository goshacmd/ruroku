module Ruroku
  class App < Base
    attribute :id, Integer
    attribute :name, String
    attribute :create_status, String
    attribute :stack, String
    attribute :requested_stack, String
    attribute :git_url, String
    attribute :repo_migrate_status, String
    attribute :slug_size, Integer
    attribute :repo_size, Integer
    attribute :dynos, Integer
    attribute :workers, Integer
    attribute :created_at, Time

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

    # Public: Get domains associated with current app.
    def domains
      DomainSet.new self, *api.get_domains(name).body.map { |domain| Domain.new self, domain }
    end

    # Public: Get processes associated with current app.
    def processes
      ProcessSet.new self, *api.get_ps(name).body.map { |ps| Process.new self, ps }
    end

    # Public: Get releases associated with current app.
    def releases
      ReleaseSet.new self, *api.get_releases(name).body.map { |release| Release.new self, release }
    end

    # Public: Get available stacks for current app.
    def stacks
      StackSet.new self, *api.get_stacks(name).body.map { |stack| Stack.new self, stack }
    end

    # Public: Turn the maintenance mode on.
    def maintenance!
      api.post_app_maintenance name, '1'
    end

    # Public: Turn the maintenance mode off.
    def no_maintenance!
      api.post_app_maintenance name, '0'
    end
  end
end

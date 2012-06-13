module Ruroku
  # Public: Represents the App resource and nested resources.
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

    resource_id :name

    # Public: Get addons associated with current app.
    def addons
      @addons ||= AddonSet.new self
    end

    # Public: Get collaborators associated with current app.
    def collaborators
      @collaborators ||= CollaboratorSet.new self
    end

    # Public: Get config vars associated with current app.
    def config_vars
      @config_vars ||= ConfigVarSet.new self
    end

    # Public: Get domains associated with current app.
    def domains
      @domains ||= DomainSet.new self
    end

    # Public: Get processes associated with current app.
    def processes
      @processes ||= ProcessSet.new self
    end

    # Public: Get releases associated with current app.
    def releases
      @releases ||= ReleaseSet.new self
    end

    # Public: Get available stacks for current app.
    def stacks
      @stacks ||= StackSet.new self
    end

    # Public: Get app logs.
    #
    # Examples
    #
    #   app.logs
    #
    # Returns the Array of String log lines.
    def logs
      log_url = api.get_logs(name).body
      log_uri = URI.parse log_url

      http = Net::HTTP.new log_uri.host, log_uri.port
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new log_uri.request_uri

      data = http.request request

      data.body.split "\n"
    end

    # Public: Turn the maintenance mode on.
    def maintenance!
      api.post_app_maintenance name, '1'
    end

    # Public: Turn the maintenance mode off.
    def no_maintenance!
      api.post_app_maintenance name, '0'
    end

    # Public: Rename the app.
    #
    # Examples
    #
    #   app.rename 'new-name'
    def rename(new_name)
      api.put_app name, name: new_name
      self.name = new_name
    end

    # Public: Transfer app ownership.
    #
    # Examples
    #
    #   app.transfer_ownership 'new_owner@me.com'
    def transfer_ownership(new_owner)
      api.put_app name, transfer_owner: new_owner
    end

    def delete!
      api_method = "delete_app"
      resource_id = name
      api.send api_method, name, resource_id
    end
  end
end

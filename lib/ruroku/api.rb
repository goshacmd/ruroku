module Ruroku
  class API
    attr_accessor :heroku_api

    def initialize(options = {})
      self.heroku_api = Heroku::API.new options
    end

    # Public: Get apps associated with current heroku account.
    #
    # Returns the Array[App].
    def apps
      @apps ||= heroku_api.get_apps.body.map { |app| App.new heroku_api, app }
    end

    # Public: Get specific app.
    def app(app_name)
      App.new heroku_api, heroku_api.get_app(app_name).body
    end

    # Public: Get keys associated with current heroku account.
    def keys
      @keys ||= heroku_api.get_keys.body.map { |key| Key.new heroku_api, key }
    end

    # Public: Get User object associated with current heroku account.
    def user
      @user ||= User.new heroku_api, heroku_api.get_user.body
    end

    def inspect
      "<#{self.class}>"
    end
  end
end

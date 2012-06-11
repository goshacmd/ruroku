module Ruroku
  class API
    attr_accessor :heroku_api

    def initialize(options = {})
      self.heroku_api = Heroku::API.new options
    end

    # Public: Get apps associated with current heroku account.
    def apps
      @apps ||= AppSet.new heroku_api
    end

    # Public: Get specific app.
    def app(app_name)
      App.new heroku_api, heroku_api.get_app(app_name).body
    end
    alias :[] :app

    # Public: Get keys associated with current heroku account.
    def keys
      @keys ||= KeySet.new heroku_api
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

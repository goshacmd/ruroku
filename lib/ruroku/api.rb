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
      heroku_api.get_apps.body.map { |app| App.new heroku_api, app }
    end
  end
end

require 'bundler/setup'

require 'ruroku'

require 'active_support/concern'
require 'helpers/app'
require 'helpers/keys'
require 'helpers/user'
require 'helpers/addon'
require 'helpers/collaborator'
require 'helpers/config_var'
require 'helpers/domain'
require 'helpers/process'
require 'helpers/release'
require 'helpers/stack'

module Helpers
  extend ActiveSupport::Concern

  included do
    let(:api) { Ruroku::API.new api_key: 'test', mock: true }
    let(:heroku) { api.heroku_api }

    def stub_api(heroku)
      heroku.stub(:get_apps).and_return apps_response
      heroku.stub(:get_app).and_return app_response
      heroku.stub(:get_keys).and_return keys_response
      heroku.stub(:get_user).and_return user_response

      heroku.stub(:get_addons).and_return addons_response
      heroku.stub(:get_collaborators).and_return collaborators_response
      heroku.stub(:get_config_vars).and_return config_vars_response
      heroku.stub(:get_domains).and_return domains_response
      heroku.stub(:get_ps).and_return processes_response
      heroku.stub(:get_releases).and_return releases_response
      heroku.stub(:get_stack).and_return stacks_response

      heroku
    end

    before do
      api.heroku_api = stubbed_api
    end
  end

  def stubbed_response(body)
    response = double 'response'
    response.stub(:body).and_return body

    response
  end

  def stubbed_api
    api = stub_api double('api')
    api.stub(:query_collection).and_return stubbed_response([])
    
    api
  end

  def stubbed_app
    app = double 'app'
    app.stub(:api).and_return stubbed_api
    app.stub(:name).and_return 'test-app'
    app.stub(:keys).and_return Ruroku::Key.new(app, {})

    app
  end
end

RSpec.configure do |config|
  config.include Helpers
end

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
  end

  def stubbed_response(body)
    response = double 'response'
    response.stub(:body).and_return body

    response
  end

  def stubbed_app
    app = double 'app'
    api = double 'api'
    app.stub(:api).and_return api
    app.stub(:name).and_return 'The App'

    app
  end
end

RSpec.configure do |config|
  config.include Helpers
end

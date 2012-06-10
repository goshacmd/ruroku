require 'bundler/setup'

require 'ruroku'

require 'active_support/concern'
require 'helpers/app'
require 'helpers/keys'
require 'helpers/user'

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
end

RSpec.configure do |config|
  config.include Helpers
end

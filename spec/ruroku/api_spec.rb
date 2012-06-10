require 'spec_helper'

describe Ruroku::API do
  include Helpers

  describe '#apps' do
    it 'gets apps from api' do
      heroku.should_receive(:get_apps).and_return apps_response
      api.apps
    end
    
    it 'returns array of apps' do
      heroku.stub(:get_apps).and_return apps_response
      
      apps = api.apps
      apps.instance_of?(Array).should be_true
      apps.each { |app| app.instance_of?(Ruroku::App).should be_true }
    end
  end

  describe '#app' do
    it 'gets app from api' do
      heroku.should_receive(:get_app).and_return app_response
      api.app 'test-app'
    end

    it 'returns app' do
      heroku.stub(:get_app).and_return app_response

      app = api.app 'test-app'
      app.instance_of?(Ruroku::App).should be_true
    end
  end

  describe '#keys' do
    it 'gets keys from api' do
      heroku.should_receive(:get_keys).and_return keys_response
      api.keys
    end

    it 'returns array of keys' do
      heroku.stub(:get_keys).and_return keys_response

      keys = api.keys
      keys.instance_of?(Array).should be_true
      keys.each { |key| key.instance_of?(Ruroku::Key).should be_true }
    end
  end

  describe '#user' do
    it 'gets user from api' do
      heroku.should_receive(:get_user).and_return user_response
      api.user
    end

    it 'returns the user' do
      heroku.stub(:get_users).and_return user_response

      user = api.user
      user.instance_of?(Ruroku::User).should be_true
    end
  end
end

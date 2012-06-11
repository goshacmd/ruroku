require 'spec_helper'

describe Ruroku::API do
  include Helpers

  describe '#apps' do
    it 'gets apps from api' do
      heroku.should_receive(:get_apps)
      api.apps
    end
    
    it 'returns array of apps' do
      apps = api.apps
      apps.instance_of?(Ruroku::AppSet).should be_true
      apps.each { |app| app.instance_of?(Ruroku::App).should be_true }
    end
  end

  describe '#app' do
    it 'gets app from api' do
      heroku.should_receive(:get_app)
      api.app 'test-app'
    end

    it 'returns app' do
      app = api.app 'test-app'
      app.instance_of?(Ruroku::App).should be_true
    end
  end

  describe '#[]' do
    it 'gets app from api' do
      heroku.should_receive(:get_app)
      api['test-app']
    end

    it 'returns app' do
      app = api['test-app']
      app.instance_of?(Ruroku::App).should be_true
    end
  end

  describe '#keys' do
    it 'gets keys from api' do
      heroku.should_receive(:get_keys)
      api.keys
    end

    it 'returns key set' do
      keys = api.keys
      keys.instance_of?(Ruroku::KeySet).should be_true
      keys.each { |key| key.instance_of?(Ruroku::Key).should be_true }
    end
  end

  describe '#user' do
    it 'gets user from api' do
      heroku.should_receive(:get_user)
      api.user
    end

    it 'returns the user' do
      user = api.user
      user.instance_of?(Ruroku::User).should be_true
    end
  end
end

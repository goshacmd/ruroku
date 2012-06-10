require 'spec_helper'

describe Ruroku::App do
  before do
    @app = Ruroku::App.new api, app_data
  end

  describe '#addons' do
    it 'gets addons from api'
    it 'returns array of addons'
  end

  describe '#collaborators' do
    it 'gets collaborators from api'
    it 'returns array of collaborators'
  end

  describe '#config_vars' do
    it 'gets config vars from api'
    it 'returns array of config vars'
  end

  describe '#domains' do
    it 'gets domains from api'
    it 'returns array of domains'
  end

  describe '#processes' do
    it 'gets processes from api'
    it 'returns array of processes'
  end

  describe '#releases' do
    it 'gets releases from api'
    it 'returns array of releases'
  end

  describe '#stacks' do
    it 'gets stacks from api'
    it 'returns array of stacks'
  end

  describe '#maintenance!' do
    it 'turns maintenance mode on' do
      api.should_receive(:post_app_maintenance).with(@app.name, '1')
      @app.maintenance!
    end
  end

  describe '#no_maintenance' do
    it 'turns maintenance mode off' do
      api.should_receive(:post_app_maintenance).with(@app.name, '0')
      @app.no_maintenance!
    end
  end
end

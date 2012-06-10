require 'spec_helper'

describe Ruroku::App do
  before do
    @app = Ruroku::App.new heroku, app_data
  end

  describe '#addons' do
    it 'gets addons from api' do
      heroku.should_receive(:get_addons).and_return addons_response
      @app.addons
    end
    
    it 'returns addon set' do
      heroku.stub(:get_addons).and_return addons_response
      
      addons = @app.addons
      addons.instance_of?(Ruroku::AddonSet).should be_true
      addons.each { |addon| addon.instance_of?(Ruroku::Addon).should be_true }
    end
  end

  describe '#collaborators' do
    it 'gets collaborators from api' do
      heroku.should_receive(:get_collaborators).and_return collaborators_response
      @app.collaborators
    end
    
    it 'returns collaborator set' do
      heroku.stub(:get_collaborators).and_return collaborators_response
      
      collaborators = @app.collaborators
      collaborators.instance_of?(Ruroku::CollaboratorSet).should be_true
      collaborators.each { |collaborator| collaborator.instance_of?(Ruroku::Collaborator).should be_true }
    end
  end

  describe '#config_vars' do
    it 'gets config vars from api' do
      heroku.should_receive(:get_config_vars).and_return config_vars_response
      @app.config_vars
    end
    
    it 'returns config var set' do
      heroku.stub(:get_config_vars).and_return config_vars_response
      
      config_vars = @app.config_vars
      config_vars.instance_of?(Ruroku::ConfigVarSet).should be_true
      config_vars.each { |config_var| config_var.instance_of?(Ruroku::ConfigVar).should be_true }
    end
  end

  describe '#domains' do
    it 'gets domains from api' do
      heroku.should_receive(:get_domains).and_return domains_response
      @app.domains
    end
    
    it 'returns domain set' do
      heroku.stub(:get_domains).and_return domains_response
      
      domains = @app.domains
      domains.instance_of?(Ruroku::DomainSet).should be_true
      domains.each { |domain| domain.instance_of?(Ruroku::Domain).should be_true }
    end
  end

  describe '#processes' do
    it 'gets processes from api' do
      heroku.should_receive(:get_ps).and_return processes_response
      @app.processes
    end
    
    it 'returns process set' do
      heroku.stub(:get_ps).and_return processes_response
      
      processes = @app.processes
      processes.instance_of?(Ruroku::ProcessSet).should be_true
      processes.each { |process| process.instance_of?(Ruroku::Process).should be_true }
    end
  end

  describe '#releases' do
    it 'gets releases from api' do
      heroku.should_receive(:get_releases).and_return releases_response
      @app.releases
    end
    
    it 'returns release set' do
      heroku.stub(:get_releases).and_return releases_response
      
      releases = @app.releases
      releases.instance_of?(Ruroku::ReleaseSet).should be_true
      releases.each { |release| release.instance_of?(Ruroku::Release).should be_true }
    end
  end

  describe '#stacks' do
    it 'gets stacks from api' do
      heroku.should_receive(:get_stacks).and_return stacks_response
      @app.stacks
    end
    
    it 'returns stack set' do
      heroku.stub(:get_stacks).and_return stacks_response
      
      stacks = @app.stacks
      stacks.instance_of?(Ruroku::StackSet).should be_true
      stacks.each { |stack| stack.instance_of?(Ruroku::Stack).should be_true }
    end
  end

  describe '#maintenance!' do
    it 'turns maintenance mode on' do
      heroku.should_receive(:post_app_maintenance).with(@app.name, '1')
      @app.maintenance!
    end
  end

  describe '#no_maintenance' do
    it 'turns maintenance mode off' do
      heroku.should_receive(:post_app_maintenance).with(@app.name, '0')
      @app.no_maintenance!
    end
  end
end

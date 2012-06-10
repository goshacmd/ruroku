require 'spec_helper'

describe Ruroku::ProcessSet do
  before do
    @set = Ruroku::ProcessSet.new stubbed_app
    @set_api = @set.api
  end

  describe '#run' do
    it 'maps to post_ps api method' do
      @set_api.should_receive(:post_ps).with @set.app.name, 'rake task'
      @set.run 'rake task'
    end
  end

  describe '#restart' do
    it 'maps to post_ps_restart api method' do
      @set_api.should_receive :post_ps_restart
      @set.restart
    end
  end

  describe '#scale' do
    it 'maps to ps_scale api method' do
      @set_api.should_receive(:ps_scale).with @set.app.name, 'worker', 10
      @set.scale 'worker', 10
    end
  end

  describe '#stop' do
    it 'maps to post_ps_stop api method' do
      @set_api.should_receive(:post_ps_stop).with @set.app.name, 'ps' => 'web.1'
      @set.stop 'ps' => 'web.1'
    end
  end
end

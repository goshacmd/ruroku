require 'spec_helper'

describe Ruroku::ConfigVarSet do
  before do
    @set = Ruroku::ConfigVarSet.new stubbed_app
    @set_api = @set.api
  end

  describe '#add' do
    it 'maps to post_config_vars api method' do
      @set_api.should_receive :post_config_vars
      @set.add 'KEY' => 'value'
    end
  end

  describe '#delete' do
    it 'maps to delete_config_var api method' do
      @set_api.should_receive :delete_config_var
      @set.delete 'KEY'
    end
  end

  describe '#[]' do
    it 'finds specified ConfigVar' do
      config_var = @set['KEY1']
      config_var.key.should == 'KEY1'
      config_var.value.should == 'value'
      config_var.should == @set.first
    end
  end
end

require 'spec_helper'

describe Ruroku::StackSet do
  before do
    @set = Ruroku::StackSet.new stubbed_app
    @set_api = @set.api
  end

  describe '#migrate' do
    it 'maps to put_stack api method' do
      @set_api.should_receive :put_stack
      @set.migrate 'cedar'
    end
  end
end
